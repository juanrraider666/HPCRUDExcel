<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Comment\Repository;

use AppBundle\Comment\Author;
use AppBundle\Entity\DealThread;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
interface AuthorRepositoryInterface
{
    public function findAllByThreadWithoutAuthor(DealThread $thread, Author $author);
}