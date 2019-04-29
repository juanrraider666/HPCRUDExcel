<?php

namespace AppBundle\Mailer;

use AppBundle\Email\RenderedTemplate;
use AppBundle\Entity\EmailTemplate;
use Symfony\Component\EventDispatcher\Event;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class MailerEvent extends Event
{
    /**
     * @var RenderedTemplate
     */
    private $renderedTemplate;
    private $recipients;
    private $failedRecipients;
    private $successCount;

    /**
     * MailerEvent constructor.
     *
     * @param RenderedTemplate $renderedTemplate
     * @param                  $recipients
     * @param                  $failedRecipients
     * @param                  $successCount
     */
    public function __construct(
        RenderedTemplate $renderedTemplate,
        $recipients,
        $failedRecipients = array(),
        $successCount = 0
    ) {
        $this->renderedTemplate = $renderedTemplate;
        $this->recipients = $recipients;
        $this->failedRecipients = $failedRecipients;
        $this->successCount = $successCount;
    }

    /**
     * @return RenderedTemplate
     */
    public function getRenderedTemplate()
    {
        return $this->renderedTemplate;
    }

    /**
     * @return mixed
     */
    public function getSuccessCount()
    {
        return $this->successCount;
    }

    /**
     * @return mixed
     */
    public function getRecipients()
    {
        return $this->recipients;
    }

    /**
     * @return mixed
     */
    public function getFailedRecipients()
    {
        return $this->failedRecipients;
    }

}