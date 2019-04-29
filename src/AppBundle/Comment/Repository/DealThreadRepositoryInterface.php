<?php

namespace AppBundle\Comment\Repository;

use AppBundle\Entity\Deal;
use AppBundle\Entity\DealThread;
use AppBundle\Exception\EntityNotFoundException;

/**
 *
 * @author Manuel Aguirre
 */
interface DealThreadRepositoryInterface
{
    /**
     * @param Deal $deal
     * @return DealThread
     *
     * @throws EntityNotFoundException
     */
    public function getThreadByDeal(Deal $deal);

    /**
     * @param $id
     * @return DealThread
     * @throws EntityNotFoundException
     */
    public function getThreadByDealId($id);
}


