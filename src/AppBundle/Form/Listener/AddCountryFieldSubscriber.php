<?php

namespace AppBundle\Form\Listener;


use AppBundle\Entity\Repository\CountryRepository;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;
use Doctrine\Common\Collections\Collection;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Form\FormInterface;

class AddCountryFieldSubscriber implements EventSubscriberInterface
{
    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;

    /**
     * AddCountryFieldSubscriber constructor.
     * @param LoyaltyIdentifierInterface $loyaltyIdentifier
     */
    public function __construct(LoyaltyIdentifierInterface $loyaltyIdentifier)
    {
        $this->loyaltyIdentifier = $loyaltyIdentifier;
    }

    public static function getSubscribedEvents()
    {
        return array(
            FormEvents::PRE_SET_DATA => 'onPreSetData',
        );
    }

    public function onPresetData(FormEvent $event)
    {
        $choices = $this->getCountries();
        $this->addForm($event->getForm(), $choices);
    }

    public function addForm(FormInterface $form, Collection $choices)
    {
        if(!$choices->isEmpty()){
            $form->add('country', EntityType::class, array(
                'class' => 'AppBundle:Country',
                'choices' => $choices,
                'placeholder' => 'Seleccionar',
            ));
        } else {
            $form->add('country', EntityType::class, array(
                'class' => 'AppBundle:Country',
                'query_builder' => function(CountryRepository $er) {
                    return $er->createQueryBuilder('c')
                        ->where('c.active = :active')
                        ->setParameter('active', true);
                },
                'placeholder' => 'Seleccionar',
            ));
        }
    }

    public function getCountries()
    {
        $loyalty = $this->loyaltyIdentifier->getActiveLoyalty();

        return $loyalty->getCountries();
    }
}