<?php

namespace AppBundle\Entity;

use AppBundle\Util\TimestampableEntity;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use gbenitez\Bundle\AttributeBundle\Entity\AbstractAttributeValue;
use gbenitez\Bundle\AttributeBundle\Entity\Attribute;

/**
 * AttributeValues
 *
 * @ORM\Table(name="attribute_value_company")
 * @ORM\Entity
 */
class AttributeValueCompany extends AbstractAttributeValue
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
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\DealCompany", inversedBy="attributes")
     * @ Assert\NotBlank()
     */
    private $company;

    /**
     * AttributeValueDeal constructor.
     *
     * @param $attribute
     * @param $company
     */
    public function __construct(Attribute $attribute = null, DealCompany $company = null)
    {
        $this->attribute = $attribute;
        $this->company = $company;
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
     * Set company
     *
     * @param \AppBundle\Entity\DealCompany $company
     * @return AttributeValueCompany
     */
    public function setCompany(\AppBundle\Entity\DealCompany $company = null)
    {
        $this->company = $company;

        return $this;
    }

    /**
     * Get company
     *
     * @return \AppBundle\Entity\DealCompany 
     */
    public function getCompany()
    {
        return $this->company;
    }
}
