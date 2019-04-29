<?php

namespace AppBundle\Entity\Repository;

use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Query;


class StateRepository extends EntityRepository
{
    public function findAllByCountry($country)
    {

        $query = $this->createQueryBuilder('state')
            ->where('state.country = :country')
            ->setParameter('country', $country)
            ->getQuery();

        return $query->getResult();
    }

    public function findAllByCountryAsArray($countryId)
    {
        $query = $this->createQueryBuilder('s')
            ->select('s.name,s.id')
            ->where('s.country = :country')
            ->andWhere('s.active = true')
            ->setParameter('country' , $countryId);

        return $query->getQuery()->getArrayResult();
    }
}