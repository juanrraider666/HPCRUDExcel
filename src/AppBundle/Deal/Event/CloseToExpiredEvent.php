<?php

namespace AppBundle\Deal\Event;


use Symfony\Component\EventDispatcher\Event;

class CloseToExpiredEvent extends Event
{
    const NAME = 'deal.expired';

    /**
     * @var array
     */
    private $deals;

    /**
     * @var string
     */
    private $locale;

    /**
     * ExpiredEvent constructor.
     * @param array $deals
     * @param string $locale
     */
    public function __construct(array $deals, $locale = null)
    {
        $this->deals = $deals;
        $this->locale = $locale;
    }

    /**
     * @return array
     */
    public function getDeals()
    {
        return $this->deals;
    }

    /**
     * @return string
     */
    public function getLocale()
    {
        return $this->locale;
    }

}