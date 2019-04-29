<?php

namespace AppBundle\Entity;

use AppBundle\Util\TimestampableEntity;
use Doctrine\ORM\Mapping as ORM;
use gbenitez\Bundle\AttributeBundle\Entity\AttributeOwnerInterface;

/**
 * Loyalty
 *
 * @ORM\Table(name="loyalty")
 * @ORM\Entity(repositoryClass="AppBundle\Entity\Repository\LoyaltyRepository")
 */
class Loyalty implements AttributeOwnerInterface
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
     * @ORM\Column(name="code", type="string", length=20, unique=true)
     */
    private $code;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="wsdl", type="string", length=255)
     */
    private $wsdl;

    /**
     * @var string
     *
     * @ORM\Column(name="api_key", type="string", length=255)
     */
    private $apiKey;

    /**
     * @var string
     *
     * @ORM\Column(name="namespace", type="string", length=255)
     */
    private $namespace;

    /**
     * @var string
     *
     * @ORM\Column(name="encrypter_key", type="string", length=255)
     */
    private $encrypterKey;

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_active", type="boolean")
     */
    private $isActive;

    /**
     * @ORM\Column(name="sso_username", type="string", length=255)
     */
    private $ssoUsername;

    /**
     * @ORM\Column(name="sso_private_key", type="string", length=255)
     */
    private $ssoPrivateKey;

    /**
     * @ORM\Column(name="sso_base_url", type="string", length=255)
     */
    private $ssoBaseUrl;

    /**
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Country")
     * @ORM\JoinTable(name="loyalty_countries",
     *     joinColumns={@ORM\JoinColumn(name="loyalty_id", referencedColumnName="id")},
     *     inverseJoinColumns={@ORM\JoinColumn(name="country_id", referencedColumnName="id", unique=true)}
     * )
     */
    private $countries;

    /**
     * @ORM\Column(name="configuration", type="array", nullable=true)
     */
    private $configuration = [];

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
     * Set code
     *
     * @param string $code
     *
     * @return Loyalty
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set name
     *
     * @param string $name
     *
     * @return Loyalty
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
     * Set wsdl
     *
     * @param string $wsdl
     *
     * @return Loyalty
     */
    public function setWsdl($wsdl)
    {
        $this->wsdl = $wsdl;

        return $this;
    }

    /**
     * Get wsdl
     *
     * @return string
     */
    public function getWsdl()
    {
        return $this->wsdl;
    }

    /**
     * Set apiKey
     *
     * @param string $apiKey
     *
     * @return Loyalty
     */
    public function setApiKey($apiKey)
    {
        $this->apiKey = $apiKey;

        return $this;
    }

    /**
     * Get apiKey
     *
     * @return string
     */
    public function getApiKey()
    {
        return $this->apiKey;
    }

    /**
     * Set namespace
     *
     * @param string $namespace
     *
     * @return Loyalty
     */
    public function setNamespace($namespace)
    {
        $this->namespace = $namespace;

        return $this;
    }

    /**
     * Get namespace
     *
     * @return string
     */
    public function getNamespace()
    {
        return $this->namespace;
    }

    /**
     * Set encrypterKey
     *
     * @param string $encrypterKey
     *
     * @return Loyalty
     */
    public function setEncrypterKey($encrypterKey)
    {
        $this->encrypterKey = $encrypterKey;

        return $this;
    }

    /**
     * Get encrypterKey
     *
     * @return string
     */
    public function getEncrypterKey()
    {
        return $this->encrypterKey;
    }

    /**
     * @return boolean
     */
    public function isIsActive()
    {
        return $this->isActive;
    }

    /**
     * @param boolean $isActive
     */
    public function setIsActive($isActive)
    {
        $this->isActive = $isActive;
    }

    /**
     * @return mixed
     */
    public function getSsoUsername()
    {
        return $this->ssoUsername;
    }

    /**
     * @param mixed $ssoUsername
     */
    public function setSsoUsername($ssoUsername)
    {
        $this->ssoUsername = $ssoUsername;
    }

    /**
     * @return mixed
     */
    public function getSsoPrivateKey()
    {
        return $this->ssoPrivateKey;
    }

    /**
     * @param mixed $ssoPrivateKey
     */
    public function setSsoPrivateKey($ssoPrivateKey)
    {
        $this->ssoPrivateKey = $ssoPrivateKey;
    }

    /**
     * @return mixed
     */
    public function getSsoBaseUrl()
    {
        return $this->ssoBaseUrl;
    }

    /**
     * @param mixed $ssoBaseUrl
     */
    public function setSsoBaseUrl($ssoBaseUrl)
    {
        $this->ssoBaseUrl = $ssoBaseUrl;
    }

    /**
     * @param null|string $name
     * @return array
     */
    public function getConfiguration($name = null)
    {
        if (null !== $name) {
            return array_key_exists($name, $this->configuration) ? $this->configuration[$name] : null;
        }

        return $this->configuration;
    }

    /**
     * @param mixed $configuration
     */
    public function setConfiguration($configuration)
    {
        $this->configuration = $configuration;
    }

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->countries = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Get isActive
     *
     * @return boolean
     */
    public function getIsActive()
    {
        return $this->isActive;
    }

    /**
     * Add country
     *
     * @param \AppBundle\Entity\Country $country
     *
     * @return Loyalty
     */
    public function addCountry(\AppBundle\Entity\Country $country)
    {
        $this->countries[] = $country;

        return $this;
    }

    /**
     * Remove country
     *
     * @param \AppBundle\Entity\Country $country
     */
    public function removeCountry(\AppBundle\Entity\Country $country)
    {
        $this->countries->removeElement($country);
    }

    /**
     * Get countries
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCountries()
    {
        return $this->countries;
    }

    public function __toString()
    {
        return $this->name;
    }
}
