<?php

namespace AppBundle\Deal\Event;

use AppBundle\Entity\Deal;

class RejectedEvent extends DealStatusEvent
{
    const NAME = 'deal.rejected';

    /**
     * @param Deal $deal
     * @param null $locale
     */
    public function __construct(Deal $deal, $locale = null)
    {
        parent::__construct($deal, $locale);
    }

}