<?php

namespace AppBundle\Deal\Actions\Rejected;


use AppBundle\Entity\Deal;
use Doctrine\ORM\EntityManager;

class DealRejected
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

    public function setDealsRejected(Deal $deal)
    {
        $deal->setStatus(Deal::REJECTED_STATE);
        
        $this->em->persist($deal);
        $this->em->flush();
        
        $id = $deal->getId();
        return $id;
    }

}