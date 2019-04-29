<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use AppBundle\Util\TimestampableEntity;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * DealCompanyContact
 *
 * @ORM\Table(name="deal_company_contact")
 * @ORM\Entity
 */
class DealCompanyContact
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
     * @Assert\NotBlank(message="Por favor ingrese el <strong>Nombre del Contacto</strong>")
     * @Assert\Regex(
     *     pattern="/\d/",
     *     match=false,
     *     message="El <strong>Nombre del Contacto</strong> no puede contener números"
     * )
     *
     * @ORM\Column(name="first_name", type="string", length=60)
     */
    private $firstName;

    /**
     * @var string
     * @Assert\NotBlank(message="Por favor ingrese el <strong>Apellido del Contacto</strong>")
     * @Assert\Regex(
     *     pattern="/\d/",
     *     match=false,
     *     message="El <strong>Apellido del Contacto</strong> no puede contener números"
     * )
     *
     * @ORM\Column(name="last_name", type="string", length=60)
     */
    private $lastName;

    /**
     * @var string
     * @Assert\NotBlank(message="Por favor ingrese un <strong>Correo Electrónico</strong> válido")
     * @Assert\Email(message="El correo electrónico '{{ value }}' no es válido")
     *
     * @ORM\Column(name="email", type="string", length=60)
     */
    private $email;

    /**
     * @ORM\OneToOne(targetEntity="DealCompanyContactPhone", cascade={"persist"})
     * @ORM\JoinColumn(name="deal_company_contact_phone_id", referencedColumnName="id")
     * @Assert\Type(type="AppBundle\Entity\DealCompanyContactPhone")
     * @Assert\Valid()
     */
    private $phone;

    /**
     * @var string
     * @Assert\NotBlank(message="Por favor ingrese el <strong>Cargo del Contacto</strong>")
     * @Assert\Regex(
     *     pattern="/\d/",
     *     match=false,
     *     message="El <strong>Cargo del Contacto</strong> no puede contener números"
     * )
     *
     * @ORM\Column(name="position", type="string", length=60)
     */
    private $position;

    public function __toString()
    {
        return $this->getFirstName()." ".$this->getLastName();
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
     * Set firstName
     *
     * @param string $firstName
     * @return DealCompanyContact
     */
    public function setName($firstName)
    {
        $this->firstName = $firstName;

        return $this;
    }

    /**
     * Get firstName
     *
     * @return string 
     */
    public function getfirstName()
    {
        return $this->firstName;
    }

    /**
     * Set lastName
     *
     * @param string $lastName
     * @return DealCompanyContact
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
     * @return DealCompanyContact
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
     * Set position
     *
     * @param string $position
     * @return DealCompanyContact
     */
    public function setPosition($position)
    {
        $this->position = $position;

        return $this;
    }

    /**
     * Get position
     *
     * @return string 
     */
    public function getPosition()
    {
        return $this->position;
    }

    /**
     * Set firstName
     *
     * @param string $firstName
     * @return DealCompanyContact
     */
    public function setFirstName($firstName)
    {
        $this->firstName = $firstName;

        return $this;
    }

    /**
     * Set phone
     *
     * @param \AppBundle\Entity\DealCompanyContactPhone $phone
     * @return DealCompanyContact
     */
    public function setPhone(\AppBundle\Entity\DealCompanyContactPhone $phone = null)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get phone
     *
     * @return \AppBundle\Entity\DealCompanyContactPhone 
     */
    public function getPhone()
    {
        return $this->phone;
    }
}
