<?php

namespace AppBundle\Mailer;

use AppBundle\Email\EmailTemplateRenderer;
use AppBundle\Email\RenderedTemplate;
use AppBundle\MailerEvents;
use Doctrine\ORM\EntityNotFoundException;
use Psr\Log\LoggerInterface;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\EventDispatcher\GenericEvent;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class Mailer
{
    /**
     * @var \Swift_Mailer
     */
    private $swiftMailer;

    /**
     * @var EmailTemplateRenderer
     */
    private $emailTemplateRenderer;

    /**
     * @var string
     */
    private $fromEmail;

    /**
     * @var string
     */
    private $fromName;

    /**
     * @var array
     */
    private $options;

    /**
     * @var EventDispatcherInterface
     */
    protected $dispatcher;

    /**
     * @var LoggerInterface
     */
    protected $logger;

    /**
     * Mailer constructor.
     * @param \Swift_Mailer $swiftMailer
     * @param EmailTemplateRenderer $emailTemplateRenderer
     * @param string $fromEmail
     * @param string $fromName
     * @param array $options
     * @param EventDispatcherInterface $dispatcher
     * @param LoggerInterface $logger
     */
    public function __construct(
        \Swift_Mailer $swiftMailer,
        EmailTemplateRenderer $emailTemplateRenderer,
        $fromEmail,
        $fromName,
        EventDispatcherInterface $dispatcher,
        LoggerInterface $logger = null
    ) {
        $this->swiftMailer = $swiftMailer;
        $this->emailTemplateRenderer = $emailTemplateRenderer;
        $this->fromEmail = $fromEmail;
        $this->fromName = $fromName;
        $this->dispatcher = $dispatcher;
        $this->logger = $logger;
    }

    /**
     * @param \Swift_Message $message
     * @param $templateCode
     * @param array $variables
     * @param null $locale
     * @return int Numero de destinatarios a los que se le envi� el mensaje correctamente
     */
    public function send(\Swift_Message $message, $templateCode, array $variables = array(), $locale = null)
    {
        try {
            $variables['__email__'] = current($message->getTo());

            $renderedTemplate = $this->emailTemplateRenderer->getByCode($templateCode, $variables, $locale);

            $message
                ->setSubject($this->getSubject($renderedTemplate))
                ->setFrom($this->fromEmail, $this->fromName)
                ->setBody($renderedTemplate->getHtmlContent(), 'text/html');

            if ('' != trim($renderedTemplate->getStringContent())) {
                $message->addPart($renderedTemplate->getStringContent(), 'text/plain');
            }

            if (!count($message->getTo())) {
                throw new \LogicException('No se ha indicado ningun recipiente para el correo');
            }
             
            $this->dispatcher->dispatch(MailerEvents::PRE_SEND, new MailerEvent(
                $renderedTemplate, $message->getTo()
            ));
            
            $successCount = $this->swiftMailer->send($message, $failedRecipients);
            
            $this->dispatcher->dispatch(MailerEvents::POST_SEND, new MailerEvent(
                $renderedTemplate, $message->getTo(), $failedRecipients, $successCount
            ));

            return $successCount;
        } catch (\Exception $ex) {

            if (null !== $this->logger) {
                $this->logger->critical('No se pudo enviar el correo "{template_code}"', [
                    'template_code' => $templateCode,
                    'error' => $ex->getMessage(),
                ]);
            }
        }

        return 0;
    }

    /**
     * @param RenderedTemplate $renderedTemplate
     *
     * @return string
     */
    protected function getSubject(RenderedTemplate $renderedTemplate)
    {
        $groupName = trim($this->options['transactional_group_name']);

        if (0 !== strlen($groupName)) {
            return $renderedTemplate->getSubject().sprintf(' {%s}', $groupName);
        } else {
            return $renderedTemplate->getSubject();
        }
    }

}