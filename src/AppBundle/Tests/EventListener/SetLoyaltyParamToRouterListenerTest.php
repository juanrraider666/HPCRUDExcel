<?php

namespace AppBundle\Tests\EventListener;


use AppBundle\Entity\Loyalty;
use AppBundle\EventListener\SetLoyaltyParamToRouterListener;
use AppBundle\Loyalty\Exception\LoyaltyNotExistsException;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;
use Prophecy\Argument;
use Symfony\Component\HttpFoundation\ParameterBag;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\Routing\RequestContext;

class SetLoyaltyParamToRouterListenerTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var SetLoyaltyParamToRouterListener
     */
    private $listener;

    /**
     * @var RequestContext
     */
    private $requestContext;
    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;

    public function setUp()
    {
        $this->requestContext = $this->prophesize(RequestContext::class);
        $this->loyaltyIdentifier = $this->prophesize(LoyaltyIdentifierInterface::class);

        $this->listener = new SetLoyaltyParamToRouterListener(
            $this->requestContext->reveal(),
            $this->loyaltyIdentifier->reveal()
        );
    }

    public function testSetContextParameterShouldNotBeCalledIfLoyaltyDoesNotExists()
    {
        $event = $this->createEvent($request, $attributes);

        $this->loyaltyIdentifier->getActiveLoyalty()
            ->shouldBeCalled()
            ->willThrow(LoyaltyNotExistsException::class);

        $this->requestContext->setParameter('_loyalty', Argument::any())->shouldNotBeCalled();

        $this->listener->onKernelRequest($event->reveal());
    }

    public function testSetLoyaltyParamInRequestContextIfExists()
    {
        $event = $this->createEvent($request, $attributes);

        $loyalty = $this->createLoyaltyMock();
        $loyalty->getCode()->shouldBeCalled();

        $this->loyaltyIdentifier->getActiveLoyalty()
            ->shouldBeCalled()
            ->willReturn($loyalty->reveal());

        $this->requestContext->setParameter('_loyalty', 'code')->shouldBeCalled();

        $this->listener->onKernelRequest($event->reveal());
    }

    protected function createEvent(& $request = null, & $attributes = null)
    {
        $event = $this->prophesize(GetResponseEvent::class);

        $request = $this->prophesize(Request::class);
        $attributes = $this->prophesize(ParameterBag::class);
        $request->attributes = $attributes->reveal();

        $event->getRequest()->willReturn($request->reveal());

        return $event;
    }

    /**
     * @return Loyalty|\Prophecy\Prophecy\ObjectProphecy
     */
    private function createLoyaltyMock()
    {
        return $this->prophesize(Loyalty::class)
            ->getCode()
            ->willReturn('code')
            ->getObjectProphecy();
    }

}
