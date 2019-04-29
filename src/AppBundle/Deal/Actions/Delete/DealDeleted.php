<?php

namespace AppBundle\Deal\Actions\Delete;


use AppBundle\Entity\Deal;
use Doctrine\ORM\EntityManager;

class DealDeleted
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

    public function setDealsDeleted(Deal $deal)
    {
        $deal->setStatus(Deal::CANCELED_STATE);
        
        $this->em->persist($deal);
        $this->em->flush();
        
        $id = $deal->getId();
        return $id;
    }

}