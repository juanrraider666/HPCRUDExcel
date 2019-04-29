<?php

namespace AppBundle\Form\Type;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class LoyaltyFilterType extends AbstractType
{
    /**
     * @var EntityManager
     */
    private $em;

    /**
     * LoyaltyFilter constructor.
     * @param EntityManager $em
     */
    public function __construct(EntityManager $em)
    {
        $this->em = $em;
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('month', 'choice', array(
                'choices'=> $this->getMonths(),
                'label'=>'label.month',
                'placeholder' => 'label.select',
                'choice_translation_domain' => 'calendar',
                'required' => false,
            ))
            ->add('year', 'choice', array(
                'choices'=> $this->getYears(),
                'label'=>'label.year',
                'placeholder' => 'label.select',
                'choice_translation_domain' => false,
                'required' => false,
            ))
            ->add('country', 'entity', array(
                'class' => 'AppBundle:Country',
                'query_builder' => function(EntityRepository $er) {
                    return $er->createQueryBuilder('c')
                        ->where('c.active = :active')
                        ->setParameter('active', true);
                },
                'label' => 'label.country',
                'placeholder' => 'label.select',
                'required' => false,
            ))
            ->add('company_type', 'choice', array(
                'choices' => $this->getCompanyTypeChoices(),
                'placeholder' => 'label.select',
                'label' => 'label.company_type',
                'required' => false,
            ))
            ->add('profile', 'choice', array(
                'choices' => $this->getProfilesChoices(),
                'placeholder' => 'label.select',
                'label' => 'label.profile',
                'required' => false,
            ))
        ;

    }

    public function getMonths()
    {
        return array(
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
            '12' => 'Diciembre');
    }

    public function getYears()
    {
        $currentYear = date('Y');
        $years = array_reverse(range($currentYear - 5, $currentYear));
        $years = array_combine($years, $years);

        return $years;
    }

    public function getCompanyTypeChoices()
    {
        $choices = $this->em->getRepository('AppBundle:DealSubmitter')
            ->getCompanyTypes();

        return $choices;
    }

    public function getProfilesChoices()
    {
        return array(
            10 => 'Partner Principal',
            11 => 'Partner Admin',
            30 => 'Sales Representative'
        );
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'csrf_protection' => false,
            'method' => 'get',
        ));
    }

    public function getName()
    {
        return 'loyalty_filter';
    }
}
