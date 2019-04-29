<?php

namespace AppBundle\Loyalty\Mailer;


use AppBundle\Entity\Repository\EmailTemplateRepository;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;

class TemplateConfigResolver implements TemplateConfigResolverInterface
{
    /**
     * @var EmailTemplateRepository
     */
    private $emailTemplateRepository;

    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;

    /**
     * Template constructor.
     * @param EmailTemplateRepository $emailTemplateRepository
     * @param LoyaltyIdentifierInterface $loyaltyIdentifier
     */
    public function __construct(
        EmailTemplateRepository $emailTemplateRepository,
        LoyaltyIdentifierInterface $loyaltyIdentifier
    )
    {
        $this->emailTemplateRepository = $emailTemplateRepository;
        $this->loyaltyIdentifier = $loyaltyIdentifier;
    }


    public function getByDealConditionAndRecipient($condition, $recipient)
    {
        $loyalty = $this->loyaltyIdentifier->getActiveLoyalty();

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