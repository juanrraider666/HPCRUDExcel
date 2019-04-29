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

use AppBundle\Comment\Notification\Factory\RecipientFactory;
use AppBundle\Comment\Notification\Recipient;
use AppBundle\Comment\Notification\RecipientResolver;
use AppBundle\Comment\Repository\AuthorRepositoryInterface;
use AppBundle\Deal\Approver\ApproverInterface;
use AppBundle\Deal\Approver\ApproverRepositoryInterface;
use AppBundle\Entity\AuthorComment;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealSubmitter;
use AppBundle\Entity\DealThread;
use Prophecy\Argument;
use Prophecy\Prophecy\ObjectProphecy;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class RecipientResolverTest extends \PHPUnit_Framework_TestCase
{

    /**
     * @var RecipientResolver
     */
    private $resolver;
    /** @var AuthorRepositoryInterface */
    private $authorRepository;
    /** @var RecipientFactory */
    private $recipientFactory;
    /** @var ApproverRepositoryInterface */
    private $approverRepository;

    public function setUp()
    {
        $this->authorRepository = $this->prophesize(AuthorRepositoryInterface::class);
        $this->recipientFactory = $this->prophesize(RecipientFactory::class);
        $this->approverRepository = $this->prophesize(ApproverRepositoryInterface::class);

        $this->resolver = new RecipientResolver(
            $this->authorRepository->reveal(),
            $this->approverRepository->reveal(),
            $this->recipientFactory->reveal()
        );
    }

    /**
     * Si el autor del comentario es el mismo submitter, no debe añadirse a los recipientes
     */
    public function testCaseAuthorIsTheSubmitter()
    {
        $thread = $this->createThread();
        $author = $this->createAuthor(100);
        $deal = $this->createDeal(400, $submitter = $this->createSubmitter(100));

        $this->configureAuthorRepository($thread, $author, [
            $author1 = $this->prophesize(AuthorComment::class)->reveal(),
            $author2 = $this->prophesize(AuthorComment::class)->reveal(),
        ]);

        $this->approverRepository->findByDealId(400)->shouldBeCalled()->willReturn(null);

        $this->assertCreateFromAuthorShouldBeCalled([
            [$author1, ($recipient1 = $this->prophesize(Recipient::class))->reveal()],
            [$author2, ($recipient2 = $this->prophesize(Recipient::class))->reveal()],
        ]);

        $this->assertRecipientHasNotBeenCreatedFromSubmitter($submitter->reveal());
        $this->assertRecipientHasNotBeenCreatedFromApprover(Argument::type(ApproverInterface::class));

        $recipients = $this->resolver->resolveRecipients($thread->reveal(), $author->reveal(), $deal->reveal());

        $expectedRecipients = [
            $recipient1->reveal(),
            $recipient2->reveal(),
        ];

        $this->assertEquals($expectedRecipients, $recipients);
    }

    /**
     * Si el submitter está entre los autores, no se debe agregar como recipiente desde el
     * factory de submitters.
     */
    public function testCaseSubmitterInAuthorsAndAuthorIsNotTheSubmitter()
    {
        $thread = $this->createThread();
        $author = $this->createAuthor(100);
        $deal = $this->createDeal(400, $submitter = $this->createSubmitter(200));

        $author3 = $this->prophesize(AuthorComment::class);
        $author3->getExternalUserId()->willReturn(200); // El mismo del submitter.

        $this->configureAuthorRepository($thread, $author, [
            $author1 = $this->prophesize(AuthorComment::class)->reveal(),
            $author2 = $this->prophesize(AuthorComment::class)->reveal(),
            $author3->reveal(),
        ]);

        $this->approverRepository->findByDealId(400)->shouldBeCalled()->willReturn(null);

        $this->assertCreateFromAuthorShouldBeCalled([
            [$author1, ($recipient1 = $this->prophesize(Recipient::class))->reveal()],
            [$author2, ($recipient2 = $this->prophesize(Recipient::class))->reveal()],
            [$author3, ($recipient3 = $this->prophesize(Recipient::class))->reveal()],
        ]);

        $recipient3->getUserId()->willReturn(200); // El mismo del submitter

        $this->assertRecipientHasNotBeenCreatedFromSubmitter($submitter->reveal());
        $this->assertRecipientHasNotBeenCreatedFromApprover(Argument::type(ApproverInterface::class));

        $recipients = $this->resolver->resolveRecipients($thread->reveal(), $author->reveal(), $deal->reveal());

        $expectedRecipients = [
            $recipient1->reveal(),
            $recipient2->reveal(),
            $recipient3->reveal(),
        ];

        $this->assertEquals($expectedRecipients, $recipients);
    }

    /**
     * Si el submitter no está en el hilo de comentarios y el autor
     * del comentario actual no es el submitter, lo agregamos a los recipientes
     */
    public function testCaseSubmitterNotInAuthorsAndAuthorIsNotTheSubmitter()
    {
        $thread = $this->createThread();
        $author = $this->createAuthor(200);
        $deal = $this->createDeal(400, $submitter = $this->createSubmitter(100));

        $this->configureAuthorRepository($thread, $author, [
            $author1 = $this->prophesize(AuthorComment::class)->reveal(),
            $author2 = $this->prophesize(AuthorComment::class)->reveal(),
        ]);

        $this->approverRepository->findByDealId(400)->shouldBeCalled()->willReturn(null);

        $this->assertCreateFromAuthorShouldBeCalled([
            [$author1, $recipient1 = $this->prophesize(Recipient::class)->reveal()],
            [$author2, $recipient2 = $this->prophesize(Recipient::class)->reveal()],
        ]);

        $recipient3 = $this->assertRecipientHasBeenCreatedFromSubmitter($submitter->reveal());
        $this->assertRecipientHasNotBeenCreatedFromApprover(Argument::type(ApproverInterface::class));

        $recipients = $this->resolver->resolveRecipients($thread->reveal(), $author->reveal(), $deal->reveal());

        $expectedRecipients = [
            $recipient1,
            $recipient2,
            $recipient3,
        ];

        $this->assertEquals($expectedRecipients, $recipients);
    }

    /**
     * Si el approver no se encuentra entre los autores de comentarios (no ha enviado comentarios)
     * Y tampoco es el autor del comentario actual,
     * Debemos agregarlo a los recipientes del correo.
     */
    public function testCaseApproverNotInAuthorsAndAuthorIsNotTheApprover()
    {
        $thread = $this->createThread();
        $author = $this->createAuthor(200);
        $deal = $this->createDeal(400, $submitter = $this->createSubmitter(600));

        $this->configureAuthorRepository($thread, $author, [
            $author1 = $this->prophesize(AuthorComment::class)->reveal(),
            $author2 = $this->prophesize(AuthorComment::class)->reveal(),
        ]);

        $this->approverRepository->findByDealId(400)->shouldBeCalled()->willReturn(
            ($approver = $this->createApprover(100))->reveal()
        );

        $this->assertCreateFromAuthorShouldBeCalled([
            [$author1, $recipient1 = $this->prophesize(Recipient::class)->reveal()],
            [$author2, $recipient2 = $this->prophesize(Recipient::class)->reveal()],
        ]);

        $recipient3 = $this->assertRecipientHasBeenCreatedFromSubmitter($submitter->reveal());
        $recipient4 = $this->assertRecipientHasBeenCreatedFromApprover($approver->reveal());

        $recipients = $this->resolver->resolveRecipients($thread->reveal(), $author->reveal(), $deal->reveal());

        $expectedRecipients = [
            $recipient1,
            $recipient2,
            $recipient3,
            $recipient4,
        ];

        $this->assertEquals($expectedRecipients, $recipients);
    }

    /**
     * Si el approver no se encuentra entre los autores de comentarios (no ha enviado comentarios)
     * Pero es el autor del comentario actual,
     * NO debemos agregarlo a los recipientes del correo.
     */
    public function testCaseApproverNotInAuthorsAndAuthorIsTheApprover()
    {
        $thread = $this->createThread();
        $author = $this->createAuthor(200);
        $deal = $this->createDeal(400, $submitter = $this->createSubmitter(100));

        $this->configureAuthorRepository($thread, $author, [
            $author1 = $this->prophesize(AuthorComment::class)->reveal(),
            $author2 = $this->prophesize(AuthorComment::class)->reveal(),
        ]);

        $this->approverRepository->findByDealId(400)->shouldBeCalled()->willReturn(
            ($approver = $this->createApprover(200))->reveal()
        );

        $this->assertCreateFromAuthorShouldBeCalled([
            [$author1, $recipient1 = $this->prophesize(Recipient::class)->reveal()],
            [$author2, $recipient2 = $this->prophesize(Recipient::class)->reveal()],
        ]);

        $recipient3 = $this->assertRecipientHasBeenCreatedFromSubmitter($submitter->reveal());
        $this->assertRecipientHasNotBeenCreatedFromApprover($approver->reveal());

        $recipients = $this->resolver->resolveRecipients($thread->reveal(), $author->reveal(), $deal->reveal());

        $expectedRecipients = [
            $recipient1,
            $recipient2,
            $recipient3,
        ];

        $this->assertEquals($expectedRecipients, $recipients);
    }

    /**
     * Si el approver se encuentra entre los autores de comentarios (ha enviado comentarios)
     * NO debemos agregarlo a los recipientes del correo.
     */
    public function testCaseApproverInAuthors()
    {
        $thread = $this->createThread();
        $author = $this->createAuthor(200);
        $deal = $this->createDeal(400, $submitter = $this->createSubmitter(100));

        $author3 = $this->prophesize(AuthorComment::class);
        $author3->getExternalUserId()->willReturn(500);
        $this->configureAuthorRepository($thread, $author, [
            $author1 = $this->prophesize(AuthorComment::class)->reveal(),
            $author2 = $this->prophesize(AuthorComment::class)->reveal(),
            $author3->reveal(),
        ]);

        $this->approverRepository->findByDealId(400)->shouldBeCalled()->willReturn(
            ($approver = $this->createApprover(500))->reveal()
        );

        $this->assertCreateFromAuthorShouldBeCalled([
            [$author1, $recipient1 = $this->prophesize(Recipient::class)->reveal()],
            [$author2, $recipient2 = $this->prophesize(Recipient::class)->reveal()],
            [$author3, ($recipient3 = $this->prophesize(Recipient::class))->reveal()],
        ]);

        $recipient3->getUserId()->willReturn(500); // el mismo del approver

        $recipient4 = $this->assertRecipientHasBeenCreatedFromSubmitter($submitter->reveal());
        $this->assertRecipientHasNotBeenCreatedFromApprover($approver->reveal());

        $recipients = $this->resolver->resolveRecipients($thread->reveal(), $author->reveal(), $deal->reveal());

        $expectedRecipients = [
            $recipient1,
            $recipient2,
            $recipient3->reveal(),
            $recipient4,
        ];

        $this->assertEquals($expectedRecipients, $recipients);
    }

    /**
     * Si el approver y el submitter son la misma persona, no se debe agregar como
     * recipiente más de una vez.
     */
    public function testCaseApproverEqualToSubmitterAndNotInAuthors()
    {
        $thread = $this->createThread();
        $author = $this->createAuthor(200);
        $deal = $this->createDeal(400, $submitter = $this->createSubmitter(500));

        $this->configureAuthorRepository($thread, $author, [
            $author1 = $this->prophesize(AuthorComment::class)->reveal(),
            $author2 = $this->prophesize(AuthorComment::class)->reveal(),
        ]);

        $this->approverRepository->findByDealId(400)->shouldBeCalled()->willReturn(
            ($approver = $this->createApprover(500))->reveal()
        );

        $this->assertCreateFromAuthorShouldBeCalled([
            [$author1, $recipient1 = $this->prophesize(Recipient::class)->reveal()],
            [$author2, $recipient2 = $this->prophesize(Recipient::class)->reveal()],
        ]);

        $recipient3 = $this->assertRecipientHasBeenCreatedFromSubmitter($submitter->reveal());
        $this->assertRecipientHasNotBeenCreatedFromApprover($approver->reveal());

        $recipients = $this->resolver->resolveRecipients($thread->reveal(), $author->reveal(), $deal->reveal());

        $expectedRecipients = [
            $recipient1,
            $recipient2,
            $recipient3,
        ];

        $this->assertEquals($expectedRecipients, $recipients);
    }

    private function assertRecipientHasBeenCreatedFromSubmitter($submitter)
    {
        $recipient = $this->prophesize(Recipient::class);
        $this->recipientFactory->createFromSubmitter($submitter)
            ->shouldBeCalled()
            ->will(function ($args) use ($recipient) {
                $recipient->getUserId()->willReturn($args[0]->getUserId());

                return $recipient->reveal();
            });

        return $recipient->reveal();
    }

    private function assertRecipientHasNotBeenCreatedFromSubmitter($submitter)
    {
        $this->recipientFactory->createFromSubmitter($submitter)->shouldNotBeCalled();
        $this->recipientFactory->createFromSubmitter(null)->shouldNotBeCalled();
    }

    private function assertRecipientHasNotBeenCreatedFromApprover($approver)
    {
        $this->recipientFactory->createFromApprover($approver)->shouldNotBeCalled();
        $this->recipientFactory->createFromApprover(null)->shouldNotBeCalled();
    }

    private function assertRecipientHasBeenCreatedFromApprover($approver)
    {
        $recipient = $this->prophesize(Recipient::class);
        $this->recipientFactory->createFromApprover($approver)
            ->shouldBeCalled()
            ->will(function ($args) use ($recipient) {
                $recipient->getUserId()->willReturn($args[0]->getApproverId());

                return $recipient->reveal();
            });

        return $recipient->reveal();
    }

    /**
     * @param $id
     * @return \Prophecy\Prophecy\ObjectProphecy
     */
    protected function createAuthor($id)
    {
        $author = $this->prophesize(AuthorComment::class);
        $author->getExternalUserId()->willReturn($id);

        return $author;
    }

    /**
     * @param $id
     * @return \Prophecy\Prophecy\ObjectProphecy
     */
    protected function createDeal($id, ObjectProphecy $submitter)
    {
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn($id);
        $deal->getSubmitter()->willReturn($submitter->reveal());

        return $deal;
    }

    /**
     * @return \Prophecy\Prophecy\ObjectProphecy
     */
    protected function createThread()
    {
        $thread = $this->prophesize(DealThread::class);

        return $thread;
    }

    /**
     * @param $thread
     * @param $author
     * @param $authors
     */
    protected function configureAuthorRepository($thread, $author, $authors)
    {
        $this->authorRepository
            ->findAllByThreadWithoutAuthor($thread->reveal(), $author->reveal())
            ->willReturn($authors)
            ->shouldBeCalled();
    }

    /**
     * @param $author3
     * @param $recipient3
     */
    protected function assertCreateFromAuthorShouldBeCalled($items)
    {
        foreach ($items as $data) {
            $this->recipientFactory->createFromAuthor($data[0])->shouldBeCalled()->willReturn($data[1]);
        }
    }

    /**
     * @param $id
     * @return \Prophecy\Prophecy\ObjectProphecy
     */
    protected function createSubmitter($id)
    {
        $submitter = $this->prophesize(DealSubmitter::class);
        $submitter->getUserId()->willReturn($id);

        return $submitter;
    }

    /**
     * @param $id
     * @return ObjectProphecy
     */
    protected function createApprover($id)
    {
        $approver = $this->prophesize(ApproverInterface::class);
        $approver->getApproverId()->willReturn($id);

        return $approver;
    }
}
