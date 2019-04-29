<?php

namespace AppBundle\Util;


use AppBundle\Entity\AttributeValueCompany;
use AppBundle\Entity\AttributeValueDeal;
use AppBundle\Entity\AttributeValueProject;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealCompany;
use AppBundle\Entity\DealProject;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\PersistentCollection;
use gbenitez\Bundle\AttributeBundle\Entity\Attribute;

class AttributesManager
{
    /**
     * @var EntityManager
     */
    private $em;

    /**
     * AttributesManager constructor.
     * @param EntityManager $em
     */
    public function __construct(EntityManager $em)
    {
        $this->em = $em;
    }

    /**
     * Metodo para organizar la presentacion de los atributos
     *
     * @param PersistentCollection $attributes
     * @return array
     */
    public function getAttributesData(PersistentCollection $attributes)
    {
        $attributesData = array();

        foreach ($attributes as $attr) {
            $attributesData[$attr->getAttribute()->getName()] = array(
                $attr->getAttribute()->getPresentation(),
                $attr->getValue(),
            );
        }

        if (isset($attributesData['competidor']) && $attributesData['competidor'][1] == 'Otro') {
            $attributesData['competidor'][1] = $attributesData['otro'][1];
        }

        return $attributesData;
    }

    /**
     * @return array|Attribute[]
     */
    public function getDealAttributes()
    {
        return $this->em->getRepository('AttributeBundle:Attribute')->findBy([
            'active' => true,
            'targetEntity' => ['Deal', 'Project', 'Company'],
        ], ['position' => 'ASC']);
    }

    public function getDealWithAttributes(Deal $deal)
    {
        $dealAttributes = $this->em->getRepository('AttributeBundle:Attribute')
            ->findActiveAttributesByEntity('Deal');
        $projectAttributes = $this->em->getRepository('AttributeBundle:Attribute')
            ->findActiveAttributesByEntity('Project');
        $companyAttributes = $this->em->getRepository('AttributeBundle:Attribute')
            ->findActiveAttributesByEntity('Company');

        $dealWithAttributes = $this->buildDealWithAttributes(
            $deal,
            $dealAttributes,
            $projectAttributes,
            $companyAttributes
        );

        return $dealWithAttributes;
    }

    private function buildDealWithAttributes(
        Deal $deal,
        $dealAttributes,
        $projectAttributes,
        $companyAttributes
    ) {
        if ($dealAttributes) {
            foreach ($dealAttributes as $attribute) {
                $deal->addAttribute(new AttributeValueDeal($attribute, $deal));
            }
        }

        if ($projectAttributes) {
            $dealProject = new DealProject();
            $deal->setProject($dealProject);

            foreach ($projectAttributes as $attribute) {
                $deal->getProject()->addAttribute(
                    new AttributeValueProject($attribute, $deal->getProject())
                );
            }
        }

        if ($companyAttributes) {
            $dealCompany = new DealCompany();
            $deal->setProspectus($dealCompany);

            foreach ($companyAttributes as $attribute) {
                $deal->getProspectus()->addAttribute(
                    new AttributeValueCompany($attribute, $deal->getProspectus())
                );
            }
        }

        return $deal;
    }
}