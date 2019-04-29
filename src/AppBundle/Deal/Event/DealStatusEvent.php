<?php

namespace AppBundle\Deal\Event;


use AppBundle\Entity\Deal;
use Symfony\Component\EventDispatcher\Event;

class DealStatusEvent extends Event
{
    /**
     * @var Deal
     */
    protected $deal;

    /**
     * @var string
     */
    protected $locale;

    /**
     * DealStatusEvent constructor.
     * @param Deal $deal
     * @param string $locale
     */
    public function __construct(Deal $deal, $locale = null)
    {
        $this->deal = $deal;
        $this->locale = $locale;
    }

    /**
     * @return Deal
     */
    public function getDeal()
    {
        return $this->deal;
    }

    /**
     * @return string
     */
    public function getLocale()
    {
        return $this->locale;
    }

}