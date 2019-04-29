<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Service;

use AppBundle\Entity\Deal;
use AppBundle\Entity\DealPoint;
use AppBundle\Entity\DealStatusLog;
use AppBundle\Service\DealStatusPointMatcher;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealStatusPointMatcherTest extends \PHPUnit_Framework_TestCase
{

    /**
     * @var DealStatusPointMatcher
     */
    private $matcher;

    public function setUp()
    {
        $this->matcher = new DealStatusPointMatcher();
    }

    public function testMatching()
    {
        $log = $this->prophesize(DealStatusLog::class);
        $point = $this->prophesize(DealPoint::class);

        $log->getNewStatus()->willReturn(Deal::APPROVED_STATE);
        $point->getCreatedWithStatus()->willReturn(Deal::APPROVED_STATE);

        $result = $this->matcher->matchStatus($log->reveal(), $point->reveal());

        $this->assertTrue($result);
    }

    public function testNotMatch()
    {
        $log = $this->prophesize(DealStatusLog::class);
        $point = $this->prophesize(DealPoint::class);

        $log->getNewStatus()->willReturn(Deal::APPROVED_STATE);
        $point->getCreatedWithStatus()->willReturn(Deal::CANCELED_STATE);

        $result = $this->matcher->matchStatus($log->reveal(), $point->reveal());

        $this->assertFalse($result);
    }
}
