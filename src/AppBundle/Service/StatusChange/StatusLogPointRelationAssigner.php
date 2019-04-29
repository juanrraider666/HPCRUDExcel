<?php

namespace AppBundle\Service\StatusChange;

use AppBundle\Entity\Deal;
use AppBundle\Entity\DealPoint;
use AppBundle\Entity\Repository\DealStatusLogRepository;
use AppBundle\Service\DealStatusPointMatcher;
use AppBundle\Service\StatusChange\Exception\DealStatusLogAndPointMatchException;
use AppBundle\Service\StatusChange\Exception\DealStatusLogNotExistsException;

/**
 * Se encarga de relacional el DealStatusLog con los puntos generados al cambiar de status.
 *
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class StatusLogPointRelationAssigner
{
    /**
     * @var DealStatusLogRepository
     */
    private $dealStatusLogRepository;
    /**
     * @var DealStatusPointMatcher
     */
    private $matcher;

    /**
     * DealStatusLogPointRelationSubscriber constructor.
     * @param DealStatusLogRepository $dealStatusLogRepository
     */
    public function __construct(
        DealStatusLogRepository $dealStatusLogRepository,
        DealStatusPointMatcher $matcher
    ) {
        $this->dealStatusLogRepository = $dealStatusLogRepository;
        $this->matcher = $matcher;
    }

    public function createRelation(Deal $deal, DealPoint $point)
    {
        // El clone es para que no se modifique la fecha original.
        // $createdAfter = (clone $deal->getCreatedAt())->modify('-1 min');
        $log = $this->dealStatusLogRepository->getLastByDealIdAndStatus($deal->getId(), $deal->getStatus());

        if (!$log) {
            throw new DealStatusLogNotExistsException($deal, $deal->getStatus());
        }

        if (!$this->matcher->matchStatus($log, $point)) {
            throw new DealStatusLogAndPointMatchException($log, $point);
        }

        $log->setGeneratedPoints($point);
        $this->dealStatusLogRepository->save($log);
    }
}