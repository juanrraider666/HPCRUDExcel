<?php

namespace AppBundle\Doctrine\Repository;

use AppBundle\Comment\Author;
use AppBundle\Comment\Repository\AuthorRepositoryInterface;
use AppBundle\Entity\DealComment;
use AppBundle\Entity\DealThread;
use Doctrine\ORM\EntityManagerInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class AuthorRepository implements AuthorRepositoryInterface
{
    /** @var  EntityManagerInterface */
    private $em;

    /**
     * AuthorRepository constructor.
     * @param EntityManagerInterface $em
     */
    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    public function findAllByThreadWithoutAuthor(DealThread $thread, Author $author)
    {
        $dql = <<<DQL
SELECT comment FROM AppBundle:DealComment comment
JOIN comment.thread thread
WHERE
    thread.id = :thread
    AND comment.author.email != :author_email
Group By comment.author.email
DQL;

        $query = $this->em->createQuery($dql)
        ->setParameters([
            'author_email' => $author->getEmail(),
            'thread' => $thread->getId(),
        ]);

        $authors = [];

        /** @var DealComment $comment */
        foreach ($query->getResult() as $comment) {
            if($comment->getAuthor()->getEmail() !== $author->getEmail()){
                $authors[] = $comment->getAuthor();
            }
        }

        return $authors;
    }
}