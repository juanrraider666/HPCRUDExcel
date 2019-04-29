<?php

namespace AppBundle\Tests\Doctrine\EventListener;

use AppBundle\Comment\Author;
use AppBundle\Comment\Factory\AuthorFactoryInterface;
use AppBundle\Doctrine\EventListener\AuthorCommentAssignerListener;
use AppBundle\Entity\DealComment;
use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;
use Prophecy\Argument;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class AuthorCommentAssignerListenerTest extends \PHPUnit_Framework_TestCase
{
    private $authorFactory;
    private $user;
    /** @var  AuthorCommentAssignerListener */
    private $listener;
    private $token;
    private $tokenStorage;

    protected function setUp()
    {
        $this->token = $this->prophesize(TokenInterface::class);
        $this->user = $this->prophesize(ExternalUser::class);

        $this->token->getUser()->willReturn($this->user->reveal());

        $this->authorFactory = $this->prophesize(AuthorFactoryInterface::class);

        $this->tokenStorage = $this->prophesize(TokenStorageInterface::class);
        $this->tokenStorage->getToken()->willReturn($this->token->reveal());

        $this->listener = new AuthorCommentAssignerListener(
            $this->authorFactory->reveal(),
            $this->tokenStorage->reveal()
        );
    }

    public function testAssignAuthorFromToken()
    {
        $event = $this->createEventWithCommentMock($dealComment);
        $author = $this->createAuthor();
        $this->authorFactory->createFromExternalUser($this->user->reveal())->willReturn($author);

        $this->listener->prePersist($event->reveal());

        $dealComment->setAuthor($author)->shouldHaveBeenCalled();
    }

    public function testNotAssignAuthorWhenEntityIsNotAComment()
    {
        $event = $this->createEventWithOtherObjectMock();

        $this->authorFactory->createFromExternalUser($this->user->reveal())->shouldNotBeCalled();

        $this->listener->prePersist($event->reveal());
    }

    public function testNotAssignAuthorWhenLoggedUserIsNotAnExternalUser()
    {
        $this->token->getUser()->willReturn(new \stdClass());

        $event = $this->createEventWithCommentMock();
        $this->authorFactory->createFromExternalUser(Argument::any())->shouldNotBeCalled();

        $this->listener->prePersist($event->reveal());
    }

    public function testNotAssignAuthorWhenTokenIsNull()
    {
        $this->tokenStorage->getToken()->willReturn(null);

        $event = $this->createEventWithCommentMock($comment);
        $this->authorFactory->createFromExternalUser(Argument::any())->shouldNotBeCalled();
        $comment->setAuthor(Argument::cetera())->shouldNotBeCalled();

        $this->listener->prePersist($event->reveal());

    }

    /**
     * @return LifecycleEventArgs
     */
    protected function createEventWithCommentMock(&$dealComment = null)
    {
        $event = $this->prophesize(LifecycleEventArgs::class);
        $dealComment = $this->prophesize(DealComment::class);
        $event->getObject()->willReturn($dealComment->reveal());

        return $event;
    }

    /**
     * @return LifecycleEventArgs
     */
    protected function createEventWithOtherObjectMock()
    {
        $event = $this->prophesize(LifecycleEventArgs::class);
        $event->getObject()->willReturn(new \stdClass());

        return $event;
    }

    /**
     * @return object
     */
    protected function createAuthor()
    {
        $authorMock = $this->prophesize(Author::class);
        $author = $authorMock->reveal();

        return $author;
    }
}
