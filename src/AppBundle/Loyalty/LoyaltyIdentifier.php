<?php

namespace AppBundle\Loyalty;


use AppBundle\Entity\Loyalty;
use AppBundle\Entity\Repository\LoyaltyRepository;
use AppBundle\Loyalty\Exception\LoyaltyNotExistsException;
use Symfony\Component\HttpFoundation\RequestStack;

class LoyaltyIdentifier implements LoyaltyIdentifierInterface
{
    /**
     * @var RequestStack
     */
    private $requestStack;

    /**
     * @var LoyaltyRepository
     */
    private $loyaltyRepository;

    /**
     * @var Loyalty
     */
    private $activeLoyalty;

    /**
     * LoyaltyIdentifier constructor.
     * @param RequestStack $requestStack
     * @param LoyaltyRepository $loyaltyRepository
     */
    public function __construct(RequestStack $requestStack, LoyaltyRepository $loyaltyRepository)
    {
        $this->requestStack = $requestStack;
        $this->loyaltyRepository = $loyaltyRepository;
        $this->activeLoyalty = null;
    }

    public function getActiveLoyalty()
    {
        if ($this->activeLoyalty instanceof Loyalty) {
            return $this->activeLoyalty;
        }

        $request = $this->requestStack->getMasterRequest();
        $loyaltyCode = null;

        if($request->attributes->has('_loyalty')){
            $loyaltyCode = $request->attributes->get('_loyalty');
            $loyalty = $this->loyaltyRepository->findOneByCode($loyaltyCode);
        } else {
            $loyaltyCode = $request->getSession()->get('_loyalty');
            $loyalty = $this->loyaltyRepository->findOneByCode($loyaltyCode);
        }

        if (!$loyalty) {
            throw LoyaltyNotExistsException::codeNotExists($loyaltyCode);
        }

        /** @var Loyalty $loyalty */
        $this->setActiveLoyalty($loyalty);

        return $loyalty;
    }

    /**
     * @param Loyalty $activeLoyalty
     */
    public function setActiveLoyalty(Loyalty $activeLoyalty)
    {
        $this->activeLoyalty = $activeLoyalty;

        $request = $this->requestStack->getMasterRequest();
        $request->getSession()->set('_loyalty', $activeLoyalty->getCode());
    }
}