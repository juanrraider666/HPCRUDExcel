<?php

namespace AppBundle\Tests\Loyalty\PointAssignment;


use AppBundle\Entity\DealSubmitter;
use AppBundle\Loyalty\LoyaltySoapClient;
use AppBundle\Loyalty\PointAssignment\LoyaltyPointAssigner;
use AppBundle\Loyalty\PointAssignment\Point;

class LoyaltyPointAssignerTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var LoyaltySoapClient
     */
    private $soapClient;

    public function setUp()
    {
        $this->soapClient = $this->prophesize(LoyaltySoapClient::class);
    }

    public function testAssignPointsSuccess()
    {
        $loyaltyPointAssigner = new LoyaltyPointAssigner($this->soapClient->reveal());
        $submitter = $this->prophesize(DealSubmitter::class);
        $point = $this->prophesize(Point::class);

        $submitter->getCompanyId()->shouldBeCalled()->willReturn(1);
        $submitter->getUserId()->shouldBeCalled()->willReturn(2);
        $submitter->getProfileId()->shouldBeCalled()->willReturn(3);
        $point->getDescription()->shouldBeCalled()->willReturn('description');
        $point->getPointValueTypeName()->shouldBeCalled()->willReturn('type_name');

        $this->soapClient
            ->createBehaviorPoint(1, 2, 3, 0, 'description', 'type_name', [])
            ->shouldBeCalled()
            ->willReturn(10);

        $response = $loyaltyPointAssigner->assignPoints($submitter->reveal(), $point->reveal(), []);

        $this->assertEquals(10, $response);
    }

    public function testDealSoapClientFactoryReturnNull()
    {
        $loyaltyPointAssigner = new LoyaltyPointAssigner();

        $submitter = $this->prophesize(DealSubmitter::class);
        $point = $this->prophesize(Point::class);

        $this->soapClient->createBehaviorPoint(null, null, null, 0, null, null)
            ->shouldNotBeCalled();

        $response = $loyaltyPointAssigner->assignPoints($submitter->reveal(), $point->reveal(), []);

        $this->assertNull($response);
    }


}