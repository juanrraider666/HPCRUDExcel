<?php

namespace AppBundle\Service\StatusChange\Exception;

use AppBundle\Entity\Deal;
use AppBundle\Exception\EntityNotFoundException;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealStatusLogNotExistsException extends EntityNotFoundException
{
    public function __construct(Deal $deal, $status)
    {
        parent::__construct(sprintf('No se encontró un log de estatus "%s" en el deal "%d"', $status, $deal->getId()));
    }
}