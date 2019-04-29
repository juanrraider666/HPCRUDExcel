<?php
/**
 * Created by PhpStorm.
 * User: WGONZALEZ
 * Date: 28/08/2017
 * Time: 11:26 AM
 */

namespace AppBundle\Form\Type;

use AppBundle\Form\Listener\AddDealCompanyFieldSubscriber;
use AppBundle\Form\Listener\AddDealCompanyTypeFieldSubscriber;
use AppBundle\Validator\Constraints\LoyaltyPassword;
use Symfony\Component\Form\AbstractType;
use FOS\UserBundle\Form\Type\RegistrationFormType as BaseRegistrationFormType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Valid;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstName',null,array(
                'label' => 'label.name',
                'attr' => array(
                    'maxlength' => 50
                )
            ))
            ->add('lastName',null,array(
                'label' => 'label.last_name',
                'attr' => array(
                    'maxlength' => 50
                )
            ))
            ->add('email', 'email', array(
                'label' => 'form.email',
                'translation_domain' => 'FOSUserBundle',
                'attr' => array(
                        'maxlength' => 100
                    )
                )
            )
            ->add('jobTitle',null,array(
                'label' => 'label.position',
                'attr' => array(
                    'maxlength' => 50
                )
            ))
            ->add('phones', CollectionType::class, array(
                'type' => new PhoneProfileType('AppBundle\Entity\PhoneUser'),
                'allow_add' => true,
                'allow_delete' => true,
                'by_reference' => false,
                'label' => 'label.phones',
            ))
            ->add('newCompany', CheckboxType::class, array(
                'label' => 'label.new_company',
                'required' => false,
                'attr' => array(
                    'class' => 'registration-new-company',
                    'style' => 'display:block !important'
                )
            ))
            ->add('newDealCompany', DealCompanyCustomType::class, array(
                'label' => 'label.new_company',
                'required' => true,
                'mapped' => false,
                'data_class' => 'AppBundle\Entity\DealCompany',
                'constraints' => array(
                    new Valid(),
                )
            ))
            ->add('plainPassword', 'repeated', array(
                'type' => 'password',
                'options' => array('translation_domain' => 'FOSUserBundle'),
                'first_options' => array(
                    'label' => 'form.password',
                    'attr' => array(
                        'maxlength' => 50
                    )
                ),
                'second_options' => array(
                    'label' => 'form.password_confirmation',
                    'attr' => array(
                        'maxlength' => 50
                    )
                ),
                'invalid_message' => 'fos_user.password.mismatch',
                'constraints' => array(
                    new LoyaltyPassword(),
                    new NotBlank(),
                    new Length(array(
                        'min' => 8,
                        'max' => 50
                    )),
                ),

                'validation_groups' => array("Registration","newCompanyRegistration","Default")
            ))
            ->remove('username');

        $builder->addEventSubscriber(new AddDealCompanyTypeFieldSubscriber());
        $builder->addEventSubscriber(new AddDealCompanyFieldSubscriber());
    }

    public function getParent()
    {
        return BaseRegistrationFormType::class;
    }
}