<?php

namespace AppBundle\Form\Type;

use AppBundle\Entity\DealProject;
use AppBundle\Form\Listener\AddProjectStatusFieldSubscriber;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class DealProjectType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('attributes', 'attributes')
            ->add('description', 'textarea')
            ->add('reason', 'choice', array(
                'choices' => array(
                    'Nuevo' => 'Nuevo',
                    'Actualizacion' => 'Actualización',
                    'Expansion' => 'Expansión',
                ),
                'multiple' => false,
                'expanded' => true,
            ))
            ->add('status', 'choice', array(
                'choices' => array(
                    DealProject::OPEN_STATE => DealProject::OPEN_STATE,
                    DealProject::IN_NEGOTIATION_STATE => DealProject::IN_NEGOTIATION_STATE,
                    DealProject::ON_HOLD_STATE => DealProject::ON_HOLD_STATE,
                    DealProject::WON_STATE => DealProject::WON_STATE,
                    DealProject::LOST_STATE => DealProject::LOST_STATE
                ),
                'multiple' => false,
                'placeholder' => 'label.select',
            ))
        ;

        //$builder->addEventSubscriber(new AddProjectStatusFieldSubscriber());
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\DealProject'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'appbundle_dealproject';
    }
}
