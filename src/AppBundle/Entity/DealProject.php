<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use AppBundle\Util\TimestampableEntity;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * DealProject
 *
 * @ORM\Table(name="deal_project")
 * @ORM\Entity
 */
class DealProject
{
    use TimestampableEntity;

    const OPEN_STATE = 'OPEN_STATE';
    const IN_NEGOTIATION_STATE = 'IN_NEGOTIATION_STATE';
    const ON_HOLD_STATE = 'ON_HOLD_STATE';
    const WON_STATE = 'WON_STATE';
    const LOST_STATE = 'LOST_STATE';

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
     * @Assert\NotBlank(message="Por favor ingrese el <strong>Nombre del Proyecto</strong>")
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var string
     * @Assert\NotBlank(message="Por favor ingrese la <strong>Descripción del Proyecto</strong>")
     *
     * @ORM\Column(name="description", type="text")
     */
    private $description;

    /**
     * @var string
     * @Assert\NotBlank(message="Por favor seleccione el <strong>Estatus del Proyecto</strong>")
     *
     * @ORM\Column(name="status", type="string", length=25)
     */
    private $status;

    /**
     * @var string
     * @Assert\NotBlank(message="Por favor seleccione la <strong>Razón del Proyecto</strong>")
     *
     * @ORM\Column(name="reason", type="string", length=15)
     */
    private $reason;

    /**
     * @var Collection
     *
     * @ORM\OneToMany(
     *  targetEntity="AppBundle\Entity\AttributeValueProject",
     *  mappedBy="project",
     *  cascade={"all"},
     *  orphanRemoval=true
     * )
     */
    private $attributes;


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
     * @return DealProject
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
     * Set description
     *
     * @param string $description
     * @return DealProject
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set status
     *
     * @param string $status
     * @return DealProject
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status
     *
     * @return string 
     */
    public function getStatus()
    {
        return $this->status;
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
     * @param \AppBundle\Entity\AttributeValueProject $attributes
     * @return DealProject
     */
    public function addAttribute(\AppBundle\Entity\AttributeValueProject $attributes)
    {
        $this->attributes[] = $attributes;

        return $this;
    }

    /**
     * Remove attributes
     *
     * @param \AppBundle\Entity\AttributeValueProject $attributes
     */
    public function removeAttribute(\AppBundle\Entity\AttributeValueProject $attributes)
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
     * Set reason
     *
     * @param string $reason
     * @return DealProject
     */
    public function setReason($reason)
    {
        $this->reason = $reason;

        return $this;
    }

    /**
     * Get reason
     *
     * @return string 
     */
    public function getReason()
    {
        return $this->reason;
    }
}
