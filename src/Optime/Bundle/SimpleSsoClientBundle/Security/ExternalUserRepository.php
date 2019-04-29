<?php

namespace Optime\Bundle\SimpleSsoClientBundle\Security;

use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\ServerException;
use Optime\Bundle\SimpleSsoClientBundle\External\RemoteConnectionInterface;
use Optime\Bundle\SimpleSsoClientBundle\ExternalUserInterface;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;
use Symfony\Component\Security\Core\Exception\AuthenticationCredentialsNotFoundException;
use Symfony\Component\Security\Core\Exception\UsernameNotFoundException;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class ExternalUserRepository
{
    /**
     * @var ClientInterface
     */
    private $httpClient;

    /**
     * @var RemoteConnectionInterface
     */
    private $remoteConnection;

    /**
     * SimpleSsoUserProvider constructor.
     * @param ClientInterface $httpClient
     * @param $password
     */
    public function __construct(ClientInterface $httpClient, RemoteConnectionInterface $remoteConnection)
    {
        $this->httpClient = $httpClient;
        $this->remoteConnection = $remoteConnection;
    }

    /**
     * @param $otp
     * @return ExternalUserInterface
     */
    public function find($otp)
    {
        $created = date('Ymdhis');
        $hash = base64_encode(sha1($otp.$created.$this->remoteConnection->getPrivateKey()));

        try {
            $response = $this->httpClient->post($this->remoteConnection->getLoginUrl(), [
                'body' => [
                    'otp' => $otp,
                    'created' => $created,
                    'password' => $hash,
                ],
            ]);
        } catch (ServerException $e) {
            throw new UsernameNotFoundException($e);
        }

        $data = unserialize(base64_decode($response->getBody()));

        $this->checkResponseData($data);

        return ExternalUser::createFromArray(
            $data['company']['id'],
            $data['user']['id'],
            $data['profile']['id'],
            $data
        );
    }

    /**
     * @param $data
     * @return mixed
     */
    protected function checkResponseData($data)
    {
        if (!isset($data['company']['id'])) {
            throw new AuthenticationCredentialsNotFoundException("Se esperaba el indice ['company']['id'] en la respuesta");
        }

        if (!isset($data['user']['id'])) {
            throw new AuthenticationCredentialsNotFoundException("Se esperaba el indice ['user']['id'] en la respuesta");
        }

        if (!isset($data['profile']['id'])) {
            throw new AuthenticationCredentialsNotFoundException("Se esperaba el indice ['profile']['id'] en la respuesta");
        }
    }
}