<?php

namespace AppBundle\Form\Listener;

use Doctrine\ORM\EntityRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\Form;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;


class AddStateFieldSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents()
    {
        return array(
            FormEvents::PRE_SET_DATA => 'onPreSetData',
            FormEvents::PRE_SUBMIT => 'onPreSubmit',
        );
    }

    public function addForm(Form $form, $country)
    {
        $form->add('state', 'entity', array(
                'class' => 'AppBundle\Entity\State',
                'placeholder' => 'Seleccionar',
                //'auto_initialize' => false,
                'query_builder' => function (EntityRepository $er) use ($country) {
                    return $er->createQueryBuilder('state')
                        ->where('state.country = :country')
                        ->setParameter('country', $country);
                }
            ));
    }

    public function onPreSetData(FormEvent $event)
    {
        $data = $event->getData();
        $country = $data ? $data->getCountry() : null;
        //$state = $data ? $data->getState() : null;
        $this->addForm($event->getForm(), $country);
    }

    public function onPreSubmit(FormEvent $event)
    {
        $form = $event->getForm();
        $data = $event->getData();

        if(isset($form['country']) and $form['country']->isDisabled()){
            return;
        }

        $this->addForm($event->getForm(), isset($data['country']) ? $data['country'] : null);
    }
}