<?php

namespace AppBundle\Form\Type;

use AppBundle\Entity\Deal;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MyDealsFilterType extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('palabrasClave', 'text', array(
                'label' => 'label.my_bills_keywords'
            ))
            ->add('companyDistributor', 'entity', array(
                'class' => 'AppBundle\Entity\DealCompany',
                'label' => 'label.my_bills_search_text_2',
                'required'  => false,
                'empty_value' => 'label.my_bills_search_text_2_select',
                'query_builder' => function(\Doctrine\ORM\EntityRepository $er){
                    return $er->createQueryBuilder('c')
                              ->where('c.company_type IN (1,4)')
                        	  ->andWhere('c.status = true');
                   }   
                ))
        ;

    }

    public function getMonths()
    {
        $months = array(
            '01' => 'Enero',
            '02' => 'Febrero',
            '03' => 'Marzo',
            '04' => 'Abril',
            '05' => 'Mayo',
            '06' => 'Junio',
            '07' => 'Julio',
            '08' => 'Agosto',
            '09' => 'Septiembre',
            '10' => 'Octubre',
            '11' => 'Noviembre',
            '12' => 'Diciembre'
        );

        return $months;
    }

    public function getYears()
    {
        $currentYear = date('Y');
        $years = array_reverse(range($currentYear - 5, $currentYear));
        $years = array_combine($years, $years);

        return $years;
    }

    public function getDealStatus()
    {
        $status = array(
            Deal::REGISTERED_STATE => Deal::REGISTERED_STATE,
            Deal::APPROVED_STATE => Deal::APPROVED_STATE,
            Deal::REJECTED_STATE => Deal::REJECTED_STATE,
            Deal::WON_STATE => Deal::WON_STATE,
            Deal::NOT_WON_STATE => Deal::NOT_WON_STATE,
            Deal::LOSS_STATE => Deal::LOSS_STATE,
            Deal::CANCELED_STATE => Deal::CANCELED_STATE,
            Deal::EXPIRED_STATE => Deal::EXPIRED_STATE
        );

        return $status;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'csrf_protection' => false,
            'method' => 'get',
        ));
    }

//    public function getName()
//    {
//        return 'my_deals_filter';
//    }
}
