<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Entity;

use AppBundle\Comment\Author;
use AppBundle\Comment\AuthorCommentInterface;
use Doctrine\ORM\Mapping as ORM;
use FOS\CommentBundle\Entity\Comment;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 *
 * @ORM\Entity(repositoryClass="AppBundle\Entity\Repository\DealCommentRepository")
 * @ORM\Table(name="deal_comments")
 */
class DealComment extends Comment implements AuthorCommentInterface
{
    /**
     * @var int
     *
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var DealThread
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\DealThread")
     */
    protected $thread;

    /**
     * @var Author
     *
     * @ORM\Embedded(class="AuthorComment")
     */
    protected $author;

    /**
     * @return Author
     */
    public function getAuthor()
    {
        return $this->author;
    }

    /**
     * @param Author $author
     */
    public function setAuthor(Author $author)
    {
        $this->author = $author;
    }
}