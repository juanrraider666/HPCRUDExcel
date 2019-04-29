<?php

namespace AppBundle\Deal\DealExpired;


use AppBundle\Deal\Event\CloseToExpiredEvent;
use Symfony\Component\DependencyInjection\ContainerInterface;

class DealCloseToExpire
{
    /**
     * @var ContainerInterface
     */
    private $container;

    /**
     * DealCloseToExpire constructor.
     * @param ContainerInterface $container
     */
    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }


    public function NotifyDealsCloseToExpire()
    {
        $daysClose = $this->container->getParameter('deal.days_close_expire');

        $em = $this->container->get('doctrine.orm.entity_manager');

        $deals = $em->getRepository('AppBundle:Deal')->findDealsCloseToExpire($daysClose);

        if(empty($deals)){
            return null;
        }

        $this->container->get('event_dispatcher')->dispatch(
            CloseToExpiredEvent::NAME,
            new CloseToExpiredEvent($deals)
        );

        return count($deals);
    }
}