<?php

namespace AppBundle\Deal;

use Doctrine\ORM\EntityManager;
use AppBundle\Deal\Event\ApprovedEvent;
use AppBundle\Deal\Event\CancelledEvent;
use AppBundle\Deal\Event\ConfirmedEvent;
use AppBundle\Deal\Event\ExpiredEvent;
use AppBundle\Deal\Event\LossEvent;
use AppBundle\Deal\Event\RejectedEvent;
use AppBundle\Deal\Event\SubmissionEvent;
use AppBundle\Deal\Event\WonEvent;
use AppBundle\Entity\Deal;
use AppBundle\Entity\User;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Validator\Constraints\DateTime;

class DealEventManager
{
    /**
     * @var EventDispatcherInterface
     */
    private $eventDispatcher;

    /**
     * @var RequestStack
     */
    private $requestStack;
    
    protected $em;
  

    /**
     * DealEventManager constructor.
     * @param EventDispatcherInterface $eventDispatcher
     * @param RequestStack $requestStack
 
     */
    public function __construct(EventDispatcherInterface $eventDispatcher, RequestStack $requestStack,EntityManager $em)
    {
        $this->eventDispatcher = $eventDispatcher;
        $this->requestStack = $requestStack;
        $this->em = $em;
    }


    public function dispatchEventByDealStatus(Deal $deal)
    {
        $locale = $this->requestStack->getCurrentRequest()->getLocale();

        switch($deal->getStatus()){
            case Deal::REGISTERED_STATE:
                $this->eventDispatcher->dispatch(
                    SubmissionEvent::NAME,
                    new SubmissionEvent($deal, $locale)
                );
                break;
            case Deal::APPROVED_STATE:
                $this->eventDispatcher->dispatch(
                    ApprovedEvent::NAME,
                    new ApprovedEvent($deal, $locale)
                );
                break;
            case Deal::WON_STATE:
                if($deal->getIsConfirmed()){
                    $this->eventDispatcher->dispatch(
                        ConfirmedEvent::NAME,
                        new ConfirmedEvent($deal, $locale)
                    );
                } else {
                    $this->eventDispatcher->dispatch(
                        WonEvent::NAME,
                        new WonEvent($deal, $locale)
                    );
                }
                break;
            case Deal::LOSS_STATE:
                $this->eventDispatcher->dispatch(
                    LossEvent::NAME,
                    new LossEvent($deal, $locale)
                );
                break;
            case Deal::CANCELED_STATE:
                $this->eventDispatcher->dispatch(
                    CancelledEvent::NAME,
                    new CancelledEvent($deal, $locale)
                );
                break;
            case Deal::REJECTED_STATE:
                $this->eventDispatcher->dispatch(
                    RejectedEvent::NAME,
                    new RejectedEvent($deal, $locale)
                );
                break;
        }
    }
    
    public function generateControlNum(Deal $deal){
        
        $alias = 'VIP';
        $country = 'MX';
        $idInvoice = $deal->getInvoice()->getId();
        $invoice = str_pad($idInvoice, 5, '0', STR_PAD_LEFT);
       
        $correlative = $alias.'_'.$country.'_'.$invoice;
        
        $dealInvoice = $deal->getInvoice();
        $dealInvoice->setCorrelative($correlative);
        
        $this->em->persist($dealInvoice);
        $this->em->flush();
        return $correlative;
    }
    
    public function definedStatusDeal (Deal $deal){
        
      $Quantity = $deal->getInvoice()->getTotalQuantity();
      $deal->setStatus(Deal::APPROVED_STATE);
//      if($Quantity<100000){
//          $deal->setStatus(Deal::APPROVED_STATE);
//      }
//      else{
//          $deal->setStatus(Deal::REGISTERED_STATE);
//      }
      $this->em->persist($deal);
      $this->em->flush();
      return $deal->getStatus();      
    }
    
}