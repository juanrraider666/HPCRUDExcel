<?php

namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;


class DealsListFilterType extends AbstractType
{

    public function getName()
    {
        return 'deals_list_filter';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('bussinesUnit', 'entity', array(
                'label' => 'País',
                'class' => 'AppBundle\Entity\DealBussinesUnit',
                'placeholder' => '',
            ))
            ->add('status', 'choice', array(
                'label' => 'Estado del Proyecto',
                'choices' => array(
                    'Pendiente por aprobacion' => 'Pendiente por aprobación',
                    'Aprobado' => 'Aprobado ',
                    'En ejecucion' => 'En ejecución',
                    'En pausa' => 'En Pausa',
                    'Finalizado' => 'Finalizado'
                ),
                'multiple' => false,
                'placeholder' => '',
            ))
            /*->add('user', null, array(
                'label' => 'Usuario',
            ))
            ->add('company', null, array(
                'label' => 'Empresa',
            ))*/;

    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'csrf_protection' => false,
            'method' => 'get',
        ));
    }


}