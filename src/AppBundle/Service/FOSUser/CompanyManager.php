<?php
/**
 * Created by PhpStorm.
 * User: WGONZALEZ
 * Date: 31/08/2017
 * Time: 11:49 AM
 */

namespace AppBundle\Service\FOSUser;

use AppBundle\Entity\DealCompany;
use Doctrine\Common\Persistence\ObjectManager;

class CompanyManager implements CompanyManagerInterface
{
    protected $objectManager;
    protected $class;
    protected $repository;

    public function __construct(ObjectManager $om, $class)
    {
        $this->objectManager = $om;
        $this->repository = $om->getRepository($class);

        $metadata = $om->getClassMetadata($class);
        $this->class = $metadata->getName();
    }

    /**
     * @param DealCompany $dealCompany
     * @return DealCompany
     */
    public function createDealCompany(DealCompany $dealCompany)
    {
        $this->objectManager->persist($dealCompany);
        $this->objectManager->flush();

        return $dealCompany;
    }
}