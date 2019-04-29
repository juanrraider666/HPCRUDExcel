<?php

namespace AppBundle\Entity\Repository;

use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Query;


class UserRepository extends EntityRepository
{
    public function findLastLogin()
    {

        $query = $this->createQueryBuilder('u')
            ->where('u.lastLogin IS NULL')
            ->getQuery();

        return $query->getResult();

    }

}