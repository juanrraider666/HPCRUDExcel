<?php

namespace AppBundle\Loyalty\Mailer;


use AppBundle\Deal\Approver\Resolver\ApproverResolverInterface;
use AppBundle\Entity\Deal;
use AppBundle\Entity\EmailTemplate;
use AppBundle\Loyalty\Mailer\Util\DealVariablesExtractor;
use AppBundle\Soap\DealSoapClientFactory;
use Doctrine\ORM\EntityManager;

class DealCloseToExpireNotifier
{
    /**
     * @var DealSoapClientFactory
     */
    private $soapClientFactory;

    /**
     * @var DealVariablesExtractor
     */
    private $extractor;

    /**
     * @var EntityManager
     */
    private $em;

    /**
     * DealCloseToExpireNotifier constructor.
     * @param DealSoapClientFactory $soapClientFactory
     * @param DealVariablesExtractor $extractor
     * @param EntityManager $em
     */
    public function __construct(
        DealSoapClientFactory $soapClientFactory,
        DealVariablesExtractor $extractor,
        EntityManager $em
    )
    {
        $this->soapClientFactory = $soapClientFactory;
        $this->extractor = $extractor;
        $this->em = $em;
    }


    public function NotifyToSubmitter(Deal $deal, $condition)
    {
        $soapClient = $this->soapClientFactory->createSoapClient($deal);
        $mailer = new LoyaltyMailer($soapClient);

        $templateResolver = new DealTemplateConfigResolver($deal, $this->em);

        $templateConfig = $templateResolver->getByDealConditionAndRecipient(
            $condition,
            EmailTemplate::RECIPIENT_SUBMITTER
        );

        $response = $mailer->sendEmailToUser(
            $templateConfig->getTemplateCode(),
            $deal->getSubmitter()->getLanguage(),
            $deal->getSubmitter()->getUserId(),
            $deal->getSubmitter()->getCompanyId(),
            $templateConfig->getVariables(
                $this->extractor->getVarsForSubmitter($deal)
            )
        );

        return $response;
    }
}