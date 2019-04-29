<?php

namespace AppBundle\EventListener;


use AppBundle\Loyalty\Exception\LoyaltyNotExistsException;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;
use AppBundle\Util\LoggerTrait;
use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;

class EnableLoyaltyFilterListener
{
    use LoggerTrait;

    /**
     * @var EntityManager
     */
    private $em;

    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;

    /**
     * BeforeRequestListener constructor.
     * @param EntityManager $em
     * @param LoyaltyIdentifierInterface $loyaltyIdentifier
     */
    public function __construct(EntityManager $em, LoyaltyIdentifierInterface $loyaltyIdentifier)
    {
        $this->em = $em;
        $this->loyaltyIdentifier = $loyaltyIdentifier;
    }

    public function onKernelRequest(GetResponseEvent $event)
    {
        try {
            $loyalty = $this->loyaltyIdentifier->getActiveLoyalty();
            $this->enableFilter($loyalty->getId());
        } catch (LoyaltyNotExistsException $e){
            $this->addLog('error', 'Loyalty to enable the filter not found');
        }

    }

    public function enableFilter($loyalty_id)
    {
        $filter = $this->em->getFilters()->enable('loyalty_filter');

        $filter->setParameter('loyalty_id', $loyalty_id);
    }
}