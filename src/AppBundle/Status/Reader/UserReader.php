<?php

namespace AppBundle\Status\Reader;

use AppBundle\Entity\Company;
use AppBundle\Entity\CompanyUserProfile;
use AppBundle\Entity\User;
use AppBundle\Model\CompanyUserData;
use AppBundle\Status\StatusInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class UserReader implements StatusReaderInterface
{
    /**
     * @var CompanyUserData
     */
    private $companyUserData;

    /**
     * UserReader constructor.
     * @param CompanyUserData $companyUserData
     */
    public function __construct(CompanyUserData $companyUserData)
    {
        $this->companyUserData = $companyUserData;
    }

    public function toString(StatusInterface $object)
    {
        return $this->integerToString($object->getStatus());
    }

    public function integerToString($status)
    {
        switch ($status) {
            case User::STATUS_ACTIVE:
                return 'active';
            case User::STATUS_INACTIVE:
                return 'inactive';
            case User::STATUS_PENDING:
                return 'pending';
            case User::STATUS_LOCKED:
                return 'locked';
            case User::STATUS_UNREGISTERED:
                return 'pre_registered';
        }
    }

    public function getUserStatus(User $user, Company $company)
    {
        if ($user->getStatus() == User::STATUS_ACTIVE) {
            $pending = true;

            /** @var CompanyUserProfile $cup */
            foreach ($user->getCompanyUserProfiles() as $cup) {
                if ($cup->getCompany()->getId() == $company->getId()) {
                    if ($cup->getApproved() and $cup->getActive()) {
                        return User::STATUS_ACTIVE;
                    } elseif ($cup->getApproved()) {
                        $pending = false;
                    }
                }
            }

            return $pending ? User::STATUS_PENDING : User::STATUS_INACTIVE;
        }

        return $user->getStatus();
    }

    /**
     * @param User    $user
     * @param Company $company
     *
     * @return bool
     *
     * @deprecated Usar CompanyUserData::isApprovedUser($company, $user) en su lugar
     */
    public function isApprovedUser(User $user, Company $company)
    {
        $this->companyUserData->isApprovedUser($user, $company, false);
    }

    public function userToString(User $user, Company $company)
    {
        return $this->integerToString($this->getUserStatus($user, $company));
    }
}