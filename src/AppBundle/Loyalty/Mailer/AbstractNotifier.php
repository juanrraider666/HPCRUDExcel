<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Loyalty\Mailer;

use AppBundle\Entity\Deal;
use AppBundle\Loyalty\Mailer\Util\DealVariablesExtractor;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
abstract class AbstractNotifier
{
    /**
     * @var LoyaltyMailer
     */
    protected $loyaltyMailer;
    /**
     * @var TemplateConfigResolverInterface
     */
    protected $templateConfigResolver;
    /**
     * @var DealVariablesExtractor
     */
    protected $extractor;

    /**
     * @param LoyaltyMailer $loyaltyMailer
     * @param TemplateConfigResolverInterface $templateConfigResolver
     */
    public function __construct(
        LoyaltyMailer $loyaltyMailer,
        TemplateConfigResolverInterface $templateConfigResolver,
        DealVariablesExtractor $extractor
    ) {
        $this->loyaltyMailer = $loyaltyMailer;
        $this->templateConfigResolver = $templateConfigResolver;
        $this->extractor = $extractor;
    }

    /**
     * @param $condition
     * @param $recipient
     * @return TemplateConfig
     */
    protected function resolveTemplateConfig($condition, $recipient)
    {
        return $this->templateConfigResolver->getByDealConditionAndRecipient(
            $condition,
            $recipient
        );
    }

    abstract protected function doNotify(Deal $deal, $condition);
}