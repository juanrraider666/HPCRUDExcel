<?php

namespace Optime\Bundle\SimpleSsoClientBundle\Security\User;

use Optime\Bundle\SimpleSsoClientBundle\ExternalUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class ExternalUser implements UserInterface, ExternalUserInterface
{

    /**
     * @var string
     */
    private $username;

    /**
     * @var integer
     */
    private $userId;

    /**
     * @var string
     */
    private $firstName;

    /**
     * @var string
     */
    private $lastName;

    /**
     * @var string
     */
    private $email;

    /**
     * @var integer
     */
    private $companyId;

    /**
     * @var string
     */
    private $companyName;

    /**
     * @var string
     */
    private $taxId;

    /**
     * @var integer
     */
    private $countryId;

    /**
     * @var string
     */
    private $countryName;

    /**
     * @var integer
     */
    private $regionId;

    /**
     * @var string
     */
    private $regionName;

    /**
     * @var integer
     */
    private $companyTypeId;

    /**
     * @var string
     */
    private $companyTypeName;

    /**
     * @var integer
     */
    private $profileId;

    /**
     * @var string
     */
    private $profileName;

    /**
     * @var array
     */
    private $securityRoles;

    /**
     * ExternalUser constructor.
     * @param int $companyId
     * @param int $userId
     * @param int $profileId
     */
    public function __construct($companyId, $userId, $profileId)
    {
        $this->companyId = $companyId;
        $this->userId = $userId;
        $this->profileId = $profileId;
    }

    public static function createFromArray($companyId, $userId, $profileId, $data)
    {
        $user = new static($companyId, $userId, $profileId);

        isset($data['company']['name']) and $user->setCompanyName($data['company']['name']);
        isset($data['company']['tax_id']) and $user->setTaxId($data['company']['tax_id']);
        isset($data['company']['country_id']) and $user->setCountryId($data['company']['country_id']);
        isset($data['company']['country_name']) and $user->setCountryName($data['company']['country_name']);
        isset($data['company']['region_id']) and $user->setRegionId($data['company']['region_id']);
        isset($data['company']['region_name']) and $user->setRegionName($data['company']['region_name']);
        isset($data['company']['company_type_id']) and $user->setCompanyTypeId($data['company']['company_type_id']);
        isset($data['company']['company_type_name']) and $user->setCompanyTypeName($data['company']['company_type_name']);

        isset($data['user']['email']) and $user->setEmail($data['user']['email']);
        isset($data['user']['username']) and $user->setUsername($data['user']['username']);
        isset($data['user']['first_name']) and $user->setFirstName($data['user']['first_name']);
        isset($data['user']['last_name']) and $user->setLastName($data['user']['last_name']);

        isset($data['profile']['name']) and $user->setProfileName($data['profile']['name']);

        isset($data['security_roles']) and $user->setSecurityRoles($data['security_roles']);

        return $user;
    }

    /**
     * Set username
     *
     * @param string $username
     *
     * @return ExternalUser
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
     * @return int
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * @return string
     */
    public function getFirstName()
    {
        return $this->firstName;
    }

    /**
     * @param string $firstName
     */
    public function setFirstName($firstName)
    {
        $this->firstName = $firstName;
    }

    /**
     * @return string
     */
    public function getLastName()
    {
        return $this->lastName;
    }

    /**
     * @param string $lastName
     */
    public function setLastName($lastName)
    {
        $this->lastName = $lastName;
    }

    /**
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail($email)
    {
        $this->email = $email;
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
    public function getCompanyName()
    {
        return $this->companyName;
    }

    /**
     * @param string $companyName
     */
    public function setCompanyName($companyName)
    {
        $this->companyName = $companyName;
    }

    /**
     * @return string
     */
    public function getTaxId()
    {
        return $this->taxId;
    }

    /**
     * @param string $taxId
     */
    public function setTaxId($taxId)
    {
        $this->taxId = $taxId;
    }

    /**
     * @return int
     */
    public function getCountryId()
    {
        return $this->countryId;
    }

    /**
     * @param int $countryId
     */
    public function setCountryId($countryId)
    {
        $this->countryId = $countryId;
    }

    /**
     * @return string
     */
    public function getCountryName()
    {
        return $this->countryName;
    }

    /**
     * @param string $countryName
     */
    public function setCountryName($countryName)
    {
        $this->countryName = $countryName;
    }

    /**
     * @return int
     */
    public function getRegionId()
    {
        return $this->regionId;
    }

    /**
     * @param int $regionId
     */
    public function setRegionId($regionId)
    {
        $this->regionId = $regionId;
    }

    /**
     * @return int
     */
    public function getCompanyTypeId()
    {
        return $this->companyTypeId;
    }

    /**
     * @param int $companyTypeId
     */
    public function setCompanyTypeId($companyTypeId)
    {
        $this->companyTypeId = $companyTypeId;
    }

    /**
     * @return string
     */
    public function getCompanyTypeName()
    {
        return $this->companyTypeName;
    }

    /**
     * @param string $companyTypeName
     */
    public function setCompanyTypeName($companyTypeName)
    {
        $this->companyTypeName = $companyTypeName;
    }

    /**
     * @return string
     */
    public function getRegionName()
    {
        return $this->regionName;
    }

    /**
     * @param string $regionName
     */
    public function setRegionName($regionName)
    {
        $this->regionName = $regionName;
    }

    /**
     * @return int
     */
    public function getProfileId()
    {
        return $this->profileId;
    }

    /**
     * @return string
     */
    public function getProfileName()
    {
        return $this->profileName;
    }

    /**
     * @param string $profileName
     */
    public function setProfileName($profileName)
    {
        $this->profileName = $profileName;
    }

    public function getRoles()
    {
        return (array) $this->getSecurityRoles();
    }

    public function getRolesByProfile()
    {
        // TODO: posiblemente haya que implementar un factory del user o de los roles.
        switch ($this->profileId) {
            case 1:
                return ['ROLE_OPTIME_MASTER'];
            case 2:
                return ['ROLE_OPTIME_ADMIN'];
            case 10:
                return ['ROLE_PARTNER_PRINCIPAL'];
            case 11:
                return ['ROLE_PARTNER_ADMIN'];
            case 20:
                return ['ROLE_PROGRAM_ADMIN'];
            case 30:
                return ['ROLE_SALES'];
            case 31:
                return ['ROLE_USER'];
            case 32:
                return ['ROLE_USER'];
            default:
                return ['ROLE_USER'];
        }
    }

    public function getPassword()
    {
    }

    public function getSalt()
    {
    }

    public function eraseCredentials()
    {
    }

    /**
     * @return array
     */
    public function getSecurityRoles()
    {
        return $this->securityRoles;
    }

    /**
     * @param array $securityRoles
     * @return ExternalUser
     */
    public function setSecurityRoles($securityRoles)
    {
        $this->securityRoles = $securityRoles;

        return $this;
    }

    public function __toString()
    {
        return $this->getUsername();
    }
}

