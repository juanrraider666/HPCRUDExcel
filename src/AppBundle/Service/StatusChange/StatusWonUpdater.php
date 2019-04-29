<?php

namespace AppBundle\Service\StatusChange;

use AppBundle\Deal\DealEventManager;
use AppBundle\Entity\Deal;
use Doctrine\ORM\EntityManagerInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class StatusWonUpdater
{
    /** @var EntityManagerInterface */
    private $em;
    /** @var DealEventManager */
    private $dealEventManager;

    /**
     * StatusWonUpdater constructor.
     * @param EntityManagerInterface $em
     * @param DealEventManager $dealEventManager
     */
    public function __construct(
        EntityManagerInterface $em,
        DealEventManager $dealEventManager
    ) {
        $this->em = $em;
        $this->dealEventManager = $dealEventManager;
    }

    public function changeStatus(Deal $deal)
    {
        $deal->setStatus(Deal::WON_STATE);
        $this->em->flush();

        $this->dealEventManager->dispatchEventByDealStatus($deal);
    }
}