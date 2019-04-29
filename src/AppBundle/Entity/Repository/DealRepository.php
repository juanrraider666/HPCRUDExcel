<?php

namespace AppBundle\Entity\Repository;

use AppBundle\Entity\Deal;
use AppBundle\Entity\DealInvoice;
use AppBundle\Entity\User;
use AppBundle\Entity\DealThread;
use Doctrine\DBAL\Types\Type;
use Doctrine\ORM\EntityRepository;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;


class DealRepository extends EntityRepository
{
    /**
     * @param ExternalUser $user
     * @param $userRole
     * @param array $filters
     * @return array
     */
    public function getTotalsDealsByUser(ExternalUser $user, $userRole, array $filters = [])
    {
        $query = $this->createQueryBuilder('deal')
            ->select('COUNT(deal) as cant, LOWER(deal.status) as status')
            ->join('deal.submitter', 'submitter')
            ->groupBy('deal.status');

        $this->addDealFilters($query, $user, $userRole, $filters);

        $summary = ['loss_and_cancelled' => 0];

        foreach ($query->getQuery()->getArrayResult() as $row) {
            $summary[$row['status']] = (int)$row['cant'];

            if (in_array($row['status'], [Deal::LOSS_STATE, Deal::CANCELED_STATE])) {
                $summary['loss_and_cancelled'] += (int)$row['cant'];
            }
        }

        return $summary;
    }

    /**
     * @param ExternalUser $user
     * @param array $filters
     * @return array
     */
    public function getDealsUserByStatus(ExternalUser $user, $userRole, array $filters = [])
    {
        $query = $this->createQueryBuilder('deal')
            ->select(
                'deal, company, project, submitter, attr_values,
                contact, phone, state, country'
            )
            ->join('deal.prospectus', 'company')
            ->join('deal.project', 'project')
            ->join('deal.submitter', 'submitter')
            ->leftJoin('deal.attributes', 'attr_values')
            ->join('company.contact', 'contact')
            ->join('contact.phone', 'phone')
            ->join('company.state', 'state')
            ->join('company.country', 'country')
            ->orderBy('deal.id', 'DESC');

        $this->addDealFilters($query, $user, $userRole, $filters);

        return $query->getQuery()->getResult();
    }

    public function getDealById($id)
    {
        $query = $this->createQueryBuilder('deal')
            ->join('deal.invoice', 'invoice')
            ->join('invoice.bussinesUnit','bussinesUnit')
            ->join('invoice.companyDistributorId','distributor')
            ->join('deal.user', 'user')
            ->join('user.dealCompany', 'company')
            ->join('company.company_type','company_type');
        $query->select('deal.id id,deal.status status,invoice.correlative,company.name companyName,company_type.name companyType,invoice.invoiceNumber,invoice.totalUnits,invoice.totalQuantity,invoice.factura, invoice.certificado,bussinesUnit.name tipoFactura,invoice.computo,invoice.purchaseInvoiceDate invoiceDate,distributor.name companyDistributor');
        $query->where('deal.id=:deal');
        $query->setParameter('deal', $id);

        return $query->getQuery()->getOneOrNullResult();
    }

    public function getDealAndSubmitterByDealId($id)
    {
        $query = $this->createQueryBuilder('deal')
            ->select('deal, submitter')
            ->join('deal.submitter', 'submitter')
            ->where('deal.id = :id')
            ->setParameter('id', $id);

        return $query->getQuery()->getOneOrNullResult();
    }

    public function findDealsExpired()
    {
        $query = $this->createQueryBuilder('deal')
            ->select('deal')
            ->where('deal.dateEnd <= :today');

        $query->andWhere($query->expr()->neq('deal.status', ':expired_state'));

        $query->setParameter('today', new \DateTime('now'), Type::DATETIME);
        $query->setParameter('expired_state', Deal::EXPIRED_STATE);

        return $query->getQuery()->getResult();
    }

    public function findDealsCloseToExpire($daysClose)
    {
        $dateClose = new \DateTime($daysClose);
        $today = new \DateTime('now');

        $query = $this->createQueryBuilder('deal')
            ->select('deal, submitter, loyalty')
            ->join('deal.submitter', 'submitter')
            ->join('submitter.loyalty', 'loyalty');

        $query->where($query->expr()->between('deal.dateEnd', ':today', ':date_close'));

        $query->andWhere($query->expr()->eq('deal.isCloseToExpiredNotified', ':isNotified'));

        $query->andWhere(
            $query->expr()->andX(
                $query->expr()->neq('deal.status', ':won_state'),
                $query->expr()->neq('deal.status', ':loss_state'),
                $query->expr()->neq('deal.status', ':cancelled_state')
            )
        );

        $query->setParameter('isNotified', false);
        $query->setParameter('today', $today, Type::DATETIME);
        $query->setParameter('date_close', $dateClose, Type::DATETIME);
        $query->setParameter('won_state', Deal::WON_STATE);
        $query->setParameter('loss_state', Deal::LOSS_STATE);
        $query->setParameter('cancelled_state', Deal::CANCELED_STATE);

        return $query->getQuery()->getResult();
    }

    /**
     * @param $query
     * @param ExternalUser $user
     * @param $userRole
     * @param array $filters
     */
    private function addDealFilters($query, ExternalUser $user, $userRole, array $filters)
    {
        if (in_array($userRole, ['ROLE_PARTNER_ADMIN'])) {
            $query->andWhere('submitter.companyId = :company_id')
                ->setParameter('company_id', $user->getCompanyId());
        } elseif (!in_array($userRole, ['ROLE_OPTIME_MASTER', 'ROLE_APPROVER'])) {
            // Si no es Partner, Approver o Optime Master, filtramos por usuario y empresa
            $query->andWhere('submitter.userId = :user_id')
                ->andWhere('submitter.companyId = :company_id')
                ->setParameter('user_id', $user->getUserId())
                ->setParameter('company_id', $user->getCompanyId());
        }

        if (isset($filters['status'])) {
            if (Deal::LOST_STATE === $filters['status']) {
                $query->andWhere('deal.status IN (:statuses)')
                    ->setParameter('statuses', [Deal::LOSS_STATE, Deal::CANCELED_STATE], Type::STRING);
            } else {
                $query->andWhere('deal.status = :status')
                    ->setParameter('status', $filters['status']);
            }
        }

        if (isset($filters['year'])) {
            $query->andWhere('YEAR(deal.createdAt) = :year')
                ->setParameter('year', $filters['year']);
        }

        if (isset($filters['month'])) {
            $query->andWhere('MONTH(deal.createdAt) = :month')
                ->setParameter('month', $filters['month']);
        }
    }

    /**
     * @param DealThread $thread
     * @return Deal|null
     */
    public function getByThread(DealThread $thread)
    {
        return $this->findOneById($thread->getId());
    }

    /**
     * @param User $user
     * @param array $filters
     * @return array
     */
    public function getTotalsInvoiceByUser(array $filters = [],$user,$sum = false,$role)
    {

        $query = $this->createQueryBuilder('deal')
            ->join('deal.invoice', 'invoice')
            ->join('invoice.bussinesUnit', 'bussinesUnit')
            ->join('invoice.companyDistributorId', 'companyDistributorId')
            ->join('deal.user', 'user')
            ->join('user.dealCompany', 'company')
            ->join('company.company_type','company_type');



        if (isset($filters['palabrasClave'])) {
            $query->Where('invoice.correlative LIKE :palabrasClave')
                ->setParameter('palabrasClave', '%'.$filters['palabrasClave'].'%');

            $query->orWhere('company.name LIKE :palabrasClave')
                ->setParameter('palabrasClave', '%'.$filters['palabrasClave'].'%');

            $query->orWhere('company_type.name LIKE :palabrasClave')
                ->setParameter('palabrasClave', '%'.$filters['palabrasClave'].'%');

            $query->orWhere('invoice.invoiceNumber LIKE :palabrasClave')
                ->setParameter('palabrasClave', '%'.$filters['palabrasClave'].'%');

            $query->orWhere('invoice.factura LIKE :palabrasClave')
                ->setParameter('palabrasClave', '%'.$filters['palabrasClave'].'%');
        }


        if (isset($filters['companyDistributor'])) {
            $query->orWhere('invoice.companyDistributorId = :companyDistributor')
                ->setParameter('companyDistributor',$filters['companyDistributor']->getId());
        }
        if ($role == 'ROLE_SUBMITTER' || $role == 'ROLE_USER'){
            $query->andWhere('deal.user = :user')
                ->setParameter('user', $user);
        }
        $query->andWhere('deal.status <> :deleted')
            ->andWhere('company.status = true')
            ->setParameter('deleted', Deal::CANCELED_STATE);

        if ($sum == false) {
            $query->select('
                deal.id id,deal.status status,invoice.computo as procesadores,invoice.computoWinPro as winPro,invoice.correlative,company.name companyName,company_type.name companyType,
                invoice.invoiceNumber,invoice.purchaseInvoiceDate, deal.createdAt created, invoice.totalUnits,invoice.totalQuantity,invoice.factura, invoice.certificado,
                bussinesUnit.name, companyDistributorId.name as disti,CONCAT(user.firstName, \' \', user.lastName) AS userName,user.email');
        }
        else{
            $query->select('SUM(invoice.totalQuantity) as SubTotal');
            $query->andWhere('deal.status <> :rejected')
                ->setParameter('rejected', Deal::REJECTED_STATE);
        }
        $query->orderBy('invoice.id','DESC');
        return $query->getQuery()->getResult();
    }
}
 