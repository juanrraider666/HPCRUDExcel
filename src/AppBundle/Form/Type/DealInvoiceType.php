<?php

namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormError;
use AppBundle\Entity\DealBussinesUnit;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Translation\Translator;
class DealInvoiceType extends AbstractType
{
    private $trans;

    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder ->add('companyDistributorId', 'entity', array(                
                'class' => 'AppBundle\Entity\DealCompany',
                'label'=> 'label.register_bill_select_company_purchase', 
                'required'  => false,
                'empty_value' => 'label.register_bill_select_company_purchase_select',
                'query_builder' => function(\Doctrine\ORM\EntityRepository $er){
                    return $er->createQueryBuilder('c')
                              ->where('c.company_type IN (1,4)')
                        	  ->andWhere('c.status = true');
                   }   
                ))
                ->add('invoiceNumber', 'text', array(
                    'attr' => array(
                        'maxlength' => 20
                    )
                ))
                
                ->add('bussinesUnit', 'entity', array(
                'required'  => false,
                'empty_value' => 'label.register_bill_invoice_breakdown_select',
                'label'=> 'label.register_bill_invoice_breakdown',
                'class' => 'AppBundle\Entity\DealBussinesUnit',
                'placeholder' => '',
                'query_builder' => function(\Doctrine\ORM\EntityRepository $er){
                    return $er->createQueryBuilder('c')
                              ->where('c.active = 1');
                   }   
                ))   
                ->add('purchaseInvoiceDate', DateType::class, array(
                'widget' => 'single_text',
                'attr' => ['class' => 'js-datepicker'],
                'html5' => false,
                ))
                 ->add('computo', 'choice', array(
                'choices' => array(
                    'Procesadores AMD' => 'label.register_bill_invoice_breakdown_select_computer_text_1',
                    'Procesadores Intel' => 'label.register_bill_invoice_breakdown_select_computer_text_2',
                ),
                'multiple' => false,
                'expanded' => true,
                ))
                ->add('computoWinPro', 'choice', array(
                'choices' => array(
                    'Si' => 'label.register_bill_invoice_breakdown_select_computer_text_3',
                    'No' => 'label.register_bill_invoice_breakdown_select_computer_text_4',
                ),
                'multiple' => false,
                'expanded' => true,
                ))        
                ->add('totalUnits', 'text', array(
                    'attr' => array(
                        'maxlength' => 5
                    )
                ))
                ->add('totalQuantity', null, array(
                    'attr' => array(
                        'maxlength' => 10
                    )
                ))
                ->add('certificado', FileType::class, array('label' => 'label.register_bill_invoice_breakdown_select_carepacks_text_1'))
                ->add('factura', FileType::class, array('label' => 'label.register_bill_attached_bill'))
                ->add('termsAccepted', CheckboxType::class, array(
                    'mapped' =>false,
                     'label' => 'label.register_bill_accept_information_entered',
                     'required' => false,
                     'attr' => array(
                    'class' => 'registration-new-company',
                    'style' => 'display:block !important'
                    )
                ));
             
                
                $builder->addEventListener(FormEvents::SUBMIT, array($this, 'onSubmitData'));
    }
    

    public function __construct(Translator $translator)
    {
       $this->trans = $translator;
    }

    
    public function onSubmitData(FormEvent $event){
        $form = $event->getForm();
        $this->validateBussinesUnit($form);
    }
    
    
    
     /**
     * @param $form
     */
    private function validateBussinesUnit($form) {
        
        $bu = $form['bussinesUnit']->getData();
        $amount = $form['totalQuantity']->getData();
        $certificado = $form['certificado']->getData();
        $factura = $form['factura']->getData();
        $computo = $form['computo']->getData();
        $computoWinPro = $form['computoWinPro']->getData();
        $accept = $form['termsAccepted']->getData();
        $distributor = $form['companyDistributorId']->getData();
        
    
        
        if($bu == null){
            $label = $this->trans->trans('label.register_bill_error_type_bill');
            $form['bussinesUnit']->addError(
                        //new FormError('Ingrese un tipo de factura')
                    new FormError($label)
                );
                return true;
        }
        if($accept == false){
             $label = $this->trans->trans('label.register_bill_error_termsaccepted');
                $form['termsAccepted']->addError(
                        new FormError($label));
                return true;
        }
        if ($bu <> 'Servicios / Care Packs') {
            if ($amount >= 100000 && empty($factura)) {
                $label = $this->trans->trans('label.register_bill_error_attach_bill');
                $form['bussinesUnit']->addError(
                        new FormError($label));
                return true;
            }
        }


        if ($bu->getName() == 'Servicios / Care Packs' && (empty($factura) || empty($certificado))) {
            $label = $this->trans->trans('label.register_bill_error_certificate_carepacks');
            $form['bussinesUnit']->addError(
                    new FormError($label));
            return true;
        }

        if ($bu->getName() == 'Cómputo Comercial' && empty($computo)) {
            $label = $this->trans->trans('label.register_bill_error_computer_1');
            $form['bussinesUnit']->addError(
                    new FormError($label));
            return true;
        }
        
        if ($bu->getName() == 'Cómputo Comercial' && empty($computoWinPro)) {
            $label = $this->trans->trans('label.register_bill_error_computer_2');
            $form['bussinesUnit']->addError(
                    new FormError($label));
            return true;
        }
    }

    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\DealInvoice'
        ));
    }
    
    

    /**
     * @return string
     */
    public function getName()
    {
         return 'deal_invoice_type';
    }
}
