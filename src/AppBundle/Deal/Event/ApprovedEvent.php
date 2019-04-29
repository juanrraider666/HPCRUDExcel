<?php

namespace AppBundle\Deal\Event;


use AppBundle\Entity\Deal;

class ApprovedEvent extends DealStatusEvent implements GeneratedPointsContainerInterface
{
    use GeneratedPointsContainerTrait;

    const NAME = 'deal.approved';

    /**
     * ApprovedEvent constructor.
     * @param Deal $deal
     * @param null $locale
     */
    public function __construct(Deal $deal, $locale = null)
    {
        parent::__construct($deal, $locale);
    }
}