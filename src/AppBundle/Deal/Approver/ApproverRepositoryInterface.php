<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Deal\Approver;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
interface ApproverRepositoryInterface
{
    /**
     * Retorna el approver relacionado a una oportunidad o null si no se encuentra ninguno.
     *
     * @param int $id
     * @return ApproverInterface|null
     */
    public function findByDealId($id);
    public function save(ApproverInterface $approver, $flush = true);
}