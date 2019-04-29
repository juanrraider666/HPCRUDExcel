<?php

namespace AppBundle\Loyalty;


use AppBundle\Entity\Loyalty;
use AppBundle\Loyalty\Exception\LoyaltyNotExistsException;

interface LoyaltyIdentifierInterface
{
    /**
     * @return Loyalty
     *
     * @throws LoyaltyNotExistsException if loyalty not exists
     */
    public function getActiveLoyalty();

    /**
     * @param Loyalty $activeLoyalty
     */
    public function setActiveLoyalty(Loyalty $activeLoyalty);
}