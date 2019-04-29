<?php

namespace AppBundle\Loyalty\Mailer;


use AppBundle\Entity\EmailTemplate;

class TemplateConfig
{
    /**
     * @var string
     */
    private $templateCode;

    /**
     * @var array
     */
    private $variables;

    /**
     * TemplateConfig constructor.
     * @param EmailTemplate $emailTemplate
     */
    public function __construct(EmailTemplate $emailTemplate)
    {
        $this->setTemplateCode($emailTemplate->getCode());

        $variables = null != $emailTemplate->getVariables() ? $emailTemplate->getVariables() : [];

        $this->setVariables($variables);
    }

    /**
     * @param $templateCode
     */
    protected function setTemplateCode($templateCode)
    {
        $this->templateCode = $templateCode;
    }

    /**
     * @param array $variables
     */
    protected function setVariables($variables)
    {
        $this->variables = $variables;
    }

    /**
     * @return string
     */
    public function getTemplateCode()
    {
        return $this->templateCode;
    }

    /**
     * @param array $extraVariables
     * @return array
     */
    public function getVariables(array $extraVariables)
    {
        $variables = array_merge($extraVariables, $this->variables);

        return serialize($variables);
    }
}