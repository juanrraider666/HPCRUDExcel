<?php

namespace AppBundle\Tests\Deal\EventSubscriber;

use AppBundle\Deal\Event\ApprovedEvent;
use AppBundle\Deal\Event\CancelledEvent;
use AppBundle\Deal\Event\LossEvent;
use AppBundle\Deal\Event\RejectedEvent;
use AppBundle\Deal\Event\SubmissionEvent;
use AppBundle\Deal\Event\WonEvent;
use AppBundle\Deal\EventSubscriber\EmailNotificatorSubscriber;
use AppBundle\Entity\Deal;
use AppBundle\Loyalty\Mailer\ApproverNotifier;
use AppBundle\Loyalty\Mailer\SubmitterNotifier;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class EmailNotificatorSubscriberTest extends \PHPUnit_Framework_TestCase
{

    /**
     * @var EmailNotificatorSubscriber
     */
    private $subscriber;
    /** @var SubmitterNotifier */
    private $submitterNotifier;
    /** @var ApproverNotifier */
    private $approverNotifier;

    public function setUp()
    {
        $this->submitterNotifier = $this->prophesize(SubmitterNotifier::class);
        $this->approverNotifier = $this->prophesize(ApproverNotifier::class);
        $this->subscriber = new EmailNotificatorSubscriber(
            $this->submitterNotifier->reveal(),
            $this->approverNotifier->reveal()
        );
    }

    public function testGetSubscribedEvents()
    {
        $events = EmailNotificatorSubscriber::getSubscribedEvents();

        $this->assertSame([
            SubmissionEvent::NAME => 'onDealSubmitted',
            ApprovedEvent::NAME => 'onDealApproved',
            WonEvent::NAME => 'onDealWon',
            LossEvent::NAME => 'onDealLoss',
            CancelledEvent::NAME => 'onDealCancelled',
            RejectedEvent::NAME => 'onDealRejected',
        ], $events);
    }

    public function testOnDealSubmitted()
    {
        $event = new SubmissionEvent($deal = new Deal());

        $this->submitterNotifier->notifyDealSubmitted($deal)->shouldBeCalled();
        $this->approverNotifier->notifyDealSubmitted($deal)->shouldBeCalled();

        $this->subscriber->onDealSubmitted($event);
    }

    public function testOnDealSubmitted_SubmitterNotifierException()
    {
        $event = new SubmissionEvent($deal = new Deal());

        $this->submitterNotifier->notifyDealSubmitted($deal)->shouldBeCalled()->willThrow(\Exception::class);
        $this->approverNotifier->notifyDealSubmitted($deal)->shouldBeCalled();

        $this->subscriber->onDealSubmitted($event);
    }

    public function testOnDealSubmitted_ApproverNotifierException()
    {
        $event = new SubmissionEvent($deal = new Deal());

        $this->submitterNotifier->notifyDealSubmitted($deal)->shouldBeCalled();
        $this->approverNotifier->notifyDealSubmitted($deal)->shouldBeCalled()->willThrow(\Exception::class);

        $this->subscriber->onDealSubmitted($event);
    }

    public function testOnDealApproved()
    {
        $event = new ApprovedEvent($deal = new Deal());

        $this->submitterNotifier->notifyDealApproved($deal)->shouldBeCalled();
        $this->approverNotifier->notifyDealApproved($deal)->shouldNotBeCalled();

        $this->subscriber->onDealApproved($event);
    }

    public function testOnDealWon()
    {
        $event = new WonEvent($deal = new Deal());

        $this->submitterNotifier->notifyDealWon($deal)->shouldBeCalled();
        $this->approverNotifier->notifyDealWon($deal)->shouldBeCalled();

        $this->subscriber->onDealWon($event);
    }

    public function testOnDealWon_SubmitterNotifierException()
    {
        $event = new WonEvent($deal = new Deal());

        $this->submitterNotifier->notifyDealWon($deal)->shouldBeCalled()->willThrow(\Exception::class);
        $this->approverNotifier->notifyDealWon($deal)->shouldBeCalled();

        $this->subscriber->onDealWon($event);
    }

    public function testOnDealWon_ApproverNotifierException()
    {
        $event = new WonEvent($deal = new Deal());

        $this->submitterNotifier->notifyDealWon($deal)->shouldBeCalled();
        $this->approverNotifier->notifyDealWon($deal)->shouldBeCalled()->willThrow(\Exception::class);

        $this->subscriber->onDealWon($event);
    }

    public function testOnDealLost()
    {
        $event = new LossEvent($deal = new Deal());
        $this->approverNotifier->notifyDealLoss($deal)->shouldBeCalled();

        $this->subscriber->onDealLoss($event);
    }

    public function testOnDealCancelled()
    {
        $event = new CancelledEvent($deal = new Deal());
        $this->approverNotifier->notifyDealCancelled($deal)->shouldBeCalled();

        $this->subscriber->onDealCancelled($event);
    }

    public function testOnDealRejected()
    {
        $event = new RejectedEvent($deal = new Deal());
        $this->submitterNotifier->notifyDealRejected($deal)->shouldBeCalled();

        $this->subscriber->onDealRejected($event);
    }

}
