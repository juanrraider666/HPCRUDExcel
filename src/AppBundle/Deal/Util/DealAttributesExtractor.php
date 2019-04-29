<?php

namespace AppBundle\Deal\Util;


use AppBundle\Entity\Deal;

class DealAttributesExtractor
{
    /**
     * @param Deal $deal
     * @return null|string
     */
    public function getDealUnits(Deal $deal)
    {
        $dealUnits = [];

        foreach($deal->getAttributes() as $attr){
            if($attr->getAttribute()->getName() == Deal::DEAL_UNITS){
                $dealUnits['deal_units'] = $attr->getValue();
            }
        }

        $data = isset($dealUnits['deal_units']) ? serialize($dealUnits) : null;

        return $data;
    }
}