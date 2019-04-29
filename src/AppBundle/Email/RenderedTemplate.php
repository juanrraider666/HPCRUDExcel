<?php

namespace AppBundle\Email;

use AppBundle\Entity\EmailTemplate;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class RenderedTemplate
{
    /**
     * @var EmailTemplate
     */
    private $emailTemplate;
    /**
     * @var string
     */
    private $token;
    /**
     * @var string
     */
    private $htmlContent;
    /**
     * @var string
     */
    private $stringContent;
    /**
     * @var string
     */
    private $subject;

    /**
     * RenderedTemplate constructor.
     *
     * @param EmailTemplate $emailTemplate
     * @param string        $token
     * @param string        $htmlContent
     * @param string        $stringContent
     * @param string        $subject
     */
    public function __construct(EmailTemplate $emailTemplate, $token, $htmlContent, $stringContent, $subject)
    {
        $this->emailTemplate = $emailTemplate;
        $this->token = $token;
        $this->htmlContent = $htmlContent;
        $this->stringContent = $stringContent;
        $this->subject = $subject;
    }

    /**
     * @return EmailTemplate
     */
    public function getEmailTemplate()
    {
        return $this->emailTemplate;
    }

    /**
     * @return string
     */
    public function getToken()
    {
        return $this->token;
    }

    /**
     * @return string
     */
    public function getHtmlContent()
    {
        return $this->htmlContent;
    }

    /**
     * @return string
     */
    public function getStringContent()
    {
        return $this->stringContent;
    }

    /**
     * @return string
     */
    public function getSubject()
    {
        return $this->subject;
    }

    public function __toString()
    {
        return (string) $this->getHtmlContent();
    }


}