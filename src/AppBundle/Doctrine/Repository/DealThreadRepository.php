<?php

namespace AppBundle\Doctrine\Repository;

use AppBundle\Comment\Repository\DealThreadRepositoryInterface;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealThread;
use AppBundle\Exception\EntityNotFoundException;
use Doctrine\Common\Persistence\ObjectRepository;

/**
 * Description of DoctrineDealThreadRepository
 *
 * @author Manuel Aguirre
 */
class DealThreadRepository implements DealThreadRepositoryInterface
{
    /**
     * @var ObjectRepository
     */
    private $doctrineRepository;

    public function __construct(ObjectRepository $doctrineRepository)
    {
        $this->doctrineRepository = $doctrineRepository;
    }

    /**
     * @param Deal $deal
     * @return DealThread
     * @throws EntityNotFoundException
     */
    public function getThreadByDeal(Deal $deal)
    {
        return $this->getThreadByDealId($deal->getId());
    }

    /**
     * @param $id
     * @return DealThread
     * @throws EntityNotFoundException
     */
    public function getThreadByDealId($id)
    {
        if (!$thread = $this->doctrineRepository->find($id)) {
            throw new EntityNotFoundException("No existe el objeto thread relacionado con el deal ".$id);
        }

        return $thread;
    }
}
