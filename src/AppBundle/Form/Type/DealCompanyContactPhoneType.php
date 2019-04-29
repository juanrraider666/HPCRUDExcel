<?php

namespace AppBundle\Form\Type;

use AppBundle\Entity\DealCompanyContactPhone;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class DealCompanyContactPhoneType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('type', 'choice', array(
                'choices' => DealCompanyContactPhone::getValidTypes(),
                'error_bubbling' => true,
            ))
            ->add('countryCode')
            ->add('areaCode')
            ->add('phoneNumber')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\DealCompanyContactPhone'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'phone_admin';
    }
}
