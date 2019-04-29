<?php
/**
 * Created by PhpStorm.
 * User: WGONZALEZ
 * Date: 31/08/2017
 * Time: 12:55 PM
 */

namespace AppBundle\Form\Listener;

use AppBundle\Entity\City;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

class AddDealCompanyCityFieldSubscriber implements EventSubscriberInterface
{
    private $fieldName;
    private $parentFieldName;
    public $selector;

    public function __construct()
    {
        $this->fieldName = 'city';
        $this->parentFieldName = 'state';
        $this->selector = 'city_selector';
    }

    /**
     * Returns an array of event names this subscriber wants to listen to.
     *
     * The array keys are event names and the value can be:
     *
     *  * The method name to call (priority defaults to 0)
     *  * An array composed of the method name to call and the priority
     *  * An array of arrays composed of the method names to call and respective
     *    priorities, or 0 if unset
     *
     * For instance:
     *
     *  * array('eventName' => 'methodName')
     *  * array('eventName' => array('methodName', $priority))
     *  * array('eventName' => array(array('methodName1', $priority), array('methodName2')))
     *
     * @return array The event names to listen to
     */
    public static function getSubscribedEvents()
    {
        return array(
            FormEvents::PRE_SET_DATA  => 'preSetData',
            FormEvents::PRE_SUBMIT    => 'preSubmit'
        );
    }

    private function addCityFormField($form, $state)
    {
        $formOptions = array(
            'class'         => 'AppBundle:City',
            'empty_value'   => 'Seleccione una Ciudad',
            'label'         => 'Ciudad',
            'required'      => false,
            'attr'          => array(
                'class'             => $this->selector . ' form-control'
            ),
            'query_builder' => function (EntityRepository $repository) use ($state) {
                $qb = $repository->createQueryBuilder('c')
                    ->where('c.state = :state')
                    ->andWhere('c.active = true')
                    ->setParameter('state', $state)
                ;

                return $qb;
            }
        );

        $form->add($this->fieldName, EntityType::class, $formOptions);
    }

    public function preSetData(FormEvent $event)
    {
        $data = $event->getData();
        $form = $event->getForm();

        /** @var City $city */
        $city        = $data ? $data->getCity() : null;
        $state      = ($city) ? $city->getState()->getId() : null;

        $this->addCityFormField($form, $state);
    }

    public function preSubmit(FormEvent $event)
    {
        $data = $event->getData();
        $form = $event->getForm();

        $state = array_key_exists($this->parentFieldName, $data) ? $data[$this->parentFieldName] : null;
        $this->addCityFormField($form, $state);
    }
}