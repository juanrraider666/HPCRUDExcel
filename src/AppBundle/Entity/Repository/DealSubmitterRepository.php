<?php

namespace AppBundle\Entity\Repository;

use Doctrine\ORM\EntityRepository;


class DealSubmitterRepository extends EntityRepository
{
    public function getCompanyTypes()
    {
        $em = $this->getEntityManager();

        $sql = "SELECT
                    ds.company_type_name,
                    ds.company_type_id
                FROM
                    deal_submitter ds
                GROUP BY
                    company_type_id";

        $stmt = $em->getConnection()->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();

        $companyTypes = array();

        foreach($result as $r){
            $companyTypes[$r['company_type_id']] = $r['company_type_name'];
        }

        return $companyTypes;
    }
}
