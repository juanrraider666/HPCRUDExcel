<?php

namespace AppBundle\Entity\Repository;

use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Query;


class CityRepository extends EntityRepository
{
    public function findAllByState($state)
    {

        $query = $this->createQueryBuilder('city')
            ->where('city.state = :state')
            ->setParameter('state', $state)
            ->getQuery();

        return $query->getResult();

    }
    public function findAllByStateAsArray($stateId)
    {
        return $this->createQueryBuilder('c')
            ->select('c.name,c.id')
            ->where('c.state = :state')
            ->andWhere('c.active = true')
            ->setParameter('state' , $stateId)
            ->getQuery()->getArrayResult();
    }
}