<?php

namespace AppBundle\Deal\Actions\Approver;


use AppBundle\Entity\Deal;
use Doctrine\ORM\EntityManager;

class DealApprove
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

    public function setDealsApproved(Deal $deal)
    {
        $deal->setStatus(Deal::APPROVED_STATE);
        
        $this->em->persist($deal);
        $this->em->flush();
        
        $id = $deal->getId();
        return $id;
    }

}