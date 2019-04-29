<?php

namespace AppBundle\Deal\EventSubscriber;


use AppBundle\Deal\Event\ApprovedEvent;
use AppBundle\Deal\Event\ConfirmedEvent;
use AppBundle\Deal\Util\DealAttributesExtractor;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealPoint;
use AppBundle\Loyalty\PointAssignment\LoyaltyPointAssigner;
use AppBundle\Loyalty\PointAssignment\Point;
use AppBundle\Loyalty\PointAssignment\PointInterface;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class PointAssignmentSubscriber implements EventSubscriberInterface
{
    /**
     * @var LoyaltyPointAssigner
     */
    private $pointAssigner;

    /**
     * @var EntityManagerInterface
     */
    private $em;

    /**
     * @var DealAttributesExtractor
     */
    private $dealAttributesExtractor;

    /**
     * PointAssignmentSubscriber constructor.
     * @param LoyaltyPointAssigner $pointAssigner
     * @param EntityManagerInterface $em
     * @param DealAttributesExtractor $dealAttributesExtractor
     */
    public function __construct(
        LoyaltyPointAssigner $pointAssigner,
        EntityManagerInterface $em,
        DealAttributesExtractor $dealAttributesExtractor
    )
    {
        $this->pointAssigner = $pointAssigner;
        $this->em = $em;
        $this->dealAttributesExtractor = $dealAttributesExtractor;
    }


    public static function getSubscribedEvents()
    {
        return array(
            ApprovedEvent::NAME => 'onDealApproved',
            ConfirmedEvent::NAME => 'onDealConfirmed',
        );
    }

    public function onDealApproved(ApprovedEvent $event)
    {
        $point = new Point(Point::POINT_VALUE_TYPE_NAME_APPROVED);
        $dealSubmitter = $event->getDeal()->getSubmitter();
        $dealUnits = $this->dealAttributesExtractor->getDealUnits($event->getDeal());

        $loyaltyResponse = $this->pointAssigner->assignPoints($dealSubmitter, $point, $dealUnits);
        $dealPoint = $this->saveDealPoint($event->getDeal(), $point, $loyaltyResponse);

        $event->setGenetaredPoints($dealPoint);
    }

    public function onDealConfirmed(ConfirmedEvent $event)
    {
        $point = new Point(Point::POINT_VALUE_TYPE_NAME_CONFIRMED);
        $dealSubmitter = $event->getDeal()->getSubmitter();
        $dealUnits = $this->dealAttributesExtractor->getDealUnits($event->getDeal());

        $loyaltyResponse = $this->pointAssigner->assignPoints($dealSubmitter, $point, $dealUnits);
        $dealPoint = $this->saveDealPoint($event->getDeal(), $point, $loyaltyResponse);

        $event->setGenetaredPoints($dealPoint);
    }

    /**
     * @param Deal $deal
     * @param PointInterface $point
     * @param $loyaltyResponse
     * @return DealPoint
     */
    public function saveDealPoint(Deal $deal, PointInterface $point, $loyaltyResponse)
    {
        $dealPoint = new DealPoint($deal, $point, $loyaltyResponse);
        $deal->addPoint($dealPoint);

        $this->em->persist($dealPoint);
        $this->em->persist($deal);
        $this->em->flush();

        return $dealPoint;
    }
}