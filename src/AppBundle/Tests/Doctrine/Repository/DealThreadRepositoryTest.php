<?php

namespace AppBundle\Tests\Doctrine\Repository;

use AppBundle\Doctrine\Repository\DealThreadRepository;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealThread;
use Doctrine\Common\Persistence\ObjectRepository;
use Prophecy\Argument;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealThreadRepositoryTest extends \PHPUnit_Framework_TestCase
{
    /** @var  DealThreadRepository */
    private $repository;
    private $doctrineRepository;

    protected function setUp()
    {
        $this->doctrineRepository = $this->prophesize(ObjectRepository::class);

        $this->repository = new DealThreadRepository(
            $this->doctrineRepository->reveal()
        );
    }

    public function testReturnCorrectInstance()
    {
        $this->doctrineRepository
            ->find(1)
            ->willReturn($this->prophesize(DealThread::class)->reveal());

        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(1);
        $object = $this->repository->getThreadByDeal($deal->reveal());

        $this->assertInstanceOf(DealThread::class, $object);

        $object = $this->repository->getThreadByDealId(1);

        $this->assertInstanceOf(DealThread::class, $object);
    }
}
