<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Loyalty\Mailer\Util;

use AppBundle\Deal\Approver\ApproverInterface;
use AppBundle\Deal\Approver\Resolver\ApproverResolverInterface;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealProject;
use AppBundle\Entity\DealSubmitter;
use AppBundle\Loyalty\Mailer\Util\DealVariablesExtractor;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealVariablesExtractorTest extends \PHPUnit_Framework_TestCase
{

    /**
     * @var DealVariablesExtractor
     */
    private $extractor;
    private $approverResolver;

    public function setUp()
    {
        $this->approverResolver = $this->prophesize(ApproverResolverInterface::class);

        $this->extractor = new DealVariablesExtractor(
            $this->approverResolver->reveal()
        );
    }

    public function testGetVarsForApprover()
    {
        $deal = $this->createDealMock($dateEnd, $dealProject);

        $dealSubmitter = $this->prophesize(DealSubmitter::class);
        $dealSubmitter->getFirstName()->willReturn('FirstNameSubmitter');
        $dealSubmitter->getLastName()->willReturn('LastNameSubmitter');
        $deal->getSubmitter()->willReturn($dealSubmitter->reveal());

        $deal->getId()->shouldBeCalled();
        $deal->getDateEnd()->shouldBeCalled();

        $dealSubmitter->getFirstName()->shouldBeCalled();
        $dealSubmitter->getLastName()->shouldBeCalled();
        $dealProject->getName()->shouldBeCalled();

        $data = $this->extractor->getVarsForApprover(
            $this->prophesize(ApproverInterface::class)->reveal(),
            $deal->reveal()
        );

        $this->assertArrayHasKey('idNumber', $data);
        $this->assertArrayHasKey('project', $data);
        $this->assertArrayHasKey('closeDate', $data);
        $this->assertArrayHasKey('submitter', $data);

        $this->assertSame(100, $data['idNumber']);
        $this->assertSame('deal_project', $data['project']);
        $this->assertSame($dateEnd->format('Y-m-d'), $data['closeDate']);
        $this->assertSame('FirstNameSubmitter LastNameSubmitter', $data['submitter']);
    }

    public function testGetVarsForSubmitter()
    {
        $deal = $this->createDealMock($dateEnd, $dealProject);

        $deal->getId()->shouldBeCalled();
        $deal->getDateEnd()->shouldBeCalled();
        $dealProject->getName()->shouldBeCalled();

        $approver = $this->prophesize(ApproverInterface::class);
        $this->approverResolver->getApprover($deal->reveal())->willReturn($approver->reveal());
        $approver->getName()->shouldBeCalled()->willReturn('FirstNameApprover LastNameApprover');

        $data = $this->extractor->getVarsForSubmitter($deal->reveal());

        $this->assertArrayHasKey('idNumber', $data);
        $this->assertArrayHasKey('project', $data);
        $this->assertArrayHasKey('closeDate', $data);
        $this->assertArrayHasKey('approver', $data);

        $this->assertSame(100, $data['idNumber']);
        $this->assertSame('deal_project', $data['project']);
        $this->assertSame($dateEnd->format('Y-m-d'), $data['closeDate']);
        $this->assertSame('FirstNameApprover LastNameApprover', $data['approver']);
    }

    public function testGetVarsForSubmitter_GetApproverName()
    {
        $deal = $this->createDealMock($dateEnd, $dealProject);

        $approver = $this->prophesize(ApproverInterface::class);
        $this->approverResolver->getApprover($deal->reveal())->willReturn($approver->reveal());
        $approver->getName()->shouldBeCalled()->willReturn('Name1');

        $data = $this->extractor->getVarsForSubmitter($deal->reveal());
        $this->assertSame('Name1', $data['approver']);

        $approver->getName()->shouldBeCalled()->willReturn('Name2');

        $data = $this->extractor->getVarsForSubmitter($deal->reveal());
        $this->assertSame('Name2', $data['approver']);
    }

    public function testGetVarsForSubmitter_NullApprover()
    {
        $deal = $this->createDealMock($dateEnd, $dealProject);

        $this->approverResolver->getApprover(null);

        $data = $this->extractor->getVarsForSubmitter($deal->reveal());
        $this->assertNull($data['approver']);
    }

    /**
     * @param $dateEnd
     * @param $dealSubmitter
     * @param $dealProject
     * @return Deal|\Prophecy\Prophecy\ObjectProphecy
     */
    protected function createDealMock(&$dateEnd = null, &$dealProject = null)
    {
        $deal = $this->prophesize(Deal::class);
        $deal->getId()->willReturn(100);

        $dealProject = $this->prophesize(DealProject::class);
        $dealProject->getName()->willReturn('deal_project');
        $deal->getProject()->willReturn($dealProject->reveal());

        $deal->getDateEnd()->willReturn($dateEnd = new \DateTime());

        return $deal;
    }
}
