<?php

namespace AppBundle\Comment\Factory;

use AppBundle\Comment\Author;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
interface AuthorFactoryInterface
{
    /**
     * @param ExternalUser $user
     * @return Author
     */
    public function createFromExternalUser(ExternalUser $user);
}