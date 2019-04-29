<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Service;

use AppBundle\Entity\DealPoint;
use AppBundle\Entity\DealStatusLog;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealStatusPointMatcher
{
    public function matchStatus(DealStatusLog $statusLog, DealPoint $point)
    {
        return $statusLog->getNewStatus() === $point->getCreatedWithStatus();
    }
}