<?php

namespace AppBundle\Deal\Event;


use AppBundle\Entity\Deal;

class LossEvent extends DealStatusEvent
{
    const NAME = 'deal.loss';

    /**
     * LossEvent constructor.
     * @param Deal $deal
     * @param null $locale
     */
    public function __construct(Deal $deal, $locale = null)
    {
        parent::__construct($deal, $locale);
    }
}