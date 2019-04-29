<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Deal\Approver\Service;

use AppBundle\Deal\Approver\ApproverInterface;
use AppBundle\Deal\Approver\ApproverRepositoryInterface;
use AppBundle\Deal\Approver\Exception\AlreadyApproverAssignedException;
use AppBundle\Deal\Approver\Exception\ApproverNotExistsException;
use AppBundle\Deal\Approver\Service\ApproverAssigner;
use AppBundle\Entity\Deal;
use AppBundle\Loyalty\LoyaltySoapClient;
use Prophecy\Argument;
use Psr\Log\LoggerInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class ApproverAssignerTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var ApproverAssigner
     */
    private $assigner;
    private $approverRepository;
    private $soapClient;
    private $logger;

    public function setUp()
    {
        $this->approverRepository = $this->prophesize(ApproverRepositoryInterface::class);
        $this->approverRepository->save(Argument::type(ApproverInterface::class))->willReturn(null);

        $this->soapClient = $this->prophesize(LoyaltySoapClient::class);
        $this->logger = $this->prophesize(LoggerInterface::class);

        $this->assigner = new ApproverAssigner(
            $this->approverRepository->reveal(),
            $this->soapClient->reveal(),
            $this->logger->reveal()
        );
    }

    public function testCreateRelationSuccess()
    {
        $approverId = 100;

        $this->approverRepository->findByDealId(Argument::any())->willReturn(null)->shouldBeCalled();
        $this->soapClient->getUserData($approverId)->willReturn([
            'first_name' => 'FirstName',
            'last_name' => 'LastName',
        ])->shouldBeCalled();

        $this->approverRepository->save(Argument::cetera())->shouldBeCalled();

        $this->assigner->createRelation(
            $this->prophesize(Deal::class)->reveal(),
            $approverId,
            200
        );
    }

    public function testCreateRelation_ExistentApproverRelated()
    {
        $approverId = 100;

        $this->approverRepository->findByDealId(Argument::any())->willReturn(
            $this->prophesize(ApproverInterface::class)->reveal()
        );

        $this->approverRepository->save(Argument::cetera())->shouldNotBeCalled();

        $this->setExpectedException(AlreadyApproverAssignedException::class);

        $this->assigner->createRelation(
            $this->prophesize(Deal::class)->reveal(),
            $approverId,
            200
        );
    }

    public function testCreateRelation_ApproverNotExists()
    {
        $approverId = 100;

        $this->approverRepository->findByDealId(Argument::any())->willReturn(null);
        $this->soapClient->getUserData(Argument::cetera())->willReturn(null)->shouldBeCalled();
        $this->approverRepository->save(Argument::cetera())->shouldNotBeCalled();
        $this->logger->error(Argument::cetera())->shouldBeCalled();

        $this->assigner->createRelation(
            $this->prophesize(Deal::class)->reveal(),
            $approverId,
            200
        );
    }
}
