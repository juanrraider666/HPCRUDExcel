<?php
/**
 * Created by PhpStorm.
 * User: WGONZALEZ
 * Date: 31/08/2017
 * Time: 12:55 PM
 */

namespace AppBundle\Form\Listener;

use AppBundle\Entity\State;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

class AddDealCompanyStateFieldSubscriber implements EventSubscriberInterface
{
    private $fieldName;
    private $parentFieldName;
    public $selector;
    private $chainTarget;

    public function __construct()
    {
        $this->fieldName = 'state';
        $this->parentFieldName = 'country';
        $this->chainTarget = 'city_selector';
        $this->selector = 'state_selector';
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

    private function addStateFormField($form, $country)
    {
        $formOptions = array(
            'class'         => 'AppBundle:State',
            'empty_value'   => 'Seleccione un Estado',
            'label'         => 'Estado',
            'attr'          => array(
                'class'             => $this->selector . ' form-control',
                'data-chain-target' => $this->chainTarget,
                'data-url-target'   => 'city_get_by_state'
            ),
            'required'      => false,
            'query_builder' => function (EntityRepository $repository) use ($country) {
                $qb = $repository->createQueryBuilder('s')
                    ->where('s.country = :country')
                    ->andWhere('s.active = true')
                    ->setParameter('country', $country)
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

        /** @var State $state */
        $state        = $data ? $data->getState() : null;
        $country      = ($state) ? $state->getCountry()->getId() : null;

        $this->addStateFormField($form, $country);
    }

    public function preSubmit(FormEvent $event)
    {
        $data = $event->getData();
        $form = $event->getForm();

        $country = array_key_exists($this->parentFieldName, $data) ? $data[$this->parentFieldName] : null;
        $this->addStateFormField($form, $country);
    }
}