<?php

namespace AppBundle\Status\Reader;

use AppBundle\Entity\Company;
use AppBundle\Entity\CompanyUserProfile;
use AppBundle\Entity\User;
use AppBundle\Status\StatusInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class CompanyReader implements StatusReaderInterface
{
    public function toString(StatusInterface $object)
    {
        return $this->integerToString($object->getStatus());
    }

    public function integerToString($status)
    {
        switch ($status) {
            case Company::STATUS_ACTIVE:
                return 'active';
            case Company::STATUS_INACTIVE:
                return 'inactive';
            case Company::STATUS_PENDING:
                return 'pending';
            case Company::STATUS_LOCKED:
                return 'locked';
        }
    }
}