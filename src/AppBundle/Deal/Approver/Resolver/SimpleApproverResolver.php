<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Deal\Approver\Resolver;

use AppBundle\Deal\Approver\ApproverRepositoryInterface;
use AppBundle\Entity\Deal;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class SimpleApproverResolver implements ApproverResolverInterface
{
    /**
     * @var ApproverRepositoryInterface
     */
    private $approverRepository;

    /**
     * @param ApproverRepositoryInterface $approverRepository
     */
    public function __construct(ApproverRepositoryInterface $approverRepository)
    {
        $this->approverRepository = $approverRepository;
    }

    /**
     * {@inheritdoc}
     */
    public function getApprover(Deal $deal)
    {
        return $this->approverRepository->findByDealId($deal->getId());
    }
}