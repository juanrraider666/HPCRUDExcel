<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Deal\EventSubscriber;

use AppBundle\Deal\Event\ApprovedEvent;
use AppBundle\Deal\Event\ConfirmedEvent;
use AppBundle\Deal\EventSubscriber\PointAssignmentSubscriber;
use AppBundle\Deal\Util\DealAttributesExtractor;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealPoint;
use AppBundle\Entity\DealSubmitter;
use AppBundle\Loyalty\PointAssignment\LoyaltyPointAssigner;
use AppBundle\Loyalty\PointAssignment\Point;
use Doctrine\ORM\EntityManagerInterface;
use Prophecy\Argument;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class PointAssignmentSubscriberTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var PointAssignmentSubscriber
     */
    private $listener;
    /** @var LoyaltyPointAssigner */
    private $pointsAssigner;
    private $em;

    public function setUp()
    {
        $this->pointsAssigner = $this->prophesize(LoyaltyPointAssigner::class);
        $this->em = $this->prophesize(EntityManagerInterface::class);

        $this->listener = new PointAssignmentSubscriber(
            $this->pointsAssigner->reveal(),
            $this->em->reveal(),
            $this->prophesize(DealAttributesExtractor::class)->reveal()
        );
    }

    public function testSubcribedEvents()
    {
        $events = $this->listener->getSubscribedEvents();

        $this->assertArrayHasKey(ApprovedEvent::NAME, $events);
        $this->assertArrayHasKey(ConfirmedEvent::NAME, $events);
    }

    public function testApprovedDeal()
    {
        $loyaltyPointId = 450;
        $points = 30;
        $deal = $this->prophesize(Deal::class);
        $submitter = $this->prophesize(DealSubmitter::class);
        $event = $this->prophesize(ApprovedEvent::class);

        $deal->getSubmitter()->willReturn($submitter->reveal());
        $deal->addPoint(Argument::any())->shouldBeCalled();
        $deal->getStatus()->willReturn(Deal::APPROVED_STATE);

        $event->getDeal()->willReturn($deal->reveal());

        $dealPointArgumentChecker = $this->getDealPointArgumentCallbackChecker(
            $deal->reveal(), $loyaltyPointId, $points
        );

        $this->assertEventSetGeneratorCall($event, $dealPointArgumentChecker);
        $this->assertPointAssignerCall($submitter, $loyaltyPointId, $points);
        $this->assertEntityManagerPersistCall($deal, $dealPointArgumentChecker);

        $this->listener->onDealApproved($event->reveal());
    }

    public function testConfirmedDeal()
    {
        $loyaltyPointId = 56;
        $points = 25;
        $deal = $this->prophesize(Deal::class);
        $submitter = $this->prophesize(DealSubmitter::class);
        $event = $this->prophesize(ConfirmedEvent::class);

        $deal->getSubmitter()->willReturn($submitter->reveal());
        $deal->addPoint(Argument::any())->shouldBeCalled();
        $deal->getStatus()->willReturn(Deal::WON_STATE);

        $event->getDeal()->willReturn($deal->reveal());

        $dealPointArgumentChecker = $this->getDealPointArgumentCallbackChecker(
            $deal->reveal(), $loyaltyPointId, $points
        );

        $this->assertEventSetGeneratorCall($event, $dealPointArgumentChecker);
        $this->assertPointAssignerCall($submitter, $loyaltyPointId, $points);
        $this->assertEntityManagerPersistCall($deal, $dealPointArgumentChecker);

        $this->listener->onDealConfirmed($event->reveal());
    }

    /**
     * @param $deal
     * @param $loyaltyPointId
     * @param $points
     * @return \Closure
     */
    protected function getDealPointArgumentCallbackChecker($deal, $loyaltyPointId, $points)
    {
        $dealPointArgumentChecker = function ($point) use ($deal, $loyaltyPointId, $points) {
            return ($point instanceof DealPoint)
            and $point->getLoyaltyPointId() === $loyaltyPointId
            and $point->getQuantity() === $points
            and $point->getDeal() === $deal
            and $point->getCreatedWithStatus() === $deal->getStatus();
        };

        return $dealPointArgumentChecker;
    }

    /**
     * @param $event
     * @param $dealPointArgumentChecker
     */
    protected function assertEventSetGeneratorCall($event, $dealPointArgumentChecker)
    {
        $event->setGenetaredPoints(Argument::that($dealPointArgumentChecker))->shouldBeCalled();
    }

    /**
     * @param $submitter
     * @param $loyaltyPointId
     * @param $points
     */
    protected function assertPointAssignerCall($submitter, $loyaltyPointId, $points)
    {
        $this->pointsAssigner
            ->assignPoints($submitter->reveal(), Argument::type(Point::class), Argument::any())
            ->shouldBeCalled()
            ->willReturn(['id' => $loyaltyPointId, 'points' => $points]);
    }

    /**
     * @param $deal
     * @param $dealPointArgumentChecker
     */
    protected function assertEntityManagerPersistCall($deal, $dealPointArgumentChecker)
    {
        $this->em->persist($deal->reveal())->shouldBeCalled();
        $this->em->persist(Argument::that($dealPointArgumentChecker))->shouldBeCalled();
        $this->em->flush()->shouldBeCalled();
    }
}
