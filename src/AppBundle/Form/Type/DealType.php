<?php

namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormError;

class DealType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('attributes', 'attributes')
            
            ->add('invoice', 'deal_invoice_type')
            
            ->add('totalUsd', NumberType::class, array(
                'scale' => 2,
            ))
            ->add('dateEnd', DateType::class, array(
                'widget' => 'single_text',
            ))
            ;

        $builder->addEventListener(FormEvents::SUBMIT, array($this, 'onSubmitData'));
    }

    public function onSubmitData(FormEvent $event)
    {
        $form = $event->getForm();

        $this->validateOtherCompetitor($form['attributes']);
        $this->validateSector($form['attributes']);
    }

    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Deal',
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'appbundle_deal';
    }

    /**
     * @param $form
     */
    private function validateOtherCompetitor($form)
    {
        if (!isset($form['otro']) or !isset($form['competidor'])) {
            return;
        }

        $otro = $form['otro']['value']->getData();
        $competitor = $form['competidor']['value']->getData();

        if ($competitor == 'Otro' && $otro == null) {
            $form['otro']->addError(
                new FormError('Por favor ingresar <strong>Otro Competidor.</strong>')
            );
        }
    }

    /**
     * @param $form
     */
    private function validateSector(FormInterface $form)
    {
        if (!isset($form['sector_oportunidad'])) {
            return;
        }

        $sector = $form['sector_oportunidad']['value']->getData();

        if ($sector == 'Gobierno') {
            $this->valiateEmptyField($form, 'fecha_propuesta',
                'Por favor ingresar la <strong>Fecha de presentación de propuesta.</strong>'
            );
            $this->valiateEmptyField($form, 'fecha_decision',
                'Por favor ingresar la <strong>Fecha de decisión</strong>'
            );
            $this->valiateEmptyField($form, 'fecha_entrega',
                'Por favor ingresar la <strong>Fecha de entrega</strong>'
            );
            $this->valiateEmptyField($form, 'fecha_licitacion',
                'Por favor ingresar la <strong>Fecha de invitación a la licitación</strong>'
            );
        }
    }

    /**
     * @param $form
     * @param $key
     * @param $error
     * @return bool
     */
    private function valiateEmptyField($form, $key, $error)
    {
        if (isset ($form[$key]) && empty($form[$key]['value']->getData())) {
            $form[$key]['value']->addError(new FormError($error));
        }
    }
}
