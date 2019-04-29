<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Comment\EventListener;

use AppBundle\Comment\EventListener\SendMailListener;
use AppBundle\Comment\Notification\CommentNotifier;
use AppBundle\Entity\DealComment;
use FOS\CommentBundle\Event\CommentEvent;
use FOS\CommentBundle\Model\CommentInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class SendMailListenerTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var SendMailListener
     */
    private $listener;
    /** @var CommentNotifier */
    private $notifier;

    public function setUp()
    {
        $this->notifier = $this->prophesize(CommentNotifier::class);

        $this->listener = new SendMailListener(
            $this->notifier->reveal()
        );
    }

    public function testSend()
    {
        $comment = $this->prophesize(DealComment::class);
        $event = $this->prophesize(CommentEvent::class);
        $event->getComment()->shouldBeCalled()->willReturn($comment->reveal());

        $this->notifier->notify($comment->reveal())->shouldBeCalled();

        $this->listener->onCreatedComment($event->reveal());
    }

    public function testNoDealCommentInstance()
    {
        $comment = $this->prophesize(CommentInterface::class);

        $event = $this->prophesize(CommentEvent::class);
        $event->getComment()->shouldBeCalled()->willReturn($comment->reveal());

        $this->notifier->notify($comment->reveal())->shouldNotBeCalled();

        $this->listener->onCreatedComment($event->reveal());
    }
}
