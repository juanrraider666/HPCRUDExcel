<?php

namespace AppBundle\Deal\DealExpired;


use AppBundle\Entity\Deal;
use Doctrine\ORM\EntityManager;

class DealExpired
{
    /**
     * @var EntityManager
     */
    private $em;

    /**
     * DealExpired constructor.
     * @param EntityManager $em
     */
    public function __construct(EntityManager $em)
    {
        $this->em = $em;
    }

    public function setDealsToExpiredState()
    {
        $deals = $this->em->getRepository('AppBundle:Deal')->findDealsExpired();

        $count = 0;

        foreach($deals as $deal){

            if(
                $deal->getStatus() != Deal::WON_STATE  &&
                $deal->getStatus() != Deal::LOSS_STATE &&
                $deal->getStatus() != Deal::CANCELED_STATE &&
                $deal->getStatus() != Deal::REJECTED_STATE
            ){
                $deal->setStatus(Deal::EXPIRED_STATE);
                $this->em->persist($deal);
                $this->em->flush();
                $count++;
            }
        }

        return $count;
    }

}