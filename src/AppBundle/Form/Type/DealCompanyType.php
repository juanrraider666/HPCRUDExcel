<?php

namespace AppBundle\Form\Type;

use AppBundle\Form\Listener\AddCityFieldSubscriber;
use AppBundle\Form\Listener\AddCountryFieldSubscriber;
use AppBundle\Form\Listener\AddStateFieldSubscriber;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;


class DealCompanyType extends AbstractType
{
    /**
     * @var AddCountryFieldSubscriber
     */
    private $addCountrySubscriber;

    /**
     * DealCompanyType constructor.
     * @param AddCountryFieldSubscriber $addCountrySubscriber
     */
    public function __construct(AddCountryFieldSubscriber $addCountrySubscriber)
    {
        $this->addCountrySubscriber = $addCountrySubscriber;
    }


    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('attributes', 'attributes')
          
           
              
            ->add('zipCode', 'text', array('required' => false,))
            ->add('website')
            
        ;

        $builder->addEventSubscriber($this->addCountrySubscriber);
        $builder->addEventSubscriber(new AddStateFieldSubscriber());
        $builder->addEventSubscriber(new AddCityFieldSubscriber());
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
        return 'deal_company_type';
    }
}
