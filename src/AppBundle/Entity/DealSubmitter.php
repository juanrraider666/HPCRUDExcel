<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use AppBundle\Util\TimestampableEntity;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Submitter
 *
 * @ORM\Table(name="deal_submitter")
 * @ORM\Entity(repositoryClass="AppBundle\Entity\Repository\DealSubmitterRepository")
 */
class DealSubmitter
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
     * @var integer
     * @ Assert\NotBlank()
     * @ORM\Column(name="user_id", type="integer")
     */
    private $userId;

    /**
     * @var string
     *
     * @ORM\Column(name="user_name", type="string", length=255)
     */
    private $username;

    /**
     * @var string
     *
     * @ORM\Column(name="first_name", type="string", length=255)
     */
    private $firstName;

    /**
     * @var string
     *
     * @ORM\Column(name="last_name", type="string", length=255)
     */
    private $lastName;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=255)
     */
    private $email;

    /**
     * @var integer
     * @ Assert\NotBlank()
     * @ORM\Column(name="company_id", type="integer")
     */
    private $companyId;

    /**
     * @var string
     *
     * @ORM\Column(name="company_name", type="string", length=255)
     */
    private $companyName;

    /**
     * @var string
     *
     * @ORM\Column(name="tax_id", type="string", length=255, nullable=true)
     */
    private $taxId;

    /**
     * @var integer
     *
     * @ORM\Column(name="country_id", type="integer", nullable=true)
     */
    private $countryId;

    /**
     * @var string
     *
     * @ORM\Column(name="country_name", type="string", length=255, nullable=true)
     */
    private $countryName;

    /**
     * @var integer
     *
     * @ORM\Column(name="region_id", type="integer", nullable=true)
     */
    private $regionId;

    /**
     * @var string
     *
     * @ORM\Column(name="region_name", type="string", length=255, nullable=true)
     */
    private $regionName;

    /**
     * @var integer
     *
     * @ORM\Column(name="company_type_id", type="integer", nullable=true)
     */
    private $companyTypeId;

    /**
     * @var string
     *
     * @ORM\Column(name="company_type_name", type="string", length=255, nullable=true)
     */
    private $companyTypeName;

    /**
     * @var integer
     *
     * @ORM\Column(name="profile_id", type="integer")
     */
    private $profileId;

    /**
     * @var string
     *
     * @ORM\Column(name="profile_name", type="string", length=255)
     */
    private $profileName;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Loyalty")
     * @ORM\JoinColumn(name="loyalty_id", referencedColumnName="id")
     */
    private $loyalty;

    /**
     * @ORM\Column(name="language", type="string", length=5)
     */
    private $language;

    /**
     * @return mixed
     */
    public function getLanguage()
    {
        return $this->language;
    }

    /**
     * @param mixed $language
     */
    public function setLanguage($language)
    {
        $this->language = $language;
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
     * Set userId
     *
     * @param integer $userId
     * @return Submitter
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
     * @return Submitter
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
     * Set username
     *
     * @param string $username
     * @return DealSubmitter
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

    /**
     * Get username
     *
     * @return string 
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set firstName
     *
     * @param string $firstName
     * @return DealSubmitter
     */
    public function setFirstName($firstName)
    {
        $this->firstName = $firstName;

        return $this;
    }

    /**
     * Get firstName
     *
     * @return string 
     */
    public function getFirstName()
    {
        return $this->firstName;
    }

    /**
     * Set lastName
     *
     * @param string $lastName
     * @return DealSubmitter
     */
    public function setLastName($lastName)
    {
        $this->lastName = $lastName;

        return $this;
    }

    /**
     * Get lastName
     *
     * @return string 
     */
    public function getLastName()
    {
        return $this->lastName;
    }

    /**
     * Set email
     *
     * @param string $email
     * @return DealSubmitter
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string 
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set companyName
     *
     * @param string $companyName
     * @return DealSubmitter
     */
    public function setCompanyName($companyName)
    {
        $this->companyName = $companyName;

        return $this;
    }

    /**
     * Get companyName
     *
     * @return string 
     */
    public function getCompanyName()
    {
        return $this->companyName;
    }

    /**
     * Set taxId
     *
     * @param string $taxId
     * @return DealSubmitter
     */
    public function setTaxId($taxId)
    {
        $this->taxId = $taxId;

        return $this;
    }

    /**
     * Get taxId
     *
     * @return string 
     */
    public function getTaxId()
    {
        return $this->taxId;
    }

    /**
     * Set countryId
     *
     * @param integer $countryId
     * @return DealSubmitter
     */
    public function setCountryId($countryId)
    {
        $this->countryId = $countryId;

        return $this;
    }

    /**
     * Get countryId
     *
     * @return integer 
     */
    public function getCountryId()
    {
        return $this->countryId;
    }

    /**
     * Set countryName
     *
     * @param string $countryName
     * @return DealSubmitter
     */
    public function setCountryName($countryName)
    {
        $this->countryName = $countryName;

        return $this;
    }

    /**
     * Get countryName
     *
     * @return string 
     */
    public function getCountryName()
    {
        return $this->countryName;
    }

    /**
     * Set regionId
     *
     * @param integer $regionId
     * @return DealSubmitter
     */
    public function setRegionId($regionId)
    {
        $this->regionId = $regionId;

        return $this;
    }

    /**
     * Get regionId
     *
     * @return integer 
     */
    public function getRegionId()
    {
        return $this->regionId;
    }

    /**
     * Set regionName
     *
     * @param string $regionName
     * @return DealSubmitter
     */
    public function setRegionName($regionName)
    {
        $this->regionName = $regionName;

        return $this;
    }

    /**
     * Get regionName
     *
     * @return string 
     */
    public function getRegionName()
    {
        return $this->regionName;
    }

    /**
     * Set companyTypeId
     *
     * @param integer $companyTypeId
     * @return DealSubmitter
     */
    public function setCompanyTypeId($companyTypeId)
    {
        $this->companyTypeId = $companyTypeId;

        return $this;
    }

    /**
     * Get companyTypeId
     *
     * @return integer 
     */
    public function getCompanyTypeId()
    {
        return $this->companyTypeId;
    }

    /**
     * Set companyTypeName
     *
     * @param string $companyTypeName
     * @return DealSubmitter
     */
    public function setCompanyTypeName($companyTypeName)
    {
        $this->companyTypeName = $companyTypeName;

        return $this;
    }

    /**
     * Get companyTypeName
     *
     * @return string 
     */
    public function getCompanyTypeName()
    {
        return $this->companyTypeName;
    }

    /**
     * Set profileId
     *
     * @param integer $profileId
     * @return DealSubmitter
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
     * Set profileName
     *
     * @param string $profileName
     * @return DealSubmitter
     */
    public function setProfileName($profileName)
    {
        $this->profileName = $profileName;

        return $this;
    }

    /**
     * Get profileName
     *
     * @return string 
     */
    public function getProfileName()
    {
        return $this->profileName;
    }

    /**
     * Set loyalty
     *
     * @param \AppBundle\Entity\Loyalty $loyalty
     *
     * @return DealSubmitter
     */
    public function setLoyalty(\AppBundle\Entity\Loyalty $loyalty = null)
    {
        $this->loyalty = $loyalty;

        return $this;
    }

    /**
     * Get loyalty
     *
     * @return \AppBundle\Entity\Loyalty
     */
    public function getLoyalty()
    {
        return $this->loyalty;
    }

    public function __construct(User $user){

        $this->userId = $user->getId();
        //$this->companyId = $user->getCompanyId();
        //$this->profileId = $user->getProfileId();
        $this->username = $user->getUsername();
        $this->firstName = $user->getUsername();
        //$this->lastName = $user->getLastName();
        $this->email = $user->getEmail();
       // $this->companyName = $user->getCompanyName();
        //$this->taxId = $user->getTaxId();
       // $this->countryId = $user->getCountryId();
       // $this->countryName = $user->getCountryName();
        //$this->regionId = $user->getRegionId();
//        $this->regionName = $user->getRegionName();
//        $this->companyTypeId = $user->getCompanyTypeId();
//        $this->companyTypeName = $user->getCompanyTypeName();
//        $this->profileName = $user->getProfileName();
        
    }

}
