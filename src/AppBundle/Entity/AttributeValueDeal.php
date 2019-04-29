<?php

namespace AppBundle\Entity;

use AppBundle\Util\TimestampableEntity;
use Doctrine\ORM\Mapping as ORM;
use gbenitez\Bundle\AttributeBundle\Entity\AbstractAttributeValue;
use gbenitez\Bundle\AttributeBundle\Entity\Attribute;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * AttributeValues
 *
 * @ORM\Table(name="attribute_value_deal")
 * @ORM\Entity
 */
class AttributeValueDeal extends AbstractAttributeValue
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
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Deal", inversedBy="attributes")
     * @ Assert\NotBlank()
     */
    private $deal;

    /**
     * AttributeValueDeal constructor.
     *
     * @param Attribute $attribute
     * @param Deal $deal
     */
    public function __construct(Attribute $attribute = null, Deal $deal = null)
    {
        $this->attribute = $attribute;
        $this->deal = $deal;
    }


    public function __toString()
    {
        return  json_encode($this->value);
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
     * {@inheritdoc}
     */
    public function getName()
    {
        $this->assertAttributeIsSet();
        return $this->attribute->getName();
    }
    /**
     * {@inheritdoc}
     */
    public function getPresentation()
    {
        $this->assertAttributeIsSet();
        return $this->attribute->getPresentation();
    }
    /**
     * {@inheritdoc}
     */
    public function getType()
    {
        $this->assertAttributeIsSet();
        return $this->attribute->getType();
    }
    /**
     * {@inheritdoc}
     */
    public function getConfiguration()
    {
        $this->assertAttributeIsSet();
        return $this->attribute->getConfiguration();
    }
    /**
     * @throws \BadMethodCallException When attribute is not set
     */
    protected function assertAttributeIsSet()
    {
        if (null === $this->attribute) {
            throw new \BadMethodCallException('The attribute is undefined, so you cannot access proxy methods.');
        }
    }

    /**
     * @return string
     * @return \AppBundle\Entity\Deal
     */
    public function getDeal()
    {
        return $this->deal;
    }

    /**
     * set deal
     *
     * @return \AppBundle\Entity\Deal
     */
    public function setDeal(\AppBundle\Entity\Deal $deal)
    {
        $this->deal = $deal;
        return $this;
    }

}
