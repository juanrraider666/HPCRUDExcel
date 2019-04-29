<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
namespace AppBundle\Deal\Approver\Resolver;

use AppBundle\Deal\Approver\ApproverInterface;
use AppBundle\Entity\Deal;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
interface ApproverResolverInterface
{
    /**
     * Devuelve el approver de la oportunidad dada, o null si
     * la oportunidad no tiene forma de saber quien la aprobará
     *
     * @param Deal $deal
     * @return ApproverInterface|null
     */
    public function getApprover(Deal $deal);
}