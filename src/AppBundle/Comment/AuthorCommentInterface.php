<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Comment;

use Optime\Bundle\SimpleSsoClientBundle\ExternalUserInterface;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
interface AuthorCommentInterface
{
    public function setAuthor(Author $author);
    public function getAuthor();
}