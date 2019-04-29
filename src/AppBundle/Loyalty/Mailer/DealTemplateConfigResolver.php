<?php

namespace AppBundle\Loyalty\Mailer;


use AppBundle\Entity\Deal;
use AppBundle\Entity\Repository\EmailTemplateRepository;
use Doctrine\ORM\EntityManager;

class DealTemplateConfigResolver implements TemplateConfigResolverInterface
{
    /**
     * @var Deal
     */
    private $deal;

    /**
     * @var EmailTemplateRepository
     */
    private $emailTemplateRepository;

    /**
     * DealTemplateConfigResolver constructor.
     * @param Deal $deal
     * @param EntityManager $em
     */
    public function __construct(Deal $deal, EntityManager $em)
    {
        $this->deal = $deal;

        $this->emailTemplateRepository = $em->getRepository('AppBundle:EmailTemplate');
    }

    /**
     * @param $condition
     * @param $recipient
     * @return TemplateConfig
     *
     * @throws \Exception
     */
    public function getByDealConditionAndRecipient($condition, $recipient)
    {
        $loyalty = $this->deal->getSubmitter()->getLoyalty();

        $emailTemplate = $this->emailTemplateRepository
            ->getEmailTemplateByDealConditionAndRecipient($condition, $recipient, $loyalty->getCode());

        if (empty($emailTemplate)){
            throw new \Exception(
                'Template not found by deal condition: ' . $condition .
                ', _loyalty: ' . $loyalty->getCode() .
                ' and recipient ' . $recipient
            );
        }

        $templateConfig = new TemplateConfig($emailTemplate);

        return $templateConfig;
    }
}