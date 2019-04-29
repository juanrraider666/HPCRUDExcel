<?php

namespace AppBundle\Entity\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * DealCompanyRepository
 *
 * This class was generated by the PhpStorm "Php Annotations" Plugin. Add your own custom
 * repository methods below.
 */
class DealCompanyRepository extends EntityRepository
{
    public function findAllByCompanyType($companyTypeId)
    {
        return $this->createQueryBuilder('dc')
            ->select('dc.name,dc.id')
            ->where('dc.company_type = :companyTypeId')
            ->andWhere('dc.status = true')
            ->setParameter('companyTypeId' , $companyTypeId)
            ->getQuery()->getArrayResult();
    }
}