<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Security\Voter;

use AppBundle\Entity\Deal;
use AppBundle\Entity\DealSubmitter;
use AppBundle\Security\Voter\UploadSupportVoter;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Authorization\Voter\VoterInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class UploadSupportVoterTest extends \PHPUnit_Framework_TestCase
{

    /**
     * @var UploadSupportVoter
     */
    private $voter;

    public function setUp()
    {
        $this->voter = new UploadSupportVoter();
    }

    public function voteAbstainDataProvider()
    {
        $deal = $this->prophesize(Deal::class)->reveal();
        yield [null, ['upload_support']];
        yield [null, ['support_upload']];
        yield [new \stdClass(), ['upload_support']];
        yield [new \stdClass(), ['support_upload']];
        yield [$deal, ['other']];
        yield [$deal, ['support_upload']];
    }

    /**
     * @param $object
     * @param $attributes
     *
     * @dataProvider voteAbstainDataProvider
     */
    public function testVoteAbstain($object, $attributes)
    {
        $token = $this->prophesize(TokenInterface::class)->reveal();

        $result = $this->voter->vote($token, $object, $attributes);

        $this->assertSame(VoterInterface::ACCESS_ABSTAIN, $result);
    }

    /**
     * @param $object
     * @param $attributes
     */
    public function testVoteGranted()
    {
        $token = $this->prophesize(TokenInterface::class);
        $deal = $this->prophesize(Deal::class);
        $dealSubmitter = $this->prophesize(DealSubmitter::class);

        $token->getUsername()->willReturn('test');

        $dealSubmitter->getUsername()->willReturn('test');

        $deal->getSubmitter()->willReturn($dealSubmitter->reveal());
        $deal->getStatus()->willReturn(Deal::WON_STATE)->shouldBeCalled();
        $deal->getIsConfirmed()->willReturn(false)->shouldBeCalled();

        $result = $this->voter->vote($token->reveal(), $deal->reveal(), ['upload_support']);

        $this->assertSame(VoterInterface::ACCESS_GRANTED, $result, 'El voter debe retornar acceso garantizado');
    }

    public function voteDeniedDataProvider()
    {
        yield ['test', 'test1', Deal::APPROVED_STATE, false];
        yield ['test', 'test2', Deal::CANCELED_STATE, true];
        yield ['test', 'test', Deal::WON_STATE, true];
        yield ['test', 'test2', Deal::WON_STATE, true];
        yield ['test', 'test2', Deal::WON_STATE, false];
        yield ['test', 'test', Deal::EXPIRED_STATE, true];
    }

    /**
     * @param $username
     * @param $submitterUsername
     * @param $status
     * @param $confirmed
     *
     * @dataProvider voteDeniedDataProvider
     */
    public function testVoteDenied($username, $submitterUsername, $status, $confirmed)
    {
        $token = $this->prophesize(TokenInterface::class);
        $deal = $this->prophesize(Deal::class);
        $dealSubmitter = $this->prophesize(DealSubmitter::class);

        $token->getUsername()->willReturn($username);

        $dealSubmitter->getUsername()->willReturn($submitterUsername);

        $deal->getSubmitter()->willReturn($dealSubmitter->reveal());
        $deal->getStatus()->willReturn($status);
        $deal->getIsConfirmed()->willReturn($confirmed);

        $result = $this->voter->vote($token->reveal(), $deal->reveal(), ['upload_support']);

        $this->assertSame(VoterInterface::ACCESS_DENIED, $result, 'El voter debe retornar acceso denegado');
    }
}
