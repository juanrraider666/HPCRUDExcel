<?php

namespace AppBundle\Loyalty\Mailer;



interface TemplateConfigResolverInterface
{
    /**
     * @param $condition
     * @param $recipient
     * @return TemplateConfig
     *
     * @throws \Exception
     */
    public function getByDealConditionAndRecipient($condition, $recipient);
}