<?php

namespace Optime\Bundle\SimpleSsoClientBundle\External;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class RemoteConnection implements RemoteConnectionInterface
{
    /**
     * @var string
     */
    private $username;

    /**
     * @var string
     */
    private $privateKey;

    /**
     * @var string
     */
    private $baseUrl;

    /**
     * RemoteConnection constructor.
     * @param string $username
     * @param string $privateKey
     * @param string $baseUrl
     */
    public function __construct($username, $privateKey, $baseUrl)
    {
        if(null == $username){
            throw new \InvalidArgumentException('El argumento "username" no puede estar vacio');
        }

        if(null == $privateKey){
            throw new \InvalidArgumentException('El argumento "privateKey" no puede estar vacio');
        }

        if(null == $baseUrl){
            throw new \InvalidArgumentException('El argumento "baseUrl" no puede estar vacio');
        }

        $this->username = $username;
        $this->privateKey = $privateKey;
        $this->baseUrl = $baseUrl;
    }

    /**
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * @return string
     */
    public function getPrivateKey()
    {
        return $this->privateKey;
    }

    /**
     * @return string
     */
    public function getLoginUrl()
    {
        return rtrim($this->baseUrl) . '/login';
    }

    /**
     * @return string
     */
    public function getVerificationUrl()
    {
        return rtrim($this->baseUrl) . '/verify';
    }
}
