<?php

namespace AppBundle\Form\Type;

use AppBundle\Entity\Phone;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\Form\FormView;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class PhoneProfileType extends AbstractType
{
    private $dataClass;

    public function __construct($dataClass = 'AppBundle\Entity\Phone')
    {
        $this->dataClass = $dataClass;
    }

    public function getName()
    {
        return 'phone_admin';
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('type', 'choice', array(
            'label' => 'label.type',
            'choices' => Phone::getValidTypes(),
            'error_bubbling' => true,
            'translation_domain' => 'phone_type'
        ));
        $builder->add('countryCode', 'text', array(
            'label' => 'label.phone.country_code',
            'error_bubbling' => true,
            'attr'=>array('maxlength'=>3)
        ));
        $builder->add('areaCode', 'text', array(
            'label' => 'label.phone.area_code',
            'error_bubbling' => true,
            'attr'=>array('maxlength'=>4)
        ));
        $builder->add('phoneNumber', 'text', array(
            'label' => 'label.phone.number',
            'error_bubbling' => true,
            'attr'=>array('maxlength'=>10)
        ));
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => $this->dataClass,
            'error_bubbling' => false,
            'show_label' => false,
        ));

        $resolver->setAllowedTypes(array(
            'show_label' => 'bool',
        ));
    }

    public function buildView(FormView $view, FormInterface $form, array $options)
    {
        $view->vars['show_label'] = $options['show_label'];
    }

}