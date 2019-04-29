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

use AppBundle\Deal\Approver\Service\ApproverAssigner;
use AppBundle\Deal\Event\ApprovedEvent;
use AppBundle\Deal\Event\RejectedEvent;
use AppBundle\Deal\Event\SubmissionEvent;
use AppBundle\Deal\EventSubscriber\AssignApproverListener;
use AppBundle\Entity\Deal;
use AppBundle\Entity\Loyalty;
use AppBundle\Loyalty\LoyaltyIdentifier;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;
use Prophecy\Argument;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Guard\Token\PostAuthenticationGuardToken;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class AssignApproverListenerTest extends \PHPUnit_Framework_TestCase
{

    /**
     * @var AssignApproverListener
     */
    private $listener;
    /** @var TokenStorageInterface */
    private $tokenStorage;
    /** @var ApproverAssigner */
    private $approverAssigner;
    /** @var LoyaltyIdentifierInterface */
    private $loyaltyIdentifier;

    public function setUp()
    {
        $this->tokenStorage = new TokenStorage();
        $this->approverAssigner = $this->prophesize(ApproverAssigner::class);
        $this->loyaltyIdentifier = $this->prophesize(LoyaltyIdentifier::class);

        $this->listener = new AssignApproverListener(
            $this->approverAssigner->reveal(),
            $this->loyaltyIdentifier->reveal(),
            $this->tokenStorage
        );
    }

    public function testOnDealApproved()
    {
        $token = new PostAuthenticationGuardToken(
            new ExternalUser(100, 200, 300), 'test', []
        );

        $deal = new Deal();
        $event = new ApprovedEvent($deal);

        $this->tokenStorage->setToken($token);
        $this->approverAssigner->createRelation($deal, 200, 100)->shouldBeCalled();

        $this->listener->onDealApproved($event);
    }

    public function testOnDealApproved_NotExternalUser()
    {
        $token = new PostAuthenticationGuardToken(
            $this->prophesize(UserInterface::class)->reveal(), 'test', []
        );

        $deal = new Deal();
        $event = new ApprovedEvent($deal);

        $this->tokenStorage->setToken($token);
        $this->approverAssigner->createRelation(Argument::cetera())->shouldNotBeCalled();

        $this->listener->onDealApproved($event);
    }

    public function testOnDealRejected()
    {
        $token = new PostAuthenticationGuardToken(
            new ExternalUser(300, 400, 500), 'test', []
        );

        $deal = new Deal();
        $event = new RejectedEvent($deal);

        $this->tokenStorage->setToken($token);
        $this->approverAssigner->createRelation($deal, 400, 300)->shouldBeCalled();

        $this->listener->onDealRejected($event);
    }

    public function testOnDealRejected_NotExternalUser()
    {
        $token = new PostAuthenticationGuardToken(
            $this->prophesize(UserInterface::class)->reveal(), 'test', []
        );

        $deal = new Deal();
        $event = new RejectedEvent($deal);

        $this->tokenStorage->setToken($token);
        $this->approverAssigner->createRelation(Argument::cetera())->shouldNotBeCalled();

        $this->listener->onDealRejected($event);
    }

    public function testOnDealRegistered()
    {
        $deal = new Deal();
        $event = new SubmissionEvent($deal);

        $loyalty = new Loyalty();
        $loyalty->setConfiguration([
            'approver' => [
                'id' => 100,
                'company_id' => 500,
            ],
        ]);

        $this->loyaltyIdentifier->getActiveLoyalty()->shouldBeCalled()->willReturn($loyalty);
        $this->approverAssigner->createRelation($deal, 100, 500)->shouldBeCalled();

        $this->listener->onDealRegistered($event);
    }

    public function testOnDealRegistered_NotCallToAssigner()
    {
        $deal = new Deal();
        $event = new SubmissionEvent($deal);

        $loyalty = new Loyalty();

        $this->loyaltyIdentifier->getActiveLoyalty()->shouldBeCalled()->willReturn($loyalty);
        $this->approverAssigner->createRelation(Argument::cetera())->shouldNotBeCalled();

        $this->listener->onDealRegistered($event);

        $loyalty->setConfiguration([
            'approver' => [],
        ]);
        $this->listener->onDealRegistered($event);

        $loyalty->setConfiguration([
            'approver' => [
                'id' => 500,
            ],
        ]);
        $this->listener->onDealRegistered($event);

        $loyalty->setConfiguration([
            'approver' => [
                'company_id' => 500,
            ],
        ]);
        $this->listener->onDealRegistered($event);

        $loyalty->setConfiguration([
            'approver' => [
                'id' => null,
                'company_id' => null,
            ],
        ]);
        $this->listener->onDealRegistered($event);
    }
}
