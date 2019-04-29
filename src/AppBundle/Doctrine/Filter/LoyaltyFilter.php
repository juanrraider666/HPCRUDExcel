<?php

namespace AppBundle\Doctrine\Filter;


use AppBundle\Entity\DealSubmitter;
use Doctrine\ORM\Mapping\ClassMetadata;
use Doctrine\ORM\Query\Filter\SQLFilter;
use gbenitez\Bundle\AttributeBundle\Entity\Attribute;

class LoyaltyFilter extends SQLFilter
{

    /**
     * Gets the SQL query part to add to a query.
     *
     * @param ClassMetaData $targetEntity
     * @param string $targetTableAlias
     *
     * @return string The constraint SQL if there is available, empty string otherwise.
     */
    public function addFilterConstraint(ClassMetadata $targetEntity, $targetTableAlias)
    {
        if($targetEntity->getReflectionClass()->name == Attribute::class){
            return sprintf('%s.owner_id = %s', $targetTableAlias, $this->getParameter('loyalty_id'));
        }

        if($targetEntity->getReflectionClass()->name == DealSubmitter::class){
            return sprintf('%s.loyalty_id = %s', $targetTableAlias, $this->getParameter('loyalty_id'));
        }

        return '';
    }
}