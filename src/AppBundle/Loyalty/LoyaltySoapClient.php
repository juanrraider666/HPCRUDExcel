<?php

namespace AppBundle\Loyalty;

use AppBundle\Soap\DealSoapClient;
use AppBundle\Util\Encrypter;


class LoyaltySoapClient extends DealSoapClient
{
    /**
     * @var string
     */
    private $apiKey;
    /**
     * @var string
     */
    private $namespace;

    /**
     * @var Encrypter
     */
    private $encrypter;

    /**
     * @var string
     */
    private $encrypterKey;

    /**
     * @inheritDoc
     */
    public function __construct(
        \SoapClient $soapClient,
        $apiKey,
        $namespace,
        Encrypter $encrypter,
        $encrypterKey
    ) {
        parent::__construct($soapClient);

        $this->apiKey = $apiKey;
        $this->namespace = $namespace;
        $this->encrypter = $encrypter;
        $this->encrypterKey = $encrypterKey;
    }

    public function getUserData($user_id)
    {
        $userData = $this->call('getUserData', ['id' => $user_id,], [], $this->getHeaders());

        return $this->resolveEncryptedData($userData);
    }

    public function getCompanyData($company_id)
    {
        $companyData = $this->call('getCompanyData', ['id' => $company_id,], [], $this->getHeaders());

        return $this->resolveEncryptedData($companyData);
    }

    public function getCompanyUserProfileData($company_id, $user_id, $profile_id)
    {
        $data = $this->call('getCompanyUserProfileData',
            ['company' => $company_id, 'user' => $user_id, 'profile' => $profile_id,], [],
            $this->getHeaders()
        );

        return $this->resolveEncryptedData($data);
    }

    public function sendEmailToUser($template, $locale, $user, $company = null, $variables = null)
    {
        $result = $this->call('sendEmailToUser', array(
            'template' => $template,
            'locale' => $locale,
            'user' => $user,
            'company' => $company,
            'variables' => $variables,
        ), [],
            $this->getHeaders()
        );

        return $result;
    }

    public function sendEmailToAdmin($template, $locale, $company, $variables = null)
    {
        $result = $this->call('sendEmailToAdmin', array(
            'template' => $template,
            'locale' => $locale,
            'company' => $company,
            'variables' => $variables,
        ), [],
            $this->getHeaders()
        );

        return $result;
    }

    public function sendEmailToOwner($template, $locale, $company, $variables = null)
    {
        $result = $this->call('sendEmailToOwner', array(
            'template' => $template,
            'locale' => $locale,
            'company' => $company,
            'variables' => $variables,
        ), [],
            $this->getHeaders()
        );

        return $result;
    }

    public function createBehaviorPoint(
        $company,
        $user = null,
        $profile,
        $points = 0,
        $description,
        $pointValueTypeName,
        $attributes = null
    ) {
        $result = $this->call('createBehaviorPoint', array(
            'company' => $company,
            'user' => $user,
            'profile' => $profile,
            'points' => $points,
            'description' => $description,
            'pointValueTypeName' => $pointValueTypeName,
            'attributes' => $attributes,
        ), [],
            $this->getHeaders()
        );

        return $this->safeUnserialize(base64_decode($result));
    }

    protected function getConnectionName()
    {
        return 'toshiba';
    }

    protected function getHeaders()
    {
        return [
            new \SoapHeader($this->namespace, 'api_key', $this->apiKey),
        ];
    }

    /**
     * @inheritDoc
     */
    protected function call(
        $function_name,
        array $arguments,
        array $options = null,
        $input_headers = null,
        array &$output_headers = null
    ) {
        $result = parent::call($function_name, $arguments, $options, $input_headers, $output_headers);

        return $result;
    }

    /**
     * @param string $data
     * @return mixed
     */
    protected function resolveEncryptedData($data)
    {
        $data = $this->safeUnserialize($this->encrypter->decrypt($data, $this->encrypterKey));

        return $data;
    }
}