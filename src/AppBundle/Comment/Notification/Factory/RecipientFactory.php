<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Comment\Notification\Factory;

use AppBundle\Comment\Notification\Recipient;
use AppBundle\Deal\Approver\ApproverInterface;
use AppBundle\Entity\AuthorComment;
use AppBundle\Loyalty\LoyaltySoapClient;
use AppBundle\Entity\DealSubmitter;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class RecipientFactory
{
    /**
     * @var LoyaltySoapClient
     */
    private $loyaltyClient;

    /**
     * RecipientFactory constructor.
     * @param LoyaltySoapClient $loyaltyClient
     */
    public function __construct(LoyaltySoapClient $loyaltyClient)
    {
        $this->loyaltyClient = $loyaltyClient;
    }

    /**
     * @param DealSubmitter $submitter
     * @return Recipient
     */
    public function createFromSubmitter(DealSubmitter $submitter)
    {
        return new Recipient(
            $submitter->getFirstName().' '.$submitter->getLastName(),
            $submitter->getEmail(),
            $submitter->getUserId(),
            $submitter->getCompanyId()
        );
    }

    /**
     * @param ApproverInterface $approver
     * @return Recipient
     */
    public function createFromApprover(ApproverInterface $approver)
    {
        $data = $this->loyaltyClient->getUserData($approver->getApproverId());

        return new Recipient(
            $approver->getName(),
            $data['email'],
            $approver->getApproverId(),
            $approver->getCompanyId()
        );
    }

    /**
     * @param AuthorComment $author
     * @return Recipient
     */
    public function createFromAuthor(AuthorComment $author)
    {
        return new Recipient(
            $author->getName(),
            $author->getEmail(),
            $author->getExternalUserId(),
            $author->getExternalCompanyId()
        );
    }
}