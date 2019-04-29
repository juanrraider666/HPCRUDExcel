<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Deal\Approver\Resolver;

use AppBundle\Deal\Approver\ApproverRepositoryInterface;
use AppBundle\Deal\Approver\Resolver\SimpleApproverResolver;
use AppBundle\Entity\Deal;
use AppBundle\Deal\Approver\ApproverInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class SimpleApproverResolverTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var SimpleApproverResolver
     */
    private $resolver;

    /**
     * @var ApproverRepositoryInterface
     */
    private $approverRepository;

    public function setUp()
    {
        $this->approverRepository = $this->prophesize(ApproverRepositoryInterface::class);

        $this->resolver = new SimpleApproverResolver(
            $this->approverRepository->reveal()
        );
    }

    public function testReturnAValidApprover()
    {
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(1);

        $approverMock = $this->prophesize(ApproverInterface::class);
        $this->approverRepository->findByDealId(1)
            ->shouldBeCalled()
            ->willReturn($approverMock->reveal());

        $approver = $this->resolver->getApprover($deal->reveal());

        $this->assertSame($approverMock->reveal(), $approver);
    }

    public function testReturnNullIfDealNotHaveARelatedApprover()
    {
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(1);

        $this->approverRepository->findByDealId(1)
            ->shouldBeCalled()
            ->willReturn(null);

        $approver = $this->resolver->getApprover($deal->reveal());

        $this->assertNull($approver);
    }
}
