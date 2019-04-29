<?php

namespace AppBundle\Entity\Repository;

use Doctrine\ORM\EntityRepository;


class EmailRepository extends EntityRepository
{
    public function getAllEmails(array $filter = array())
    {
        $query = $this->createQueryBuilder('email')
            ->select('email, emailTemplate')
            ->join('email.emailTemplate', 'emailTemplate');

        if (isset($filter['to'])) {
            $query->andWhere('email.recipients LIKE :to')
                ->setParameter('to', '%' . $filter['to'] . '%');
        }

        if (isset($filter['template'])) {
            $query->andWhere('emailTemplate.subject LIKE :template')
                ->setParameter('template', '%' . $filter['template'] . '%');
        }

        if (isset($filter['status'])) {
            $query->andWhere('email.status = :status')
                ->setParameter('status', $filter['status']);
        }

        return $query->getQuery();
    }
}
