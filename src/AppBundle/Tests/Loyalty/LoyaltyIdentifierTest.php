<?php

namespace AppBundle\Tests\Loyalty;


use AppBundle\Entity\Loyalty;
use AppBundle\Entity\Repository\LoyaltyRepository;
use AppBundle\Loyalty\Exception\LoyaltyNotExistsException;
use AppBundle\Loyalty\LoyaltyIdentifier;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class LoyaltyIdentifierTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var LoyaltyIdentifier
     */
    private $loyaltyIdentifier;

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
    
    public function setUp()
    {
        $this->requestStack = $this->prophesize(RequestStack::class);
        $this->loyaltyRepository = $this->prophesize(LoyaltyRepository::class);
        
        $this->loyaltyIdentifier = new LoyaltyIdentifier(
            $this->requestStack->reveal(),
            $this->loyaltyRepository->reveal()
        );
    }

    public function testCheckIfActiveLoyaltyIsNotSet()
    {
        $this->assertNotInstanceOf(Loyalty::class, $this->activeLoyalty);
    }

    public function testInvalidLoyaltyCode()
    {
        $this->setExpectedException(LoyaltyNotExistsException::class);

        $request = new Request([],[], ['_loyalty' => 'test']);

        $this->requestStack->getMasterRequest()->shouldBeCalled()->willReturn($request);
        $this->loyaltyRepository->findOneByCode('test')->shouldBeCalled()->willReturn(null);

        $this->loyaltyIdentifier->getActiveLoyalty();
    }

    public function testValidLoyaltyCodeFromRequestReturnActiveLoyalty()
    {
        $loyalty = $this->prophesize(Loyalty::class);
        $loyalty->getCode()->willReturn('test');

        $request = new Request([],[], ['_loyalty' => 'test']);
        $session = $this->prophesize(SessionInterface::class);
        $request->setSession($session->reveal());

        $session->set('_loyalty', 'test')->shouldBeCalled();
        $this->requestStack->getMasterRequest()->shouldBeCalled()->willReturn($request);
        $this->loyaltyRepository->findOneByCode('test')->shouldBeCalled()->willReturn($loyalty->reveal());

        $response = $this->loyaltyIdentifier->getActiveLoyalty();

        $this->assertInstanceOf(Loyalty::class, $response);
    }

    public function testValidLoyaltyCodeFromSessionReturnActiveLoyalty()
    {
        $loyalty = $this->prophesize(Loyalty::class);
        $loyalty->getCode()->willReturn('test');

        $request = new Request();
        $session = $this->prophesize(SessionInterface::class);
        $request->setSession($session->reveal());
        $session->get('_loyalty')->willReturn('test');
        $session->set('_loyalty', 'test')->shouldBeCalled();

        $this->requestStack->getMasterRequest()->shouldBeCalled()->willReturn($request);
        $this->loyaltyRepository->findOneByCode('test')->shouldBeCalled()->willReturn($loyalty->reveal());

        $response = $this->loyaltyIdentifier->getActiveLoyalty();

        $this->assertInstanceOf(Loyalty::class, $response);
    }

}