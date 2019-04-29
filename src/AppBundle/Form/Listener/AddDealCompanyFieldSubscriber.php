<?php
/**
 * Created by PhpStorm.
 * User: WGONZALEZ
 * Date: 28/08/2017
 * Time: 3:48 PM
 */

namespace AppBundle\Form\Listener;


use AppBundle\Entity\DealCompany;
use Doctrine\ORM\EntityRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\PropertyAccess\PropertyAccess;

class AddDealCompanyFieldSubscriber implements EventSubscriberInterface
{
    private $fieldName;
    private $parentFieldName;
    public $selector;

    public function __construct()
    {
        $this->fieldName = 'dealCompany';
        $this->parentFieldName = 'dealCompanyType';
        $this->selector = 'deal_company_selector';
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

    private function addDealCompanyForm($form, $dealCompanyTypeId)
    {
        $formOptions = array(
            'class'         => 'AppBundle:DealCompany',
            'empty_value'   => 'label.select_company',
            'label'         => 'label.company',
            'required'      => false,
            'attr'          => array(
                'class'             => $this->selector
            ),
            'query_builder' => function (EntityRepository $repository) use ($dealCompanyTypeId) {
                $qb = $repository->createQueryBuilder('dc')
                    ->where('dc.company_type = :dealCompanyTypeId')
                    ->setParameter('dealCompanyTypeId', $dealCompanyTypeId)
                ;

                return $qb;
            }
        );

        $form->add($this->fieldName, 'entity', $formOptions);
    }

    public function preSetData(FormEvent $event)
    {
        $data = $event->getData();
        $form = $event->getForm();

        if (null === $data) {
            return;
        }

        $accessor    = PropertyAccess::createPropertyAccessor();

        /** @var DealCompany $dealCompany */
        $dealCompany = $accessor->getValue($data, $this->fieldName);
        $dealComanyTypeId = ($dealCompany) ? $dealCompany->getCompanyType()->getId() : null;

        $this->addDealCompanyForm($form, $dealComanyTypeId);
    }

    public function preSubmit(FormEvent $event)
    {
        $data = $event->getData();
        $form = $event->getForm();

        $dealCompanyTypeId = array_key_exists($this->parentFieldName, $data) ? $data[$this->parentFieldName] : null;
        $this->addDealCompanyForm($form, $dealCompanyTypeId);
    }
}