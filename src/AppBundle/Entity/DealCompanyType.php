<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * DealCompanyType
 *
 * @ORM\Table(name="deal_company_type")
 * @ORM\Entity
 */
class DealCompanyType
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
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=50)
     */
    private $name;

    /**
     * @var boolean
     *
     * @ORM\Column(name="visible", type="boolean")
     */
    private $visible;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created", type="datetime")
     */
    private $created;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="modified", type="datetime")
     */
    private $modified;

    /**
     * @var integer
     *
     * @ORM\Column(name="company_type_group_id", type="integer")
     */
    private $companyTypeGroupId;

    public function __toString()
    {
        return $this->getName();
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
     * Set name
     *
     * @param string $name
     *
     * @return DealCompanyType
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set visible
     *
     * @param boolean $visible
     *
     * @return DealCompanyType
     */
    public function setVisible($visible)
    {
        $this->visible = $visible;

        return $this;
    }

    /**
     * Get visible
     *
     * @return boolean
     */
    public function getVisible()
    {
        return $this->visible;
    }

    /**
     * Set created
     *
     * @param \DateTime $created
     *
     * @return DealCompanyType
     */
    public function setCreated($created)
    {
        $this->created = $created;

        return $this;
    }

    /**
     * Get created
     *
     * @return \DateTime
     */
    public function getCreated()
    {
        return $this->created;
    }

    /**
     * Set modified
     *
     * @param \DateTime $modified
     *
     * @return DealCompanyType
     */
    public function setModified($modified)
    {
        $this->modified = $modified;

        return $this;
    }

    /**
     * Get modified
     *
     * @return \DateTime
     */
    public function getModified()
    {
        return $this->modified;
    }

    /**
     * Set companyTypeGroupId
     *
     * @param integer $companyTypeGroupId
     *
     * @return DealCompanyType
     */
    public function setCompanyTypeGroupId($companyTypeGroupId)
    {
        $this->companyTypeGroupId = $companyTypeGroupId;

        return $this;
    }

    /**
     * Get companyTypeGroupId
     *
     * @return integer
     */
    public function getCompanyTypeGroupId()
    {
        return $this->companyTypeGroupId;
    }
}

