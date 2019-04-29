<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Deal\EventSubscriber;

use AppBundle\Entity\Deal;
use AppBundle\Entity\DealPoint;
use AppBundle\Entity\DealStatusLog;
use AppBundle\Entity\Repository\DealStatusLogRepository;
use AppBundle\Service\DealStatusPointMatcher;
use AppBundle\Service\StatusChange\Exception\DealStatusLogAndPointMatchException;
use AppBundle\Service\StatusChange\Exception\DealStatusLogNotExistsException;
use AppBundle\Service\StatusChange\StatusLogPointRelationAssigner;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class StatusLogPointRelationAssignerTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var StatusLogPointRelationAssigner
     */
    private $service;
    /** @var DealStatusLogRepository */
    private $dealStatusLogRepository;
    /** @var DealStatusPointMatcher */
    private $matcher;

    public function setUp()
    {
        $this->dealStatusLogRepository = $this->prophesize(DealStatusLogRepository::class);
        $this->matcher = $this->prophesize(DealStatusPointMatcher::class);

        $this->service = new StatusLogPointRelationAssigner(
            $this->dealStatusLogRepository->reveal(),
            $this->matcher->reveal()
        );
    }

    public function testApprovedDealSuccessCase()
    {
//        $created = new \DateTime('now');

        $dealStatusLog = $this->prophesize(DealStatusLog::class);
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(100);
//        $deal->getCreatedAt()->shouldBeCalled()->willReturn($created);
        $deal->getStatus()->shouldBeCalled()->willReturn(Deal::APPROVED_STATE);

        $this->dealStatusLogRepository
//            ->getLastByDealIdAndStatus(100, Deal::APPROVED_STATE, (clone $created)->modify('-1 min'))
            ->getLastByDealIdAndStatus(100, Deal::APPROVED_STATE)
            ->shouldBeCalled()
            ->willReturn($dealStatusLog->reveal());

        $dealPoint = $this->prophesize(DealPoint::class);

        $this->matcher
            ->matchStatus($dealStatusLog->reveal(), $dealPoint->reveal())
            ->shouldBeCalled()
            ->willReturn(true);

        $this->assertCreatedRelation($dealStatusLog, $dealPoint);

        $this->service->createRelation($deal->reveal(), $dealPoint->reveal());
    }

    public function testApprovedDealNotMatch()
    {
//        $created = new \DateTime('now');

        $dealStatusLog = $this->prophesize(DealStatusLog::class);
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(200);
//        $deal->getCreatedAt()->willReturn($created);
        $deal->getStatus()->shouldBeCalled()->willReturn(Deal::APPROVED_STATE);

        $this->dealStatusLogRepository
//            ->getLastByDealIdAndStatus(100, Deal::APPROVED_STATE, (clone $created)->modify('-1 min'))
            ->getLastByDealIdAndStatus(200, Deal::APPROVED_STATE)
            ->willReturn($dealStatusLog->reveal());

        $dealPoint = $this->prophesize(DealPoint::class);

        $this->matcher
            ->matchStatus($dealStatusLog->reveal(), $dealPoint->reveal())
            ->shouldBeCalled()
            ->willReturn(false);

        $this->setExpectedException(DealStatusLogAndPointMatchException::class);

        $this->service->createRelation($deal->reveal(), $dealPoint->reveal());
    }

    public function testApprovedDealEmptyLogResult()
    {
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(200);
        $deal->getStatus()->shouldBeCalled()->willReturn(Deal::APPROVED_STATE);

        $this->dealStatusLogRepository->getLastByDealIdAndStatus(200, Deal::APPROVED_STATE);

        $dealPoint = $this->prophesize(DealPoint::class);

        $this->setExpectedException(DealStatusLogNotExistsException::class);

        $this->service->createRelation($deal->reveal(), $dealPoint->reveal());
    }

    /**
     * @param $dealStatusLog
     * @param $dealPoint
     */
    protected function assertCreatedRelation($dealStatusLog, $dealPoint)
    {
        $dealStatusLog->setGeneratedPoints($dealPoint->reveal())->shouldBeCalled();
        $this->dealStatusLogRepository->save($dealStatusLog->reveal())->shouldBeCalled();
    }

    /**
     * @param $dealStatusLog
     * @param $dealPoint
     */
    protected function assertNotCreatedRelation($dealStatusLog, $dealPoint)
    {
        $dealStatusLog->setGeneratedPoints($dealPoint->reveal())->shouldNotBeCalled();
        $this->dealStatusLogRepository->save($dealStatusLog->reveal())->shouldNotBeCalled();
    }
}
