<?php

namespace AppBundle\Security\Role;

use AppBundle\Loyalty\LoyaltyIdentifierInterface;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\Role\RolesResolverInterface;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class LoyaltyRolesResolver implements RolesResolverInterface
{
    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;

    /**
     * @var RolesResolverInterface
     */
    private $defaultRolesResolver;

    /**
     * LoyaltyRolesResolver constructor.
     * @param LoyaltyIdentifierInterface $loyaltyIdentifier
     * @param RolesResolverInterface $defaultRolesResolver
     */
    public function __construct(
        LoyaltyIdentifierInterface $loyaltyIdentifier,
        RolesResolverInterface $defaultRolesResolver
    ) {
        $this->loyaltyIdentifier = $loyaltyIdentifier;
        $this->defaultRolesResolver = $defaultRolesResolver;
    }

    public function getRoles(UserInterface $user)
    {
        $loyalty = $this->loyaltyIdentifier->getActiveLoyalty();
        $loyaltyRolesConfig = $loyalty->getConfiguration('roles');

        if (null !== $loyaltyRolesConfig) {
            return $this->getRemappedRoles($user, $loyaltyRolesConfig);
        }

        return $this->defaultRolesResolver->getRoles($user);
    }

    /**
     * @param UserInterface $user
     * @param $loyaltyRolesConfig
     * @return array
     */
    private function getRemappedRoles(UserInterface $user, $loyaltyRolesConfig)
    {
        $roles = $user->getRoles();

        foreach ($user->getRoles() as $userRole) {
            foreach ($loyaltyRolesConfig as $dealRole => $loyaltyRoles) {
                if ($this->isAMappedRole($userRole, $loyaltyRoles)) {
                    // Si el rol del usuario está configurado para ser mapeado,
                    // le agregamos el equivalente para nuestra app.
                    $roles[] = $dealRole;
                }
            }
        }

        return array_unique($roles);
    }

    /**
     * Devuelve verdadero si el rol indicado se encuentra entre los roles del arreglo
     *
     * @param string $userRole
     * @param array $loyaltyRoles
     * @return bool
     */
    private function isAMappedRole($userRole, $loyaltyRoles)
    {
        return in_array($userRole, $loyaltyRoles);
    }
}