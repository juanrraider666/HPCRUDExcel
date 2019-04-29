<?php

namespace AppBundle\Entity;

use AppBundle\Deal\Approver\ApproverInterface;
use Doctrine\ORM\Mapping as ORM;

/**
 * DealApprover
 *
 * @ORM\Table(name="deal_approver")
 * @ORM\Entity(repositoryClass="AppBundle\Entity\Repository\DealApproverRepository")
 */
class DealApprover implements ApproverInterface
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="approver_id", type="integer")
     */
    private $approverId;

    /**
     * @var integer
     *
     * @ORM\Column(name="company_id", type="integer")
     */
    private $companyId;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string")
     */
    private $name;

    /**
     * @var Deal
     *
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\Deal")
     */
    private $deal;

    /**
     * @param Deal $deal
     * @param $approverId
     * @param $companyId
     * @param $name
     */
    public function __construct(Deal $deal, $approverId, $companyId, $name)
    {
        $this->deal = $deal;
        $this->approverId = $approverId;
        $this->companyId = $companyId;
        $this->name = $name;
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return int
     */
    public function getApproverId()
    {
        return $this->approverId;
    }

    /**
     * @return Deal
     */
    public function getDeal()
    {
        return $this->deal;
    }

    /**
     * @param Deal $deal
     */
    public function setDeal(Deal $deal)
    {
        $this->deal = $deal;
    }

    /**
     * @return int
     */
    public function getCompanyId()
    {
        return $this->companyId;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }
}

