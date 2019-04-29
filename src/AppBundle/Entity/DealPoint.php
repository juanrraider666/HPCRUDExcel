<?php

namespace AppBundle\Entity;

use AppBundle\Loyalty\PointAssignment\PointInterface;
use AppBundle\Util\TimestampableEntity;
use Doctrine\ORM\Mapping as ORM;

/**
 * DealPoint
 *
 * @ORM\Table(name="deal_point")
 * @ORM\Entity
 */
class DealPoint
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
     *
     * @ORM\Column(name="loyalty_point_id", type="integer")
     */
    private $loyaltyPointId;

    /**
     * @var integer
     *
     * @ORM\Column(name="quantity", type="integer")
     */
    private $quantity;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=255)
     */
    private $description;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Deal", inversedBy="points")
     * @ORM\JoinColumn(name="deal_id", referencedColumnName="id")
     */
    private $deal;

    /**
     * @ORM\Column(name="created_with_status")
     */
    private $createdWithStatus;

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
     * Set loyaltyPointId
     *
     * @param integer $loyaltyPointId
     *
     * @return DealPoint
     */
    public function setLoyaltyPointId($loyaltyPointId)
    {
        $this->loyaltyPointId = $loyaltyPointId;

        return $this;
    }

    /**
     * Get loyaltyPointId
     *
     * @return integer
     */
    public function getLoyaltyPointId()
    {
        return $this->loyaltyPointId;
    }

    /**
     * Set quantity
     *
     * @param integer $quantity
     *
     * @return DealPoint
     */
    public function setQuantity($quantity)
    {
        $this->quantity = $quantity;

        return $this;
    }

    /**
     * Get quantity
     *
     * @return integer
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return DealPoint
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
     * Set deal
     *
     * @param \AppBundle\Entity\Deal $deal
     *
     * @return DealPoint
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

    public function __construct(Deal $deal, PointInterface $point, $loyaltyResponse)
    {
        // TODO: esto se debe mejorar, no se puede depender de la estructura del
        // loyalty response, se debe esperar id y points como argumentos separados
        // vengan de donde vengan esos datos (Encapsulamiento). @maguirre
        $this->loyaltyPointId = isset($loyaltyResponse['id']) ? $loyaltyResponse['id'] : 0;
        $this->quantity = isset($loyaltyResponse['points']) ? $loyaltyResponse['points'] : 0;
        $this->description = $point->getDescription();
        $this->deal = $deal;

        $this->createdWithStatus = $deal->getStatus();
    }

    /**
     * @return mixed
     */
    public function getCreatedWithStatus()
    {
        return $this->createdWithStatus;
    }
}
