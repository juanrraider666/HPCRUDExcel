<?php

namespace AppBundle\Form\Type;

use AppBundle\Form\Listener\AddDealCompanyCityFieldSubscriber;
use AppBundle\Form\Listener\AddDealCompanyStateFieldSubscriber;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class DealCompanyCustomType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name',TextType::class,array(
                'required' => false,
                'label' => 'label.name_company',
                'attr' => array(
                    'maxlength' => 100
                )
            ))
            /*->add('zipCode',TextType::class,array(
                'required' => false,
            ))
            ->add('website',UrlType::class,array(
                'required' => false,
            ))*/
            ->add('company_type',EntityType::class,array(
                'class'         => 'AppBundle:DealCompanyType',
                'empty_value'   => 'label.select',
                'label'         => 'label.type_company',
                'required'      => false,
                'query_builder' => function (EntityRepository $repository) {
                    $qb = $repository->createQueryBuilder('dct')
                        ->where('dct.visible = 1')
                    ;

                    return $qb;
                },
            ))
            ->add('city',EntityType::class,array(
                'class'         => 'AppBundle:City',
                'empty_value'   => 'label.select_city',
                'label'         => 'label.city',
                'required'      => false,
                'attr'          => array(
                    'class'             => 'city_selector form-control',
                ),
                'choice_label' => function ($city) {
                    return $city->getName() . ' -> ' . $city->getState()->getName();
                },
                'query_builder' => function (EntityRepository $repository){
                    $qb = $repository->createQueryBuilder('c')
                        ->innerJoin('c.state','state')
                        ->innerJoin('state.country', 'country')
                        ->where('c.active = true')
                        ->andWhere('country.isoCode = :country')
                        ->setParameter('country', 'MX')
                        ->orderBy('c.name')
                    ;
                    return $qb;
                }
            ))
            /*
            ->add('country',EntityType::class,array(
                'class'         => 'AppBundle:Country',
                'empty_value'   => 'Seleccione un País',
                'label'         => 'País',
                'required'      => false,
                'attr'          => array(
                    'class'             => 'country_selector form-control',
                    'data-chain-target' => 'state_selector',
                    'data-url-target'   => 'state_get_by_country'
                ),
                        'query_builder' => function (EntityRepository $repository) {
                    $qb = $repository->createQueryBuilder('c')
                        ->where('c.active = true')
                    ;

                    return $qb;
                }
            ))*/
            ->add('address',TextType::class,array(
                'required' => false,
                'label' => 'label.address',
                'attr' => array(
                    'maxlength' => 255
                )
            ))
        ;

        /*
        $builder->addEventSubscriber(new AddDealCompanyStateFieldSubscriber());
        $builder->addEventSubscriber(new AddDealCompanyCityFieldSubscriber());*/
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\DealCompany'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'deal_company_custom_type';
    }
}
