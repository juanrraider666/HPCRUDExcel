<?php

namespace AppBundle\Tests\Deal\EventSubscriber;

use AppBundle\Deal\Event\ApprovedEvent;
use AppBundle\Deal\Event\ConfirmedEvent;
use AppBundle\Deal\Event\DealStatusEvent;
use AppBundle\Deal\EventSubscriber\DealStatusLogPointRelationSubscriber;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealPoint;
use AppBundle\Service\StatusChange\Exception\DealStatusLogNotExistsException;
use AppBundle\Service\StatusChange\StatusLogPointRelationAssigner;
use Prophecy\Argument;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealStatusLogPointRelationSubscriberTest extends \PHPUnit_Framework_TestCase
{

    /**
     * @var DealStatusLogPointRelationSubscriber
     */
    private $listener;
    /** @var StatusLogPointRelationAssigner */
    private $relationshipAssigner;

    public function setUp()
    {
        $this->relationshipAssigner = $this->prophesize(StatusLogPointRelationAssigner::class);

        $this->listener = new DealStatusLogPointRelationSubscriber(
            $this->relationshipAssigner->reveal()
        );
    }

    public function testAssignRelationOnApprove()
    {
        $deal = $this->prophesize(Deal::class);
        $point = $this->prophesize(DealPoint::class);

        $event = $this->prophesize(ApprovedEvent::class);
        $event->getDeal()->willReturn($deal->reveal());
        $event->getGeneratedPoints()->shouldBeCalled()->willReturn($point->reveal());

        $this->relationshipAssigner
            ->createRelation($deal->reveal(), $point->reveal())
            ->shouldBeCalled();

        $this->listener->createRelation($event->reveal());
    }

    public function testNotAssignRelationOnApprove()
    {
        $deal = $this->prophesize(Deal::class);

        $event = $this->prophesize(ApprovedEvent::class);
        $event->getDeal()->willReturn($deal->reveal());
        $event->getGeneratedPoints()->shouldBeCalled()->willReturn(null);

        $this->relationshipAssigner->createRelation(Argument::cetera())->shouldNotBeCalled();

        $this->listener->createRelation($event->reveal());
    }

    public function testStatusLogNotExistsExceptionOnApprove()
    {
        $deal = $this->prophesize(Deal::class);
        $point = $this->prophesize(DealPoint::class);

        $event = $this->prophesize(ApprovedEvent::class);
        $event->getDeal()->willReturn($deal->reveal());
        $event->getGeneratedPoints()->shouldBeCalled()->willReturn($point->reveal());

        $this->relationshipAssigner
            ->createRelation(Argument::cetera())
            ->willThrow(DealStatusLogNotExistsException::class);

        $this->listener->createRelation($event->reveal());
    }

    public function testAssignRelationOnConfirm()
    {
        $deal = $this->prophesize(Deal::class);
        $point = $this->prophesize(DealPoint::class);

        $event = $this->prophesize(ConfirmedEvent::class);
        $event->getDeal()->willReturn($deal->reveal());
        $event->getGeneratedPoints()->shouldBeCalled()->willReturn($point->reveal());

        $this->relationshipAssigner
            ->createRelation($deal->reveal(), $point->reveal())
            ->shouldBeCalled();

        $this->listener->createRelation($event->reveal());
    }

    public function testNotAssignRelationOnConfirm()
    {
        $deal = $this->prophesize(Deal::class);

        $event = $this->prophesize(ConfirmedEvent::class);
        $event->getDeal()->willReturn($deal->reveal());
        $event->getGeneratedPoints()->shouldBeCalled()->willReturn(null);

        $this->relationshipAssigner->createRelation(Argument::cetera())->shouldNotBeCalled();

        $this->listener->createRelation($event->reveal());
    }

    public function testNotAssignRelationWithAndInvalidEventType()
    {
        $deal = $this->prophesize(Deal::class);

        $event = $this->prophesize(DealStatusEvent::class);
        $event->getDeal()->willReturn($deal->reveal());

        $this->relationshipAssigner->createRelation(Argument::cetera())->shouldNotBeCalled();

        $this->listener->createRelation($event->reveal());
    }

    public function testGetSubscribedEvents()
    {
        $events = $this->listener->getSubscribedEvents();

        $this->assertArrayHasKey(ApprovedEvent::NAME, $events);
        $this->assertArrayHasKey(ConfirmedEvent::NAME, $events);
    }
}
