<?php

namespace AppBundle\Tests\Factory;

use AppBundle\Comment\Factory\DealThreadFactoryInterface;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealThread;
use AppBundle\Factory\DealThreadFactory;
use FOS\CommentBundle\Model\ThreadManagerInterface;
use Prophecy\Argument;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealThreadFactoryTest extends \PHPUnit_Framework_TestCase
{
    private $permalink = 'http://test.com/';
    /** @var  DealThreadFactoryInterface */
    private $factory;
    /** @var  ThreadManagerInterface */
    private $threadManager;

    protected function setUp()
    {
        $this->threadManager = $this->prophesize(ThreadManagerInterface::class);

        $this->factory = new DealThreadFactory($this->threadManager->reveal());
    }

    public function testInstanceOfDealThreadMustBeReturned()
    {
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(1);

        $dealThread = $this->factory->create($deal->reveal(), null);

        $this->assertInstanceOf(DealThread::class, $dealThread);
    }

    public function testDealThreadId_IsEqualToDealId()
    {
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(1);

        $dealThread = $this->factory->create($deal->reveal(), null);

        $this->assertSame(1, $dealThread->getId());
    }

    public function testDealThreadWithValidPermalink()
    {
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(1);

        $dealThread = $this->factory->create($deal->reveal(), $this->permalink);

        $this->assertSame($this->permalink, $dealThread->getPermalink());
    }

    public function testDealThreadMustBePersisted()
    {
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(1);

        $dealThread = $this->factory->create($deal->reveal(), null);

        $this->threadManager->saveThread($dealThread)->shouldHaveBeenCalled();
    }
}