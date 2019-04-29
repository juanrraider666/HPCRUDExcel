<?php

namespace AppBundle\Doctrine\EventListener;

use AppBundle\Comment\Factory\AuthorFactoryInterface;
use AppBundle\Entity\DealComment;
use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;


/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class AuthorCommentAssignerListener
{
    /**
     * @var AuthorFactoryInterface
     */
    private $authorFactory;
    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;

    /**
     * @param AuthorFactoryInterface $authorFactory
     * @param TokenStorageInterface $tokenStorage
     */
    public function __construct(AuthorFactoryInterface $authorFactory, TokenStorageInterface $tokenStorage)
    {
        $this->authorFactory = $authorFactory;
        $this->tokenStorage = $tokenStorage;
    }

    public function prePersist(LifecycleEventArgs $event)
    {
        $comment = $event->getObject();

        if (!($comment instanceof DealComment)) {
            return;
        }

        if(!$token = $this->tokenStorage->getToken()){
            return;
        }

        $user = $token->getUser();

        if (!($user instanceof ExternalUser)) {
            return;
        }

        $author = $this->authorFactory->createFromExternalUser($user);

        $comment->setAuthor($author);
    }
}