<?php

namespace AppBundle\Loyalty\Repository;

use AppBundle\Loyalty\LoyaltySoapClient;


class LoyaltyRepository
{
    /**
     * @var LoyaltySoapClient
     */
    private $loyaltyClient;

    public function __construct(LoyaltySoapClient $loyaltySoapClient = null){
        $this->loyaltyClient = $loyaltySoapClient;
    }

    public function getUserData($user_id)
    {
        if($this->loyaltyClient == null) return;

        $data = $this->loyaltyClient->getUserData($user_id);

        return $data;
    }

    public function getCompanyData($company_id)
    {
        if($this->loyaltyClient == null) return;

        $data = $this->loyaltyClient->getCompanyData($company_id);

        return $data;
    }

    public function getCompanyUserProfileData($company_id, $user_id, $profile_id)
    {
        if($this->loyaltyClient == null) return;

        $data = $this->loyaltyClient->getCompanyUserProfileData($company_id, $user_id, $profile_id);

        return $data;
    }
}