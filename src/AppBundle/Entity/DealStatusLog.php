<?php

namespace AppBundle\Entity;

use AppBundle\Util\TimestampableEntity;
use Doctrine\ORM\Mapping as ORM;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;
use AppBundle\Entity\User;

/**
 * DealStatus
 *
 * @ORM\Table(name="deal_status_log")
 * @ORM\Entity(repositoryClass="AppBundle\Entity\Repository\DealStatusLogRepository")
 */
class DealStatusLog
{
    use TimestampableEntity;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="old_status", type="string", length=255, nullable=true)
     */
    private $oldStatus;

    /**
     * @var string
     *
     * @ORM\Column(name="new_status", type="string", length=255)
     */
    private $newStatus;

    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer")
     */
    private $userId;

    /**
     * @var integer
     *
     * @ORM\Column(name="company_id", type="integer")
     */
    private $companyId;

    /**
     * @var integer
     *
     * @ORM\Column(name="profile_id", type="integer")
     */
    private $profileId;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Deal")
     * @ORM\JoinColumn(name="deal_id", referencedColumnName="id")
     */
    private $deal;

    /**
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\DealPoint")
     * @ORM\JoinColumn(name="deal_point_id", referencedColumnName="id")
     */
    private $generatedPoints;

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
     * @return string
     */
    public function getOldStatus()
    {
        return $this->oldStatus;
    }

    /**
     * @param string $oldStatus
     */
    public function setOldStatus($oldStatus)
    {
        $this->oldStatus = $oldStatus;
    }

    /**
     * @return string
     */
    public function getNewStatus()
    {
        return $this->newStatus;
    }

    /**
     * @param string $newStatus
     */
    public function setNewStatus($newStatus)
    {
        $this->newStatus = $newStatus;
    }

    /**
     * Set userId
     *
     * @param integer $userId
     *
     * @return DealStatusLog
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Get userId
     *
     * @return integer
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set companyId
     *
     * @param integer $companyId
     *
     * @return DealStatusLog
     */
    public function setCompanyId($companyId)
    {
        $this->companyId = $companyId;

        return $this;
    }

    /**
     * Get companyId
     *
     * @return integer
     */
    public function getCompanyId()
    {
        return $this->companyId;
    }

    /**
     * Set profileId
     *
     * @param integer $profileId
     *
     * @return DealStatusLog
     */
    public function setProfileId($profileId)
    {
        $this->profileId = $profileId;

        return $this;
    }

    /**
     * Get profileId
     *
     * @return integer
     */
    public function getProfileId()
    {
        return $this->profileId;
    }

    /**
     * Set deal
     *
     * @param \AppBundle\Entity\Deal $deal
     *
     * @return DealStatusLog
     */
    public function setDeal(\AppBundle\Entity\Deal $deal = null)
    {
        $this->deal = $deal;

        return $this;
    }

    /**
     * Get deal
     *
     * @return \AppBundle\Entity\Deal
     */
    public function getDeal()
    {
        return $this->deal;
    }

    /**
     * @param Deal $deal
     * @param ExternalUser $user
     * @param array $data
     */
    public function setStatusChanged(Deal $deal, User $user, array $data)
    {
        $this->oldStatus = $data['old_status'];
        $this->newStatus = $data['new_status'];
        $this->userId = $user->getUserId();
        $this->companyId = $user->getCompanyId();
        $this->profileId = $user->getProfileId();
        $this->deal = $deal;
    }

    /**
     * @param Deal $deal
     * @param ExternalUser $user
     */
    public function setRegisteredState(Deal $deal)
    {
        $this->newStatus = $deal->getStatus();
        $this->companyId = $user->getCompanyId();
        $this->deal = $deal;
    }

    public function equalsTo($status)
    {
        return strtoupper($status) === strtoupper($this->getNewStatus());
    }

    /**
     * @return mixed
     */
    public function getGeneratedPoints()
    {
        return $this->generatedPoints;
    }

    /**
     * @param mixed $generatedPoints
     */
    public function setGeneratedPoints($generatedPoints)
    {
        $this->generatedPoints = $generatedPoints;
    }
}
