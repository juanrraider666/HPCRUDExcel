<?php

namespace Optime\Bundle\SimpleSsoClientBundle\External;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
interface RemoteConnectionInterface
{
    /**
     * @return string
     */
    public function getUsername();

    /**
     * @return string
     */
    public function getPrivateKey();


    /**
     * @return string
     */
    public function getLoginUrl();

    /**
     * @return string
     */
    public function getVerificationUrl();
}