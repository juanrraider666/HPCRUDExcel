<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Deal\Approver\Service;

use AppBundle\Deal\Approver\ApproverRepositoryInterface;
use AppBundle\Deal\Approver\Exception\AlreadyApproverAssignedException;
use AppBundle\Deal\Approver\Exception\ApproverNotExistsException;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealApprover;
use AppBundle\Loyalty\LoyaltySoapClient;
use AppBundle\Soap\DealSoapException;
use Psr\Log\LoggerInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class ApproverAssigner
{
    /**
     * @var ApproverRepositoryInterface
     */
    private $approverRepository;
    /**
     * @var LoyaltySoapClient
     */
    private $client;
    /**
     * @var LoggerInterface
     */
    private $logger;

    /**
     * @param ApproverRepositoryInterface $approverRepository
     * @param LoyaltySoapClient $client
     * @param LoggerInterface|null $logger
     */
    public function __construct(
        ApproverRepositoryInterface $approverRepository,
        LoyaltySoapClient $client,
        LoggerInterface $logger = null
    ) {
        $this->approverRepository = $approverRepository;
        $this->client = $client;
        $this->logger = $logger;
    }

    public function createRelation(Deal $deal, $approverId, $companyId)
    {
        if ($this->approverRepository->findByDealId($deal->getId())) {
            throw new AlreadyApproverAssignedException(
                "The deal '{$deal->getId()}' is already related to the approver '{$approverId}''"
            );
        }

        try {
            if (!($userData = $this->client->getUserData($approverId))) {
                throw new ApproverNotExistsException("The Approver with id '{$approverId}' does not exists");
            }

            $approverName = $userData['first_name'].' '.$userData['last_name'];

            $this->approverRepository->save(new DealApprover(
                $deal,
                $approverId,
                $companyId,
                $approverName
            ));
        } catch (\Exception $e) {
            if (null !== $this->logger) {
                $this->logger->error("No se pudo relacionar el aprover al deal", ['exception' => $e->getMessage()]);
            }
        }
    }
}