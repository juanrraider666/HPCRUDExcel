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
interface ApproverInterface
{
    public function getApproverId();
    public function getCompanyId();
    public function getName();
}