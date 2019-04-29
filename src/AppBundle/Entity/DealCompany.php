<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use AppBundle\Util\TimestampableEntity;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * DealCompany
 *
 * @ORM\Table(name="deal_company")
 * @ORM\Entity(repositoryClass="AppBundle\Entity\Repository\DealCompanyRepository")
 */
class DealCompany
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
     * @Assert\NotBlank(groups={"newCompanyRegistration"}, message="label.cplease_company_name")
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var string
     * @Assert\NotBlank(groups={"newCompanyRegistration"}, message="label.please_address")
     *
     * @ORM\Column(name="address", type="text",nullable=true)
     */
    private $address;
    
    /**
     * @var integer
     *
     * @ORM\ManyToOne(targetEntity="DealCompanyType")
     * @ORM\JoinColumn(name="company_type", referencedColumnName="id")
     * @Assert\NotBlank(groups={"newCompanyRegistration"}, message="label.please_type_company")
     */
    private $company_type;
    

    /**
     * @Assert\NotBlank(groups={"newCompanyRegistration"}, message="label.please_city")
     *
     * @ORM\ManyToOne(targetEntity="City")
     * @ORM\JoinColumn(name="city_id", referencedColumnName="id")
     */
    private $city;

    /**
     *
     * @ORM\ManyToOne(targetEntity="State")
     * @ORM\JoinColumn(name="state_id", referencedColumnName="id")
     */
    private $state;

    /**
     *
     * @ORM\ManyToOne(targetEntity="Country")
     * @ORM\JoinColumn(name="country_id", referencedColumnName="id")
     */
    private $country;

    /**
     * @var string
     * @ORM\Column(name="zip_code", type="string", length=20, nullable=true)
     */
    private $zipCode;

    /**
     * @var string
     * @Assert\Url(
     *    message = "La URL de la Website '{{ value }}' no es valida.",
     * )
     *
     * @ORM\Column(name="website", type="string", length=60, nullable=true)
     */
    private $website;

   /**
     * @ORM\OneToOne(targetEntity="DealCompanyContact", cascade={"persist"})
     * @ORM\JoinColumn(name="contact_id", referencedColumnName="id")
     * @ Assert\Type(type="AppBundle\Entity\DealCompanyContact")
     * @ Assert\Valid()
     */
    private $contact;
    /**
     * @var Collection
     *
     * @ORM\OneToMany(
     *  targetEntity="AppBundle\Entity\AttributeValueCompany",
     *  mappedBy="company",
     *  cascade={"all"},
     *  orphanRemoval=true
     * )
     */
    private $attributes;

    /**
     * @var boolean
     *
     * @ORM\Column(name="status", type="boolean")
     */
    private $status = true;

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
     * @return DealCompany
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
     * Set address
     *
     * @param string $address
     * @return DealCompany
     */
    public function setAddress($address)
    {
        $this->address = $address;

        return $this;
    }

    /**
     * Get address
     *
     * @return string 
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     * Set zipCode
     *
     * @param string $zipCode
     * @return DealCompany
     */
    public function setZipCode($zipCode)
    {
        $this->zipCode = $zipCode;

        return $this;
    }

    /**
     * Get zipCode
     *
     * @return string 
     */
    public function getZipCode()
    {
        return $this->zipCode;
    }

    /**
     * Set website
     *
     * @param string $website
     * @return DealCompany
     */
    public function setWebsite($website)
    {
        $this->website = $website;

        return $this;
    }

    /**
     * Get website
     *
     * @return string 
     */
    public function getWebsite()
    {
        return $this->website;
    }

   /**
     * Set contact
     *
     * @param \AppBundle\Entity\DealCompanyContact $contact
     * @return DealCompany
     */
    public function setContact(\AppBundle\Entity\DealCompanyContact $contact = null)
    {
        $this->contact = $contact;

        return $this;
    }

    /**
     * Get contact
     *
     * @return \AppBundle\Entity\DealCompanyContact
     */
    public function getContact()
    {
        return $this->contact;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->attributes = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add attributes
     *
     * @param \AppBundle\Entity\AttributeValueCompany $attributes
     * @return DealCompany
     */
    public function addAttribute(\AppBundle\Entity\AttributeValueCompany $attributes)
    {
        $this->attributes[] = $attributes;

        return $this;
    }

    /**
     * Remove attributes
     *
     * @param \AppBundle\Entity\AttributeValueCompany $attributes
     */
    public function removeAttribute(\AppBundle\Entity\AttributeValueCompany $attributes)
    {
        $this->attributes->removeElement($attributes);
    }

    /**
     * Get attributes
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getAttributes()
    {
        return $this->attributes;
    }
    
      /**
     * Set company_type
     *
     * @param \AppBundle\Entity\DealCompanyType $company_type
     * @return DealCompany
     */
    public function setCompanyType(\AppBundle\Entity\DealCompanyType $company_type = null)
    {
        $this->company_type = $company_type;

        return $this;
    }

    /**
     * Get company_type
     *
     * @return \AppBundle\Entity\DealCompanyType 
     */
    public function getCompanyType()
    {
        return $this->company_type;
    }
    

    /**
     * Set city
     *
     * @param \AppBundle\Entity\City $city
     * @return DealCompany
     */
    public function setCity(\AppBundle\Entity\City $city = null)
    {
        $this->city = $city;

        return $this;
    }

    /**
     * Get city
     *
     * @return \AppBundle\Entity\City 
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Set state
     *
     * @param \AppBundle\Entity\State $state
     * @return DealCompany
     */
    public function setState(\AppBundle\Entity\State $state = null)
    {
        $this->state = $state;

        return $this;
    }

    /**
     * Get state
     *
     * @return \AppBundle\Entity\State 
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * Set country
     *
     * @param \AppBundle\Entity\Country $country
     * @return DealCompany
     */
    public function setCountry(\AppBundle\Entity\Country $country = null)
    {
        $this->country = $country;

        return $this;
    }

    /**
     * Get country
     *
     * @return \AppBundle\Entity\Country 
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * @return boolean
     */
    public function isStatus()
    {
        return $this->status;
    }

    /**
     * @param boolean $status
     */
    public function setStatus($status)
    {
        $this->status = $status;
    }

    public function __toString()
    {
        return $this->getName();
    }
}
