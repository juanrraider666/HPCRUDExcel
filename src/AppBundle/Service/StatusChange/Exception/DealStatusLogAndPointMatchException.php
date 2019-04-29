<?php

namespace AppBundle\Service\StatusChange\Exception;

use AppBundle\Entity\DealPoint;
use AppBundle\Entity\DealStatusLog;
use AppBundle\Exception\EntityNotFoundException;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealStatusLogAndPointMatchException extends EntityNotFoundException
{
    public function __construct(DealStatusLog $log, DealPoint $point)
    {
        parent::__construct(sprintf(
            'El log de status "%s" no coincide con el status "%s" del punto "%d"',
            $log->getNewStatus(),
            $point->getCreatedWithStatus(),
            $point->getId()
        ));
    }
}