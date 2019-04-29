<?php

namespace AppBundle\Deal\EventSubscriber;


use AppBundle\Deal\Event\CloseToExpiredEvent;
use AppBundle\Entity\Deal;
use AppBundle\Entity\EmailTemplate;
use AppBundle\Loyalty\LoyaltySoapClient;
use AppBundle\Loyalty\Mailer\DealCloseToExpireNotifier;
use AppBundle\Loyalty\Mailer\LoyaltyMailer;
use AppBundle\Soap\DealSoapException;
use AppBundle\Util\Encrypter;
use AppBundle\Util\LoggerTrait;
use Doctrine\ORM\EntityManager;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class DealCloseToExpireNotifierSubscriber implements EventSubscriberInterface
{
    use LoggerTrait;

    /**
     * @var DealCloseToExpireNotifier
     */
    private $dealCloseToExpireNotifier;

    /**
     * @var EntityManager
     */
    private $em;

    /**
     * DealCloseToExpireNotifierSubscriber constructor.
     * @param DealCloseToExpireNotifier $dealCloseToExpireNotifier
     * @param EntityManager $em
     */
    public function __construct(
        DealCloseToExpireNotifier $dealCloseToExpireNotifier,
        EntityManager $em
    )
    {
        $this->dealCloseToExpireNotifier = $dealCloseToExpireNotifier;
        $this->em = $em;
    }


    public static function getSubscribedEvents()
    {
        return array(
            CloseToExpiredEvent::NAME => 'onDealCloseToExpired',
        );
    }

    public function onDealCloseToExpired(CloseToExpiredEvent $event)
    {
        $deals = $event->getDeals();

        foreach($deals as $deal){

            try{

                $response = $this->dealCloseToExpireNotifier->NotifyToSubmitter(
                    $deal,
                    Deal::CONDITION_CLOSE_TO_EXPIRE
                );

                if($response > 0){
                    $deal->setIsCloseToExpiredNotified(true);
                    $this->em->persist($deal);
                    $this->em->flush();
                }

            } catch(DealSoapException $e){
                $this->addLog('error', 'Email not sent - Soap error: ' .  $e->getMessage());
            } catch(\Exception $e){
                $this->addLog('error', $e->getMessage());
            }
        }
    }
}