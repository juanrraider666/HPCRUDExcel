<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Loyalty\Mailer\Util;

use AppBundle\Deal\Approver\ApproverInterface;
use AppBundle\Deal\Approver\Resolver\ApproverResolverInterface;
use AppBundle\Entity\Deal;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealVariablesExtractor
{
    /**
     * @var ApproverResolverInterface
     */
    private $approverResolver;

    public function __construct(ApproverResolverInterface $approverResolver)
    {
        $this->approverResolver = $approverResolver;
    }

    public function getVarsForApprover(ApproverInterface $approver, Deal $deal)
    {
        $submitter = $deal->getSubmitter()->getFirstName().' '.$deal->getSubmitter()->getLastName();

        return $this->getVarsByDeal($deal, [
            'submitter' => $submitter,
        ]);
    }

    public function getVarsForSubmitter(Deal $deal)
    {
        $approver = $this->approverResolver->getApprover($deal);

        return $this->getVarsByDeal($deal, [
            'approver' => $approver ? $approver->getName() : null,
        ]);
    }

    /**
     * @param Deal $deal
     * @param array $extra
     * @return array
     */
    protected function getVarsByDeal(Deal $deal, array $extra = [])
    {
        return [
            'idNumber' => $deal->getId(),
            'project' => $deal->getProject()->getName(),
            'closeDate' => $deal->getDateEnd()->format('Y-m-d'),
        ] + $extra;
    }
}