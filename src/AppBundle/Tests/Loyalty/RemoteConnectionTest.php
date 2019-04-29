<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Loyalty;

use AppBundle\Entity\Loyalty;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;
use AppBundle\Loyalty\RemoteConnection;
use Symfony\Component\HttpFoundation\HeaderBag;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class RemoteConnectionTest extends \PHPUnit_Framework_TestCase
{
    private $requestStack;
    private $request;

    /**
     * @var RemoteConnection
     */
    private $remoteConnection;
    private $loyaltyIdentifier;
    private $loyalty;

    public function setUp()
    {
        $this->loyaltyIdentifier = $this->prophesize(LoyaltyIdentifierInterface::class);
        $this->loyalty = $this->prophesize(Loyalty::class);
        $this->requestStack = $this->prophesize(RequestStack::class);
        $this->request = $this->prophesize(Request::class);

        $this->requestStack->getCurrentRequest()->willReturn($this->request->reveal());
        $this->loyaltyIdentifier->getActiveLoyalty()->willReturn($this->loyalty->reveal());

        $this->remoteConnection = new RemoteConnection(
            $this->loyaltyIdentifier->reveal(),
            $this->requestStack->reveal()
        );

    }

    public function getLoginUrlWithRefererDataProvider()
    {
        yield ['http://deal.com/list', 'http://local.com/sso/', 'http://www.local.com', 'http://www.local.com/sso/login'];
        yield ['http://deal.com/list', 'http://local.a.com/sso/', 'http://www.local.com', 'http://www.local.com/sso/login'];
        yield ['http://deal.com/list', 'http://www.local.com/sso/', 'http://www.local.com', 'http://www.local.com/sso/login'];
        yield ['http://deal.com/list', 'http://abc.local.com/sso/', 'http://www2.local.com', 'http://www2.local.com/sso/login'];
        yield ['http://deal.com/list', 'http://local.com/sso/', 'http://deal.com/other', 'http://local.com/sso/login'];
        yield ['http://toshibadr.developerplace.net/list', 'http://local.com/sso/', 'http://toshibadr.developerplace.net/other', 'http://local.com/sso/login'];
        yield ['http://www.toshibadr.developerplace.net/list', 'http://local.com/sso/', 'http://www.toshibadr.developerplace.net/other', 'http://local.com/sso/login'];
        yield ['http://deal.com/list', 'http://hp.net/sso/', 'http://ingramcompany.hp.net/other', 'http://ingramcompany.hp.net/sso/login'];
        yield ['http://deal.com/list', 'http://hp.net/sso/', 'http://hp.ingramcompany.net/other', 'http://hp.ingramcompany.net/sso/login'];
    }

    /**
     * @param $loyaltyBaseUrl
     * @param $refererHost
     * @param $exceptedUrl
     *
     * @dataProvider getLoginUrlWithRefererDataProvider
     */
    public function testGetLoginUrlWithReferer($dealUrl, $loyaltyBaseUrl, $refererHost, $exceptedUrl)
    {
        $headers = $this->prophesize(HeaderBag::class);
        $this->request->headers = $headers->reveal();
        $this->request->getHost()->willReturn(parse_url($dealUrl, PHP_URL_HOST));

        $headers->has('referer')->willReturn(true);
        $headers->get('referer')->willReturn($refererHost);

        $this->loyalty->getSsoBaseUrl()->willReturn($loyaltyBaseUrl);

        $url = $this->remoteConnection->getLoginUrl();

        $this->assertSame($exceptedUrl, $url);
    }

    public function getVerificationUrlWithRefererDataProvider()
    {
        yield ['http://local.com/sso/', 'http://www.local.com', 'http://local.com/sso/verify'];
        yield ['http://local.a.com/sso/', 'http://www.local.com', 'http://local.a.com/sso/verify'];
        yield ['http://www.local.com/sso/', 'http://www.local.com', 'http://www.local.com/sso/verify'];
        yield ['http://abc.local.com/sso/', 'http://www2.local.com', 'http://abc.local.com/sso/verify'];
    }

    /**
     * @param $loyaltyBaseUrl
     * @param $refererHost
     * @param $expectedUrl
     *
     * @dataProvider getVerificationUrlWithRefererDataProvider
     */
    public function testGetVerificationUrlWithReferer($loyaltyBaseUrl, $refererHost, $expectedUrl)
    {
        $headers = $this->prophesize(HeaderBag::class);
        $this->request->headers = $headers->reveal();

        $headers->has('referer')->willReturn(true);
        $headers->get('referer')->willReturn($refererHost);

        $this->loyalty->getSsoBaseUrl()->willReturn($loyaltyBaseUrl);

        $url = $this->remoteConnection->getVerificationUrl();

        $this->assertSame($expectedUrl, $url);
    }
}
