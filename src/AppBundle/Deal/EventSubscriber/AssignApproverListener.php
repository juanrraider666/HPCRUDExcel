<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Deal\EventSubscriber;

use AppBundle\Deal\Approver\Exception\AlreadyApproverAssignedException;
use AppBundle\Deal\Approver\Service\ApproverAssigner;
use AppBundle\Deal\Event\ApprovedEvent;
use AppBundle\Deal\Event\RejectedEvent;
use AppBundle\Deal\Event\SubmissionEvent;
use AppBundle\Entity\Deal;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;
use Optime\Bundle\SimpleSsoClientBundle\ExternalUserInterface;
use Psr\Log\LoggerInterface;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class AssignApproverListener
{
    /**
     * @var ApproverAssigner
     */
    private $assigner;
    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;
    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;
    /**
     * @var LoggerInterface
     */
    private $logger;

    /**
     * AssignApproverListener constructor.
     * @param ApproverAssigner $assigner
     * @param TokenStorageInterface $tokenStorage
     */
    public function __construct(
        ApproverAssigner $assigner,
        LoyaltyIdentifierInterface $loyaltyIdentifier,
        TokenStorageInterface $tokenStorage,
        LoggerInterface $logger = null
    ) {
        $this->assigner = $assigner;
        $this->loyaltyIdentifier = $loyaltyIdentifier;
        $this->tokenStorage = $tokenStorage;
        $this->logger = $logger;
    }

    public function onDealApproved(ApprovedEvent $event)
    {
        $this->assignApproverFromLoggedUser($event->getDeal());
    }

    public function onDealRejected(RejectedEvent $event)
    {
        $this->assignApproverFromLoggedUser($event->getDeal());
    }

    /**
     * Establece el approver a la oportunidad cuando es creada.
     *
     * Solo se establece si se ha configurado el loyalty para tener un
     * approver por defecto.
     *
     * @param SubmissionEvent $event
     */
    public function onDealRegistered(SubmissionEvent $event)
    {
        $deal = $event->getDeal();
        $config = $this->loyaltyIdentifier->getActiveLoyalty()->getConfiguration('approver');

        if (!isset($config['id']) || !isset($config['company_id'])) {
            return;
        }

        $this->doAssign($deal, $config['id'], $config['company_id']);
    }

    /**
     * @param Deal $deal
     */
    protected function assignApproverFromLoggedUser(Deal $deal)
    {
        $user = $this->tokenStorage->getToken()->getUser();

        if (!$user instanceof ExternalUserInterface) {
            if ($this->logger) {
                $this->logger->warning(
                    sprintf(
                        'No se establece el aprover al deal, debido a que el usuario no es un %s',
                        ExternalUserInterface::class
                    ),
                    ['id' => $deal->getId()]);
            }

            return;
        }

        $this->doAssign($deal, $user->getUserId(), $user->getCompanyId());
    }

    /**
     * @param Deal $deal
     * @param $userId
     * @param $companyId
     */
    protected function doAssign(Deal $deal, $userId, $companyId)
    {
        try {
            $this->assigner->createRelation($deal, $userId, $companyId);
        } catch (AlreadyApproverAssignedException $e) {
            if ($this->logger) {
                $this->logger->warning('No se establece el aprover al deal, debido a que ya hay uno establecido');
            }
        }
    }
}