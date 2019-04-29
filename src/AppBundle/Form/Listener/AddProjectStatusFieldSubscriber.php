<?php

namespace AppBundle\Form\Listener;


use AppBundle\Entity\DealProject;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

class AddProjectStatusFieldSubscriber implements EventSubscriberInterface
{

    public static function getSubscribedEvents()
    {
        return array(FormEvents::PRE_SET_DATA => 'onPreSetData');
    }

    public function onPreSetData(FormEvent $event)
    {
        $dealProject = $event->getData();
        $form = $event->getForm();

        if(!$dealProject || null === $dealProject->getId()){
            $form->add('status', 'choice', array(
                'choices' => array(
                    DealProject::DEVELOPING_STATE => DealProject::DEVELOPING_STATE
                ),
                'multiple' => false,
                'placeholder' => 'label.select',
            ));
        } else {
            switch($dealProject->getStatus()){
                case DealProject::DEVELOPING_STATE:
                    $form->add('status', 'choice', array(
                        'choices' => array(
                            DealProject::DEVELOPING_STATE => DealProject::DEVELOPING_STATE,
                            DealProject::EVALUATION_STATE => DealProject::EVALUATION_STATE,
                            DealProject::PAUSE_STATE => DealProject::PAUSE_STATE,
                            DealProject::WON_STATE => DealProject::WON_STATE,
                            DealProject::LOSS_STATE => DealProject::LOSS_STATE
                        ),
                        'multiple' => false,
                        'placeholder' => 'label.select',
                    ));
                    break;
                case DealProject::EVALUATION_STATE:
                    $form->add('status', 'choice', array(
                        'choices' => array(
                            DealProject::EVALUATION_STATE => DealProject::EVALUATION_STATE,
                            DealProject::PAUSE_STATE => DealProject::PAUSE_STATE,
                            DealProject::WON_STATE => DealProject::WON_STATE,
                            DealProject::LOSS_STATE => DealProject::LOSS_STATE
                        ),
                        'multiple' => false,
                        'placeholder' => 'label.select',
                    ));
                    break;
                case DealProject::PAUSE_STATE:
                    $form->add('status', 'choice', array(
                        'choices' => array(
                            DealProject::PAUSE_STATE => DealProject::PAUSE_STATE,
                            DealProject::WON_STATE => DealProject::WON_STATE,
                            DealProject::LOSS_STATE => DealProject::LOSS_STATE
                        ),
                        'multiple' => false,
                        'placeholder' => 'label.select',
                    ));
                    break;
                case DealProject::WON_STATE:
                    $form->add('status', 'choice', array(
                        'choices' => array(
                            DealProject::WON_STATE => DealProject::WON_STATE,
                        ),
                        'multiple' => false,
                    ));
                    break;
                case DealProject::LOSS_STATE:
                    $form->add('status', 'choice', array(
                        'choices' => array(
                            DealProject::LOSS_STATE => DealProject::LOSS_STATE
                        ),
                        'multiple' => false,
                    ));
                    break;
            }
        }
    }
}