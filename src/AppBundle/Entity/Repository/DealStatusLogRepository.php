<?php

namespace AppBundle\Entity\Repository;


use AppBundle\Entity\Deal;
use AppBundle\Entity\DealStatusLog;
use Doctrine\ORM\EntityRepository;

class DealStatusLogRepository extends EntityRepository
{
    /**
     * Retorna el última log donde el cambio sea hacia aprobado o rechazado en el deal indicado.
     *
     * @param int $id
     * @return null|DealStatusLog
     */
    public function getLastApprovalOrRejectionByDealId($id)
    {
        return $this->findOneBy([
            'deal' => $id,
            'newStatus' => [Deal::APPROVED_STATE, Deal::REJECTED_STATE],
        ], ['id' => 'DESC']);
    }

    /**
     * Retorna el item más nuevo en base al id del deal, y que su fecha de creación sea superior a la
     * fecha indicada como parametro.
     *
     * @param int $id
     * @param null|\DateTime|string $createdAfterDate
     * @return null|DealStatusLog
     */
    public function getLastByDealIdAndStatus($id, $status, $createdAfterDate = null)
    {
        $queryBuilder = $this->createQueryBuilder('log')
            ->setMaxResults(1)
            ->orderBy('log.id', 'DESC')
            ->where('log.deal = :deal_id')
            ->andWhere('log.newStatus = :new_status')
            ->setParameter('deal_id', $id)
            ->setParameter('new_status', $status);

        if($createdAfterDate !== null){
            $queryBuilder
                ->andWhere('log.createdAt >= :created_after')
                ->setParameter('created_after', $createdAfterDate);
        }

        return $queryBuilder->getQuery()->getOneOrNullResult();
    }

    public function save(DealStatusLog $dealStatusLog)
    {
        $this->_em->persist($dealStatusLog);
        $this->_em->flush($dealStatusLog);
    }
}