<?php

namespace AppBundle\Doctrine\EventListener;

use AppBundle\Entity\Deal;
use AppBundle\Entity\DealStatusLog;
use Doctrine\ORM\Event\LifecycleEventArgs;
use Doctrine\ORM\Event\PreUpdateEventArgs;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;

class DealStatusListener
{
    /**
     * @var TokenStorage
     */
    private $tokenStorage;

    /**
     * @var array
     */
    private $statusLog = array();

    /**
     * DealStatusChanged constructor.
     * @param TokenStorage $tokenStorage
     */
    public function __construct(TokenStorage $tokenStorage)
    {
        $this->tokenStorage = $tokenStorage;
    }


    public function preUpdate(PreUpdateEventArgs $eventArgs)
    {
        $entity = $eventArgs->getEntity();

        if(!$entity instanceof Deal){
            return;
        }

        if($eventArgs->hasChangedField('status')){

            if ($this->tokenStorage->getToken() == null){
                /* Cuando se cambia de status a EXPIRED_STATE con el comando,
                   no existe un usuario en session, por lo tanto se instancia
                   un usuario no real para guardar en el log.
                 */
                $user = new ExternalUser(0, 0, 0);
            } else {
                $user = $this->tokenStorage->getToken()->getUser();
            }

            $dataChanged = array(
                'old_status' => $eventArgs->getOldValue('status'),
                'new_status' => $eventArgs->getNewValue('status')
            );

            $dealStatusLog = new DealStatusLog();
            $dealStatusLog->setStatusChanged($entity, $user, $dataChanged);

            $this->statusLog[] = $dealStatusLog;
        }
    }

    public function postUpdate(LifecycleEventArgs $eventArgs)
    {
        if(!empty($this->statusLog)){

            $em = $eventArgs->getEntityManager();

            foreach($this->statusLog as $log){
                $em->persist($log);
            }

            $em->flush();
        }
    }

}