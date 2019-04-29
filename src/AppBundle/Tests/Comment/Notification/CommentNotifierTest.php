<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Comment\Notification;

use AppBundle\Comment\Notification\CommentNotifier;
use AppBundle\Comment\Notification\Recipient;
use AppBundle\Comment\Notification\RecipientResolver;
use AppBundle\Comment\Service\CommentMailer;
use AppBundle\Entity\AuthorComment;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealComment;
use AppBundle\Entity\DealThread;
use AppBundle\Entity\Repository\DealRepository;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class CommentNotifierTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var CommentNotifier
     */
    private $notifier;
    /** @var DealRepository */
    private $dealRepository;
    /** @var RecipientResolver */
    private $recipientResolver;
    /** @var CommentMailer */
    private $mailer;

    public function setUp()
    {
        $this->dealRepository = $this->prophesize(DealRepository::class);
        $this->recipientResolver = $this->prophesize(RecipientResolver::class);
        $this->mailer = $this->prophesize(CommentMailer::class);

        $this->notifier = new CommentNotifier(
            $this->dealRepository->reveal(),
            $this->recipientResolver->reveal(),
            $this->mailer->reveal()
        );
    }

    public function testSendMails()
    {
        $comment = $this->prophesize(DealComment::class);
        $thread = $this->prophesize(DealThread::class);
        $deal = $this->prophesize(Deal::class);

        $comment->getThread()->willReturn($thread->reveal());
        // Obtengo el deal
        $this->dealRepository->getByThread($thread->reveal())->willReturn($deal->reveal());

        // Obtener los demas autores involucrados en el hilo de comentarios.
        $author = $this->prophesize(AuthorComment::class);
        $comment->getAuthor()->willReturn($author->reveal());

        // Obtener un arreglo con los datos de los usuarios a los que se notificará.
        $recipients = $this->createRecipientsByQuantity(2);

        $this->recipientResolver->resolveRecipients($thread->reveal(), $author->reveal(), $deal->reveal())
            ->willReturn($recipients)->shouldBeCalled();

        // Notificar a cada usuario.
        foreach ($recipients as $recipient) {
            $this->mailer->send($recipient, $comment, $deal)->shouldBeCalled();
        }

        $this->notifier->notify($comment->reveal());
    }

    /**
     * @return array
     */
    protected function createRecipientsByQuantity($cant = 1)
    {
        $recipients = [];

        for ($x = 0; $x < $cant; $x++) {
            $recipients[] = $this->prophesize(Recipient::class)->reveal();
        }

        return $recipients;
    }

}
