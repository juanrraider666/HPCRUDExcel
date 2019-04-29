<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Deal;
use AppBundle\Entity\EmailTemplate;
use AppBundle\Entity\Loyalty;
use AppBundle\Entity\Repository\CountryRepository;
use AppBundle\Model\AttributeTypes;
use JavierEguiluz\Bundle\EasyAdminBundle\Controller\AdminController;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class EasyAdminController extends AdminController
{
    public function createAttributeEntityFormBuilder($object, $view)
    {
        $builder = $this->createEntityFormBuilder($object, $view);

        $builder->add('type', 'choice', array(
            'choices' => AttributeTypes::getChoices()
        ));

        return $builder;
    }

    public function createEmailTemplateEntityFormBuilder($object, $view)
    {
        $builder = $this->createEntityFormBuilder($object, $view);

        $builder->add('recipient', 'choice', array(
            'choices' => array(
                EmailTemplate::RECIPIENT_SUBMITTER => EmailTemplate::RECIPIENT_SUBMITTER,
                EmailTemplate::RECIPIENT_APPROVER => EmailTemplate::RECIPIENT_APPROVER,
                EmailTemplate::RECIPIENT_UPLOADER => EmailTemplate::RECIPIENT_UPLOADER,
            ),
            'placeholder' => 'label.select',
        ));

        $builder->add('dealCondition', 'choice', array(
            'choices' => array(
                Deal::REGISTERED_STATE => Deal::REGISTERED_STATE,
                Deal::APPROVED_STATE => Deal::APPROVED_STATE,
                Deal::REJECTED_STATE => Deal::REJECTED_STATE,
                Deal::WON_STATE => Deal::WON_STATE,
                Deal::LOSS_STATE => Deal::LOSS_STATE,
                Deal::CANCELED_STATE => Deal::CANCELED_STATE,
                Deal::EXPIRED_STATE => Deal::EXPIRED_STATE,
                Deal::CONDITION_CONFIRMED => Deal::CONDITION_CONFIRMED,
                Deal::CONDITION_CLOSE_TO_EXPIRE => Deal::CONDITION_CLOSE_TO_EXPIRE,
            ),
            'placeholder' => 'label.select',
        ));

        $builder->add('loyalty', 'choice', array(
            'choices' => $this->getActiveLoyalties(),
            'placeholder' => 'label.select',
        ));

        return $builder;
    }

    public function createLoyaltyEntityFormBuilder($object, $view)
    {
        $builder = $this->createEntityFormBuilder($object, $view);

        $builder->add('countries', 'entity', array(
            'class' => 'AppBundle:Country',
            'query_builder' => function(CountryRepository $er) {
                return $er->createQueryBuilder('c')
                          ->where('c.active = :active')
                          ->setParameter('active', true);
            },
            'multiple' => true,
            'placeholder' => 'Seleccionar',
        ));

        return $builder;
    }

    private function getActiveLoyalties()
    {
        $em = $this->getDoctrine()->getManager();

        $activeLoyalties = $em->getRepository('AppBundle:Loyalty')->getActiveLoyalties();

        $loyalties = [];

        /** @var Loyalty $loyalty */
        foreach ($activeLoyalties as $loyalty) {
            $loyalties[$loyalty->getCode()] = $loyalty->getName();
        }

        return $loyalties;
    }

}