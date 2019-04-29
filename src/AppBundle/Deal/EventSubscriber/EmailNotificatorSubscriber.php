<?php

namespace AppBundle\Deal\EventSubscriber;


use AppBundle\Deal\Event\ApprovedEvent;
use AppBundle\Deal\Event\CancelledEvent;
use AppBundle\Deal\Event\LossEvent;
use AppBundle\Deal\Event\RejectedEvent;
use AppBundle\Deal\Event\SubmissionEvent;
use AppBundle\Deal\Event\WonEvent;
use AppBundle\Loyalty\Mailer\ApproverNotifier;
use AppBundle\Loyalty\Mailer\SubmitterNotifier;
use AppBundle\Soap\DealSoapException;
use AppBundle\Util\LoggerTrait;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class EmailNotificatorSubscriber implements EventSubscriberInterface
{
    use LoggerTrait;

    /**
     * @var SubmitterNotifier
     */
    private $submitterNotifier;

    /**
     * @var ApproverNotifier
     */
    private $approverNotifier;

    /**
     * EmailNotificatorSubscriber constructor.
     * @param SubmitterNotifier $submitterNotifier
     * @param ApproverNotifier $approverNotifier
     */
    public function __construct(SubmitterNotifier $submitterNotifier, ApproverNotifier $approverNotifier)
    {
        $this->submitterNotifier = $submitterNotifier;
        $this->approverNotifier = $approverNotifier;
    }

    public static function getSubscribedEvents()
    {
        return array(
            SubmissionEvent::NAME => 'onDealSubmitted',
            ApprovedEvent::NAME => 'onDealApproved',
            WonEvent::NAME => 'onDealWon',
            LossEvent::NAME => 'onDealLoss',
            CancelledEvent::NAME => 'onDealCancelled',
            RejectedEvent::NAME => 'onDealRejected',
        );
    }

    public function onDealSubmitted(SubmissionEvent $event)
    {
        $this->tryNotify($event, function (SubmissionEvent $event) {
            $this->submitterNotifier->notifyDealSubmitted($event->getDeal());
        });
        $this->tryNotify($event, function (SubmissionEvent $event) {
            $this->approverNotifier->notifyDealSubmitted($event->getDeal());
        });
    }

    public function onDealApproved(ApprovedEvent $event)
    {
        $this->tryNotify($event, function (ApprovedEvent $event) {
            $this->submitterNotifier->notifyDealApproved($event->getDeal());
        });
    }

    public function onDealWon(WonEvent $event)
    {
        $this->tryNotify($event, function (WonEvent $event) {
            $this->submitterNotifier->notifyDealWon($event->getDeal());
        });
        $this->tryNotify($event, function (WonEvent $event) {
            $this->approverNotifier->notifyDealWon($event->getDeal());
        });
    }

    public function onDealLoss(LossEvent $event)
    {
        $this->tryNotify($event, function (LossEvent $event) {
            $this->approverNotifier->notifyDealLoss($event->getDeal());
        });
    }

    public function onDealCancelled(CancelledEvent $event)
    {
        $this->tryNotify($event, function (CancelledEvent $event) {
            $this->approverNotifier->notifyDealCancelled($event->getDeal());
        });
    }

    public function onDealRejected(RejectedEvent $event)
    {
        $this->tryNotify($event, function (RejectedEvent $event) {
            $this->submitterNotifier->notifyDealRejected($event->getDeal());
        });
    }

    /**
     * @param $event
     * @param \Closure $closure
     */
    protected function tryNotify($event, \Closure $closure)
    {
        try {
            $closure($event);
        } catch (DealSoapException $e) {
            $this->addLog('error', 'Email not sent - Soap error: '.$e->getMessage());
        } catch (\Exception $e) {
            $this->addLog('error', $e->getMessage());
        }
    }
}