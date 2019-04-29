<?php

namespace Optime\Bundle\SimpleSsoClientBundle\Security\Provider;

use Optime\Bundle\SimpleSsoClientBundle\Security\ExternalUserRepository;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class SimpleSsoUserProvider implements UserProviderInterface
{
    /**
     * @var ExternalUserRepository
     */
    private $externalUserRepository;

    /**
     * SimpleSsoUserProvider constructor.
     * @param ExternalUserRepository $externalUserRepository
     */
    public function __construct(ExternalUserRepository $externalUserRepository)
    {
        $this->externalUserRepository = $externalUserRepository;
    }

    public function loadUserByUsername($otp)
    {
        return $this->externalUserRepository->find($otp);
    }

    public function refreshUser(UserInterface $user)
    {
        return $user;
    }

    public function supportsClass($class)
    {
        $externalUserClass = 'Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser';

        return $class == $externalUserClass || is_subclass_of($class, $externalUserClass);
    }
}