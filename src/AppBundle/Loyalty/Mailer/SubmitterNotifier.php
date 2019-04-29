<?php

namespace AppBundle\Loyalty\Mailer;


use AppBundle\Entity\Deal;
use AppBundle\Entity\EmailTemplate;

class SubmitterNotifier extends AbstractNotifier
{
    public function notifyDealSubmitted(Deal $deal)
    {
        $this->doNotify($deal, Deal::REGISTERED_STATE);
    }

    public function notifyDealApproved(Deal $deal)
    {
        $this->doNotify($deal, Deal::APPROVED_STATE);
    }

    public function notifyDealWon(Deal $deal)
    {
        $this->doNotify($deal, Deal::WON_STATE);
    }

    public function notifyDealCloseToExpire(Deal $deal)
    {
        $this->doNotify($deal, Deal::CONDITION_CLOSE_TO_EXPIRE);
    }

    public function notifyDealRejected(Deal $deal)
    {
        $this->doNotify($deal, Deal::REJECTED_STATE);
    }

    /**
     * @param Deal $deal
     * @param $condition
     */
    protected function doNotify(Deal $deal, $condition)
    {
        $templateConfig = $this->resolveTemplateConfig($condition, EmailTemplate::RECIPIENT_SUBMITTER);

        $this->loyaltyMailer->sendEmailToUser(
            $templateConfig->getTemplateCode(),
            $deal->getSubmitter()->getLanguage(),
            $deal->getSubmitter()->getUserId(),
            $deal->getSubmitter()->getCompanyId(),
            $templateConfig->getVariables(
                $this->extractor->getVarsForSubmitter($deal)
            )
        );
    }
}