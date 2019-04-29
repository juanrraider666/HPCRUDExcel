<?php
/**
 * Created by PhpStorm.
 * User: WGONZALEZ
 * Date: 31/08/2017
 * Time: 11:52 AM
 */

namespace AppBundle\Service\FOSUser;

use AppBundle\Entity\DealCompany;

interface CompanyManagerInterface
{
    /**
     * @param DealCompany $dealCompany
     * @return DealCompany
     */
    public function createDealCompany(DealCompany $dealCompany);
}