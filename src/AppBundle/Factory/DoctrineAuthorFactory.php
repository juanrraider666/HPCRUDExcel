<?php

namespace AppBundle\Factory;

use AppBundle\Comment\Factory\AuthorFactoryInterface;
use AppBundle\Entity\AuthorComment;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DoctrineAuthorFactory implements AuthorFactoryInterface
{

    /**
     * @param ExternalUser $user
     * @return AuthorComment
     */
    public function createFromExternalUser(ExternalUser $user)
    {
        return new AuthorComment(
            $user->getUserId(),
            $user->getCompanyId(),
            $user->getProfileId(),
            $user->getEmail(),
            $user->getFirstName().' '.$user->getLastName(),
            $user->getProfileName(),
            $user->getCompanyName()
        );
    }
}