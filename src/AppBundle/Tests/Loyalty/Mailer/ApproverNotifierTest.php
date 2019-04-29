<?php

namespace AppBundle\Tests\Loyalty\Mailer;

use AppBundle\Deal\Approver\ApproverInterface;
use AppBundle\Deal\Approver\Resolver\ApproverResolverInterface;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealSubmitter;
use AppBundle\Loyalty\Mailer\ApproverNotifier;
use AppBundle\Loyalty\Mailer\LoyaltyMailer;
use AppBundle\Loyalty\Mailer\TemplateConfig;
use AppBundle\Loyalty\Mailer\TemplateConfigResolverInterface;
use AppBundle\Loyalty\Mailer\Util\DealVariablesExtractor;
use Prophecy\Argument;

class ApproverNotifierTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var ApproverNotifier
     */
    private $notifier;
    /**
     * @var ApproverResolverInterface
     */
    private $approverResolver;

    /**
     * @var LoyaltyMailer
     */
    private $loyaltyMailer;

    public function setUp()
    {
        $this->approverResolver = $this->prophesize(ApproverResolverInterface::class);
        $this->loyaltyMailer = $this->prophesize(LoyaltyMailer::class);
        $templateConfigResolver = $this->prophesize(TemplateConfigResolverInterface::class);
        $templateConfigResolver->getByDealConditionAndRecipient(Argument::cetera())
            ->willReturn($this->prophesize(TemplateConfig::class)->reveal());

        $extractor = $this->prophesize(DealVariablesExtractor::class);
        $extractor->getVarsForApprover(Argument::cetera())->willReturn([]);

        $this->notifier = new ApproverNotifier(
            $this->approverResolver->reveal(),
            $this->loyaltyMailer->reveal(),
            $templateConfigResolver->reveal(),
            $extractor->reveal()
        );
    }

    public function testNotifyDealApproved()
    {
        $dealSubmitter = $this->prophesize(DealSubmitter::class);
        $dealSubmitter->getLanguage()->willReturn('es')->shouldBeCalled();

        $deal = $this->prophesize(Deal::class);
        $deal->getSubmitter()
            ->shouldBeCalled()
            ->willReturn($dealSubmitter->reveal());

        $this->approverResolver->getApprover($deal->reveal())
            ->shouldBeCalled()
            ->willReturn(
                $this->prophesize(ApproverInterface::class)
                    ->getApproverId()->shouldBeCalled()->willReturn(10)->getObjectProphecy()
                    ->getCompanyId()->shouldBeCalled()->willReturn(20)->getObjectProphecy()
                    ->reveal()
            );

        $this->loyaltyMailer->sendEmailToUser(
            Argument::any(),
            'es',
            10,
            20,
            Argument::any()
        )->shouldBeCalled();

        $this->notifier->notifyDealApproved($deal->reveal());
    }

    public function notificationCasesProvider()
    {
        return [
            ['notifyDealApproved'],
            ['notifyDealSubmitted'],
            ['notifyDealWon'],
            ['notifyDealLoss'],
            ['notifyDealCancelled'],
        ];
    }

    /**
     * @dataProvider notificationCasesProvider
     */
    public function testNotifyNoApproverRelated($method)
    {
        $deal = $this->prophesize(Deal::class);

        $this->approverResolver->getApprover($deal->reveal())->shouldBeCalled()->willReturn(null);
        $this->loyaltyMailer->sendEmailToUser(Argument::cetera())->shouldNotBeCalled();

        call_user_func([$this->notifier, $method], $deal->reveal());
    }
//
//
//    public function testNotifyDealApproved()
//    {
//        $dealSubmitter = $this->prophesize(DealSubmitter::class);
//        $dealSubmitter->getLanguage()->willReturn('es')->shouldBeCalled();
//
//        $deal = $this->prophesize(Deal::class);
//        $deal->getSubmitter()
//            ->shouldBeCalled()
//            ->willReturn($dealSubmitter->reveal());
//
//        $this->approverResolver->getApprover($deal->reveal())
//            ->shouldBeCalled()
//            ->willReturn(
//                $this->prophesize(ApproverInterface::class)
//                    ->getApproverId()->shouldBeCalled()->willReturn(10)->getObjectProphecy()
//                    ->getCompanyId()->shouldBeCalled()->willReturn(20)->getObjectProphecy()
//                    ->reveal()
//            );
//
//        $this->loyaltyMailer->sendEmailToUser(
//            Argument::any(),
//            'es',
//            10,
//            20,
//            Argument::any()
//        )->shouldBeCalled();
//
//        $this->notifier->notifyDealApproved($deal->reveal());
//    }
}
