<?php

namespace AppBundle\Comment\EventListener;

use AppBundle\Comment\Notification\CommentNotifier;
use AppBundle\Entity\DealComment;
use FOS\CommentBundle\Event\CommentEvent;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class SendMailListener
{
    /**
     * @var CommentNotifier
     */
    private $notifier;

    /**
     * SendMailListener constructor.
     * @param CommentNotifier $notifier
     */
    public function __construct(
        CommentNotifier $notifier
    ) {
        $this->notifier = $notifier;
    }

    public function onCreatedComment(CommentEvent $event)
    {
        $comment = $event->getComment();

        if (!$comment instanceof DealComment) {
            return;
        }

        $this->notifier->notify($comment);
    }
}