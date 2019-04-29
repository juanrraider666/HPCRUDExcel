<?php
/**
 * Created by PhpStorm.
 * User: WGONZALEZ
 * Date: 28/08/2017
 * Time: 3:57 PM
 */

namespace AppBundle\Form\Listener;

use AppBundle\Entity\DealCompany;
use Doctrine\ORM\EntityRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\PropertyAccess\PropertyAccess;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Validator\Constraints\NotBlank;

class AddDealCompanyTypeFieldSubscriber implements EventSubscriberInterface
{
    private $fieldName;
    public $chainTarget;
    public $selector;
    private $dealCompanyFieldName;

    public function __construct()
    {
        $this->fieldName = 'dealCompanyType';
        $this->dealCompanyFieldName = 'dealCompany';
        $this->chainTarget = 'deal_company_selector';
        $this->selector = 'deal_company_type_selector';
    }

    /**
     * Returns an array of event names this subscriber wants to listen to.
     *
     * The array keys are event names and the value can be:
     *
     *  * The method name to call (priority defaults to 0)
     *  * An array composed of the method name to call and the priority
     *  * An array of arrays composed of the method names to call and respective
     *    priorities, or 0 if unset
     *
     * For instance:
     *
     *  * array('eventName' => 'methodName')
     *  * array('eventName' => array('methodName', $priority))
     *  * array('eventName' => array(array('methodName1', $priority), array('methodName2')))
     *
     * @return array The event names to listen to
     */
    public static function getSubscribedEvents()
    {
        return array(
            FormEvents::PRE_SET_DATA  => 'preSetData',
            FormEvents::PRE_SUBMIT    => 'preSubmit'
        );
    }

    private function addDealCompanyTypeForm($form, $dealCompanyType = null)
    {
        $formOptions = array(
            'class'         => 'AppBundle:DealCompanyType',
            'empty_value'   => 'label.select_type_company', 
            'label'         => 'label.type_company',
            'mapped'        => false,
            'required'      => false,
            'attr'          => array(
                'class'             => $this->selector ,
                'data-chain-target' => $this->chainTarget,
                'data-url-target' => 'deal_company_get_by_type',
            ),
            'query_builder' => function (EntityRepository $repository) {
                $qb = $repository->createQueryBuilder('dct')
                    ->where('dct.visible = 1')
                ;

                return $qb;
            },
            'constraints' => array(
                new NotBlank(),
            ),
            'validation_groups' => array("Registration")
        );

        if($dealCompanyType)
        {
            $formOptions['data'] = $dealCompanyType;
        }

        $form->add($this->fieldName, EntityType::class, $formOptions);
    }

    public function preSetData(FormEvent $event)
    {
        $data = $event->getData();
        $form = $event->getForm();

        if (null === $data) {
            return;
        }

        $accessor = PropertyAccess::createPropertyAccessor();

        /** @var DealCompany $dealCompany */
        $dealCompany = $accessor->getValue($data, $this->dealCompanyFieldName);

        $this->addDealCompanyTypeForm($form, $dealCompany ? $dealCompany->getCompanyType() : null);
    }

    public function preSubmit(FormEvent $event)
    {
        $data = $event->getData();
        $form = $event->getForm();

        $dealCompanyType = array_key_exists($this->fieldName, $data) ? $data[$this->fieldName] : null;

        $this->addDealCompanyTypeForm($form, $dealCompanyType);
    }
}