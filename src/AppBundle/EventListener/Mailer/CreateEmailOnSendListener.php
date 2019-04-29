<?php

namespace AppBundle\EventListener\Mailer;

use AppBundle\Entity\Email;
use AppBundle\Entity\EmailTemplate;
use AppBundle\Mailer\MailerEvent;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Csrf\TokenGenerator\TokenGeneratorInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class CreateEmailOnSendListener
{
    /**
     * @var ObjectManager
     */
    private $em;

    /**
     * CreateEmailOnSendListener constructor.
     *
     * @param ObjectManager $em
     */
    public function __construct(ObjectManager $em) { $this->em = $em; }

    public function onPostSend(MailerEvent $event)
    {
        $renderedTemplate = $event->getRenderedTemplate();

        $email = new Email();

        $email->setEmailTemplate($renderedTemplate->getEmailTemplate());
        $email->setContent($renderedTemplate->getHtmlContent());
        $email->setRecipients($event->getRecipients());
        $email->setFailedRecipients($event->getFailedRecipients());
        $email->setStatus(Email::STATUS_CREATED);

        $email->setToken($renderedTemplate->getToken());

        $this->em->persist($email);
        $this->em->flush($email);
    }
}