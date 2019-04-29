<?php

namespace AppBundle\Comment\Notification;

use AppBundle\Comment\Service\CommentMailer;
use AppBundle\Entity\DealComment;
use AppBundle\Entity\Repository\DealRepository;

/**
 * Esta clase se encargará de notificar a los usuarios involucrados en un hilo de comentario
 *
 * Los usuarios involucrados son:
 *
 * El Submitter.
 * El Approver (Si lo hay).
 * Todas las personas que hayan comentado.
 *
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class CommentNotifier
{
    /**
     * @var DealRepository
     */
    private $dealRepository;
    /**
     * @var RecipientResolver
     */
    private $recipientResolver;
    /**
     * @var CommentMailer
     */
    private $mailer;

    /**
     * CommentNotifier constructor.
     * @param DealRepository $dealRepository
     */
    public function __construct(
        DealRepository $dealRepository,
        RecipientResolver $recipientResolver,
        CommentMailer $mailer
    ) {
        $this->dealRepository = $dealRepository;
        $this->recipientResolver = $recipientResolver;
        $this->mailer = $mailer;
    }

    public function notify(DealComment $comment)
    {
        $deal = $this->dealRepository->getByThread($comment->getThread());

        $recipients = $this->recipientResolver->resolveRecipients(
            $comment->getThread(), $comment->getAuthor(), $deal
        );

        foreach ($recipients as $recipient) {
            $this->mailer->send($recipient, $comment, $deal);
        }
    }
}