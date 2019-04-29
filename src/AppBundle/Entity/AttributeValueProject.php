<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use AppBundle\Util\TimestampableEntity;
use Symfony\Component\Validator\Constraints as Assert;
use gbenitez\Bundle\AttributeBundle\Entity\AbstractAttributeValue;
use gbenitez\Bundle\AttributeBundle\Entity\Attribute;

/**
 * AttributeValues
 *
 * @ORM\Table(name="attribute_value_project")
 * @ORM\Entity
 */
class AttributeValueProject extends AbstractAttributeValue
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
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\DealProject", inversedBy="attributes")
     * @ Assert\NotBlank()
     */
    private $project;

    /**
     * AttributeValueDeal constructor.
     *
     * @param $attribute
     * @param $project
     */
    public function __construct(Attribute $attribute = null, DealProject $project = null)
    {
        $this->attribute = $attribute;
        $this->project = $project;
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
     * Set project
     *
     * @param \AppBundle\Entity\DealProject $project
     * @return AttributeValueProject
     */
    public function setProject(\AppBundle\Entity\DealProject $project = null)
    {
        $this->project = $project;

        return $this;
    }

    /**
     * Get project
     *
     * @return \AppBundle\Entity\DealProject 
     */
    public function getProject()
    {
        return $this->project;
    }
}
