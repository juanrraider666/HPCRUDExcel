<?php

namespace AppBundle\Entity;

use AppBundle\Util\TimestampableEntity;
use Doctrine\ORM\Mapping as ORM;
use gbenitez\Bundle\AttributeBundle\Entity\AttributeValueInterface;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * deal
 *
 * @ORM\Table(name="deal")
 * @ORM\Entity(repositoryClass="AppBundle\Entity\Repository\DealRepository")
 */
class Deal
{
    use TimestampableEntity;

    // Deal Status
    const REGISTERED_STATE = 'REGISTERED_STATE';
    const APPROVED_STATE = 'APPROVED_STATE';
    const REJECTED_STATE = 'REJECTED_STATE';
    /**
     * Status Ganada
     */
    const WON_STATE = 'WON_STATE';
    const NOT_WON_STATE = 'NOT_WON_STATE';
    const LOSS_STATE = 'LOSS_STATE';
    const CANCELED_STATE = 'CANCELED_STATE';
    const EXPIRED_STATE = 'EXPIRED_STATE';
    const LOST_STATE = 'LOST_STATE'; // LOSS_STATE + CANCELLED_STATE

    // Deal Conditions
    /**
     * @deprecated
     */
    const CONFIRMED = 'CONFIRMED';
    /**
     * @deprecated
     */
    const CLOSE_TO_EXPIRE = 'CLOSE_TO_EXPIRE';
    const CONDITION_CONFIRMED = 'CONFIRMED';
    const CONDITION_CLOSE_TO_EXPIRE = 'CLOSE_TO_EXPIRE';

    // Attributes
    const DEAL_UNITS = 'unidades_oportunidad';

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

  
    /**
     * @ORM\ManyToOne(targetEntity="DealInvoice", cascade={"persist"})
     * @ORM\JoinColumn(name="deal_invoice_id", referencedColumnName="id")
     * @Assert\Type(type="AppBundle\Entity\DealInvoice")
     * @Assert\Valid()
     */
    private $invoice;
    


    /**
     * @ORM\ManyToOne(targetEntity="User", cascade={"persist"})
     * @ORM\JoinColumn(name="deal_user_id", referencedColumnName="id")
     */
    private $user;

    /**
     * @ORM\OneToMany(
     *  targetEntity="AppBundle\Entity\AttributeValueDeal",
     *  mappedBy="deal",
     *  cascade={"all"},
     *  orphanRemoval=true
     * )
     */
    private $attributes;

    /**
     * @ORM\Column(name="total_usd", type="decimal", scale=2, nullable=true)
     * @ Assert\NotBlank(message="El valor del <strong>Total de la oportunidad en US$</strong> es invalido")
     */
    private $totalUsd;

    /**
     * @ORM\Column(name="status", type="string", length=25)
     */
    private $status;

    /**
     * @ORM\Column(name="is_confirmed", type="boolean", options={"default": false})
     */
    private $isConfirmed;

    /**
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\DealPoint", mappedBy="deal")
     */
    private $points;

    /**
     * @ORM\Column(name="date_end", type="datetime", nullable=true)
     * @ Assert\NotBlank(message="El <strong>Tiempo estimado de cierre</strong> es invalido")
     */
    private $dateEnd;

    /**
     * @ORM\Column(name="is_close_to_expired_notified", type="boolean", options={"default": false})
     */
    private $isCloseToExpiredNotified;

    /**
     * @var DealWonSupport
     *
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\DealWonSupport", mappedBy="deal")
     */
    private $support;
    

    /**
     * @return mixed
     */
    public function getIsCloseToExpiredNotified()
    {
        return $this->isCloseToExpiredNotified;
    }

    /**
     * @param mixed $isCloseToExpiredNotified
     */
    public function setIsCloseToExpiredNotified($isCloseToExpiredNotified)
    {
        $this->isCloseToExpiredNotified = $isCloseToExpiredNotified;
    }

    /**
     * @return mixed
     */
    public function getDateEnd()
    {
        return $this->dateEnd;
    }

    /**
     * @param mixed $dateEnd
     */
    public function setDateEnd($dateEnd)
    {
        $this->dateEnd = $dateEnd;
    }

    /**
     * @return mixed
     */
    public function getIsConfirmed()
    {
        return $this->isConfirmed;
    }

    /**
     * @param mixed $isConfirmed
     */
    public function setIsConfirmed($isConfirmed)
    {
        $this->isConfirmed = $isConfirmed;
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
     * Set invoice
     *
     * @param \AppBundle\Entity\DealInvoice $invoice
     * @return Deal
     */
    public function setInvoice(\AppBundle\Entity\DealInvoice $invoice = null)
    {
        $this->invoice = $invoice;

        return $this;
    }

    /**
     * Get invoice
     *
     * @return \AppBundle\Entity\DealInvoice
     */
    public function getInvoice()
    {
        return $this->invoice;
    }
    
    
    
    
    

    

    /**
     * Add attributes
     *
     * @param \AppBundle\Entity\AttributeValueDeal $attributes
     * @return Deal
     */
    public function addAttribute(\AppBundle\Entity\AttributeValueDeal $attributes)
    {
        $this->attributes[] = $attributes;

        return $this;
    }

    /**
     * Remove attributes
     *
     * @param \AppBundle\Entity\AttributeValueDeal $attributes
     */
    public function removeAttribute(\AppBundle\Entity\AttributeValueDeal $attributes)
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
     * Set user
     *
     * @param \AppBundle\Entity\User $user
     * @return Deal
     */
    public function setUser(\AppBundle\Entity\User $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return \AppBundle\Entity\User
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * @return mixed
     */
    public function getTotalUsd()
    {
        return $this->totalUsd;
    }

    /**
     * @param mixed $totalUsd
     */
    public function setTotalUsd($totalUsd)
    {
        $this->totalUsd = $totalUsd;
    }

    /**
     * Set status
     *
     * @param string $status
     * @return Deal
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
     * Add point
     *
     * @param \AppBundle\Entity\DealPoint $point
     *
     * @return Deal
     */
    public function addPoint(\AppBundle\Entity\DealPoint $point)
    {
        $this->points[] = $point;

        return $this;
    }

    /**
     * Remove point
     *
     * @param \AppBundle\Entity\DealPoint $point
     */
    public function removePoint(\AppBundle\Entity\DealPoint $point)
    {
        $this->points->removeElement($point);
    }

    /**
     * Get points
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPoints()
    {
        return $this->points;
    }

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->attributes = new \Doctrine\Common\Collections\ArrayCollection();
        $this->isConfirmed = false;
        $this->isCloseToExpiredNotified = false;
    }

    /**
     * Retorna los atributos del deal, del proyecto y del prospecto combinados en un solo arreglo
     *
     * Los indices del arreglo son los id de los atributos, y los valores
     * son los objetos AttributeValueInterface
     *
     * @return array|AttributeValueInterface[]
     */
    public function getAttributesWithChildren()
    {
        $values = [];

        $entities = array_merge(
            $this->getAttributes()->toArray(),
            $this->getProject()->getAttributes()->toArray(),
            $this->getProspectus()->getAttributes()->toArray()
        );

        foreach ($entities as $attrValue) {
            $values[$attrValue->getAttribute()->getId()] = $attrValue;
        }

        return $values;
    }

    /**
     * @return DealWonSupport
     */
    public function getSupport()
    {
        return $this->support;
    }

    /**
     * @param DealWonSupport $support
     */
    public function setSupport($support)
    {
        $this->support = $support;
    }

    /**
     * Retorna el loyalty para el que se ha creado la oportunidad.
     *
     * @return Loyalty|null
     */
    public function getLoyalty()
    {
        return $this->getSubmitter() ? $this->getSubmitter()->getLoyalty() : null;
    }

    public function getLastPoint()
    {
        return $this->getPoints()->last();
    }
    
  
}
