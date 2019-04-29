<?php

namespace AppBundle\EventListener;


use AppBundle\Loyalty\Exception\LoyaltyNotExistsException;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\Routing\RequestContext;

class SetLoyaltyParamToRouterListener
{
    /**
     * @var RequestContext
     */
    private $requestContext;
    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;

    /**
     * SetLoyaltyParamToRouterListener constructor.
     * @param RequestContext $requestContext
     */
    public function __construct(RequestContext $requestContext, LoyaltyIdentifierInterface $loyaltyIdentifier)
    {
        $this->requestContext = $requestContext;
        $this->loyaltyIdentifier = $loyaltyIdentifier;
    }


    public function onKernelRequest()
    {
        try {
            $code = $this->loyaltyIdentifier->getActiveLoyalty()->getCode();
        } catch (LoyaltyNotExistsException $e) {
            return;
        }

        $this->requestContext->setParameter('_loyalty', $code);
    }
}