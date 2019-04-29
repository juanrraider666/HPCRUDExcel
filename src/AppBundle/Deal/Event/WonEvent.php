<?php

namespace AppBundle\Deal\Event;


use AppBundle\Entity\Deal;

class WonEvent extends DealStatusEvent
{
    const NAME = 'deal.won';

    /**
     * WonEvent constructor.
     * @param Deal $deal
     * @param null $locale
     */
    public function __construct(Deal $deal, $locale = null)
    {
        parent::__construct($deal, $locale);
    }
}