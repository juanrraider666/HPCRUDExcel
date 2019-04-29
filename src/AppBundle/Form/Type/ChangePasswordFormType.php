<?php

namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Security\Core\Validator\Constraints\UserPassword;
use Symfony\Component\Security\Core\Validator\Constraints\UserPassword as OldUserPassword;
use AppBundle\Validator\Constraints\LoyaltyPassword;
use Symfony\Component\Validator\Constraints\Length;

class ChangePasswordFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        if (class_exists('Symfony\Component\Security\Core\Validator\Constraints\UserPassword')) {
            $constraint = new UserPassword();
        } else {
            // Symfony 2.1 support with the old constraint class
            $constraint = new OldUserPassword();
        }

        $builder->add('current_password', 'password', array(
            'label' => 'form.current_password',
            'translation_domain' => 'FOSUserBundle',
            'mapped' => false,
            'constraints' => $constraint,
        ));

        $builder->add('new', 'repeated', array(
            'type' => 'password',
            'options' => array(
                'translation_domain' => 'FOSUserBundle',
            ),
            'first_options' => array('label' => 'form.new_password'),
            'second_options' => array('label' => 'form.new_password_confirmation'),
            'invalid_message' => 'fos_user.password.mismatch',
            'constraints' => array(
                new Length(array(
                    'min' => 8,
                    'max' => 100,
                )),
                new LoyaltyPassword()
            ),
        ));

    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'FOS\UserBundle\Form\Model\ChangePassword',
            'intention'  => 'change_password',
            'csrf_protection' => false,
        ));
    }

    public function getName()
    {
        return 'change_password';
    }
}
