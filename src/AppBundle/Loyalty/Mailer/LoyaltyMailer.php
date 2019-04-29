<?php

namespace AppBundle\Loyalty\Mailer;

use AppBundle\Loyalty\LoyaltySoapClient;


class LoyaltyMailer
{
    /**
     * @var LoyaltySoapClient
     */
    private $loyaltyClient;

    /**
     * LoyaltyMailer constructor.
     * @param LoyaltySoapClient $loyaltyClient
     */
    public function __construct(LoyaltySoapClient $loyaltyClient = null)
    {
        $this->loyaltyClient = $loyaltyClient;
    }

    public function sendEmailToUser($template, $locale, $user, $company = null, $variables = null)
    {
        if($this->loyaltyClient == null) return;

        $result = $this->loyaltyClient->sendEmailToUser($template, $locale, $user, $company, $variables);

        return $result;
    }

    public function sendEmailToAdmin($template, $locale, $company, $variables = null)
    {
        if($this->loyaltyClient == null) return;

        $result = $this->loyaltyClient->sendEmailToAdmin($template, $locale, $company, $variables);

        return $result;
    }

    public function sendEmailToOwner($template, $locale, $company, $variables = null)
    {
        if($this->loyaltyClient == null) return;

        $result = $this->loyaltyClient->sendEmailToOwner($template, $locale, $company, $variables);

        return $result;
    }

}