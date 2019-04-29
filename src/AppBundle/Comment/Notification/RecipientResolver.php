<?php

namespace AppBundle\Comment\Notification;

use AppBundle\Comment\Notification\Factory\RecipientFactory;
use AppBundle\Comment\Repository\AuthorRepositoryInterface;
use AppBundle\Deal\Approver\ApproverInterface;
use AppBundle\Deal\Approver\ApproverRepositoryInterface;
use AppBundle\Entity\AuthorComment;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealSubmitter;
use AppBundle\Entity\DealThread;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class RecipientResolver
{
    /**
     * @var AuthorRepositoryInterface
     */
    private $authorRepository;
    /**
     * @var ApproverRepositoryInterface
     */
    private $approverRepository;
    /**
     * @var RecipientFactory
     */
    private $recipientFactory;

    /**
     * RecipientResolver constructor.
     * @param AuthorRepositoryInterface $authorRepository
     * @param ApproverRepositoryInterface $approverRepository
     * @param RecipientFactory $recipientFactory
     */
    public function __construct(
        AuthorRepositoryInterface $authorRepository,
        ApproverRepositoryInterface $approverRepository,
        RecipientFactory $recipientFactory
    ) {
        $this->authorRepository = $authorRepository;
        $this->approverRepository = $approverRepository;
        $this->recipientFactory = $recipientFactory;
    }

    /**
     * @param DealThread $thread
     * @param AuthorComment $author
     * @param Deal $deal
     *
     * @return Recipient[]|\Generator
     */
    public function resolveRecipients(DealThread $thread, AuthorComment $author, Deal $deal)
    {
        $authors = $this->authorRepository->findAllByThreadWithoutAuthor($thread, $author);

        $submitter = $deal->getSubmitter();
        $approver = $this->approverRepository->findByDealId($deal->getId());
        $recipients = [];

        foreach ($authors as $item) {
            $recipients[] = $this->recipientFactory->createFromAuthor($item);
        }

        //Si el author no es el submitter y no está entre los autores de comentarios, lo añadimos
        if (!$this->isAuthorEqualToSubmitter($author, $submitter) and
            !$this->userExistsInRecipients($submitter->getUserId(), $recipients)
        ) {
            $recipients[] = $this->recipientFactory->createFromSubmitter($submitter);
        }

        //Si el deal tiene un approver relacionado y el author no es el approver
        // y no está entre los autores de comentarios, lo añadimos
        if ($approver and !$this->isAuthorEqualToApprover($author, $approver) and
            !$this->userExistsInRecipients($approver->getApproverId(), $recipients)
        ) {
            $recipients[] = $this->recipientFactory->createFromApprover($approver);
        }

        return $recipients;
    }

    private function userExistsInRecipients($userId, $recipients)
    {
        /** @var Recipient $recipient */
        foreach ($recipients as $recipient) {
            if ($recipient->getUserId() == $userId) {
                return true;
            }
        }

        return false;
    }

    /**
     * @param AuthorComment $author
     * @param $submitter
     * @return bool
     */
    protected function isAuthorEqualToSubmitter(AuthorComment $author, DealSubmitter $submitter)
    {
        return $author->getExternalUserId() == $submitter->getUserId();
    }

    /**
     * @param AuthorComment $author
     * @param ApproverInterface $approver
     * @return bool
     */
    protected function isAuthorEqualToApprover(AuthorComment $author, ApproverInterface $approver)
    {
        return $author->getExternalUserId() == $approver->getApproverId();
    }
}