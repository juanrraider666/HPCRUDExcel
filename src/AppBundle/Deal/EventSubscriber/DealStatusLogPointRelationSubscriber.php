<?php

namespace AppBundle\Deal\EventSubscriber;

use AppBundle\Deal\Event\ApprovedEvent;
use AppBundle\Deal\Event\ConfirmedEvent;
use AppBundle\Deal\Event\DealStatusEvent;
use AppBundle\Deal\Event\GeneratedPointsContainerInterface;
use AppBundle\Entity\Repository\DealStatusLogRepository;
use AppBundle\Service\StatusChange\Exception\DealStatusLogAndPointMatchException;
use AppBundle\Service\StatusChange\Exception\DealStatusLogNotExistsException;
use AppBundle\Service\StatusChange\StatusLogPointRelationAssigner;
use Psr\Log\LoggerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

/**
 * Se encarga de relacional el DealStatusLog con los puntos generados al cambiar de status.
 *
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealStatusLogPointRelationSubscriber implements EventSubscriberInterface
{
    /**
     * @var StatusLogPointRelationAssigner
     */
    private $statusPointRelationAssigner;
    /**
     * @var LoggerInterface
     */
    private $logger;

    /**
     * DealStatusLogPointRelationSubscriber constructor.
     * @param DealStatusLogRepository $dealStatusLogRepository
     */
    public function __construct(
        StatusLogPointRelationAssigner $statusPointRelationAssigner,
        LoggerInterface $logger = null
    ) {
        $this->statusPointRelationAssigner = $statusPointRelationAssigner;
        $this->logger = $logger;
    }

    public function createRelation(DealStatusEvent $event)
    {
        if (!($event instanceof GeneratedPointsContainerInterface)) {
            return;
        }

        if (!$event->getGeneratedPoints()) {
            return;
        }

        try {
            $this->statusPointRelationAssigner->createRelation(
                $event->getDeal(), $event->getGeneratedPoints()
            );
        } catch (DealStatusLogNotExistsException $exception) {
        } catch (DealStatusLogAndPointMatchException $exception) {
        }

        if (null !== $this->logger) {
            // Si no existe una variable exception
            if (!isset($exception)) {
                $this->logger->debug(
                    'Relacionando el DealStatusLog con el punto generado para el nuevo status {status}', [
                    'deal_id' => $event->getDeal()->getId(),
                    'status' => $event->getDeal()->getStatus(),
                    'deal_point_id' => $event->getGeneratedPoints()->getId(),
                ]);
            } else {
                $this->logger->error(
                    'Ha ocurrido un error al llamar a DealStatusLogPointRelationSubscriber::createRelation', [
                    'error' => $exception->getMessage(),
                    'exception' => $exception,
                ]);
            }
        }
    }

    public static function getSubscribedEvents()
    {
        return [
            ApprovedEvent::NAME => ['createRelation', -10],
            ConfirmedEvent::NAME => ['createRelation', -10],
        ];
    }
}