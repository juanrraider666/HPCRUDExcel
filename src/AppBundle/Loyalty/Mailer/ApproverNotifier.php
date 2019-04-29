<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Loyalty\Mailer;

use AppBundle\Deal\Approver\ApproverInterface;
use AppBundle\Deal\Approver\Resolver\ApproverResolverInterface;
use AppBundle\Entity\Deal;
use AppBundle\Entity\EmailTemplate;
use AppBundle\Loyalty\Mailer\Util\DealVariablesExtractor;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class ApproverNotifier extends AbstractNotifier
{
    /**
     * @var ApproverResolverInterface
     */
    private $approverResolver;

    /**
     * @param ApproverResolverInterface $approverResolver
     * @param LoyaltyMailer $loyaltyMailer
     * @param TemplateConfigResolverInterface $templateConfigResolver
     * @param DealVariablesExtractor $extractor
     */
    public function __construct(
        ApproverResolverInterface $approverResolver,
        LoyaltyMailer $loyaltyMailer,
        TemplateConfigResolverInterface $templateConfigResolver,
        DealVariablesExtractor $extractor
    ) {
        $this->approverResolver = $approverResolver;

        parent::__construct($loyaltyMailer, $templateConfigResolver, $extractor);
    }

    public function notifyDealApproved(Deal $deal)
    {
        $this->doNotify($deal, Deal::APPROVED_STATE);
    }

    public function notifyDealSubmitted(Deal $deal)
    {
        $this->doNotify($deal, Deal::REGISTERED_STATE);
    }

    public function notifyDealWon(Deal $deal)
    {
        $this->doNotify($deal, Deal::WON_STATE);
    }

    public function notifyDealLoss(Deal $deal)
    {
        $this->doNotify($deal, Deal::LOSS_STATE);
    }

    public function notifyDealCancelled(Deal $deal)
    {
        $this->doNotify($deal, Deal::CANCELED_STATE);
    }

    /**
     * @param Deal $deal
     * @param $condition
     */
    protected function doNotify(Deal $deal, $condition)
    {
        if (!$approver = $this->approverResolver->getApprover($deal)) {
            return;
        }

        $templateConfig = $this->resolveTemplateConfig($condition, EmailTemplate::RECIPIENT_APPROVER);

        $this->loyaltyMailer->sendEmailToUser(
            $templateConfig->getTemplateCode(),
            $deal->getSubmitter()->getLanguage(),
            $approver->getApproverId(),
            $approver->getCompanyId(),
            $templateConfig->getVariables($this->extractor->getVarsForApprover($approver, $deal))
        );
    }
}