<?php


namespace AppBundle\Form\Listener;

use Doctrine\ORM\EntityRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\Form;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\Form\FormFactoryInterface;


class AddCityFieldSubscriber implements EventSubscriberInterface
{
    //private $factory;

    /*public function __construct(FormFactoryInterface $factory)
    {
        $this->factory = $factory;
    }*/

    public static function getSubscribedEvents()
    {
        return array(
            FormEvents::PRE_SET_DATA => 'onPreSetData',
            FormEvents::PRE_SUBMIT => 'onPreSubmit',
        );
    }

    public function addCityForm(Form $form, $state)
    {
        $form->add('city', 'entity', array(
                'class' => 'AppBundle\Entity\City',
                'placeholder' => 'Seleccionar',
                'auto_initialize' => false,
                'query_builder' => function (EntityRepository $er) use ($state) {
                    $qb = $er->createQueryBuilder('city')
                        ->where('city.state = :state')
                        ->setParameter('state', $state);
                    return $qb;
                },
        ));
    }

    public function onPreSetData(FormEvent $event)
    {
        $data = $event->getData();

        $state = $data ? $data->getState() : null;

        $this->addCityForm($event->getForm(), $state);
    }

    public function onPreSubmit(FormEvent $event)
    {
        $data = $event->getData();

        $this->addCityForm($event->getForm(), isset($data['state']) ? $data['state'] : null);
    }
}