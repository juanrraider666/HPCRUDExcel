<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Tests\Loyalty\Theme;

use AppBundle\Entity\Loyalty;
use AppBundle\Loyalty\Exception\LoyaltyNotExistsException;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;
use AppBundle\Loyalty\Theme\TwigTemplateResolver;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class TwigTemplateResolverTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var TwigTemplateResolver
     */
    private $resolver;
    /** @var \Twig_Environment */
    private $twig;
    /** @var LoyaltyIdentifierInterface */
    private $loyaltyIdentifier;
    /** @var Loyalty */
    private $activeLoyalty;

    public function setUp()
    {
        $this->twig = $this->prophesize(\Twig_Environment::class);
        $this->loyaltyIdentifier = $this->prophesize(LoyaltyIdentifierInterface::class);
        $this->activeLoyalty = $this->prophesize(Loyalty::class);
        $this->loyaltyIdentifier->getActiveLoyalty()->willReturn(
            $this->activeLoyalty->reveal()
        );

        $this->resolver = new TwigTemplateResolver(
            $this->twig->reveal(),
            $this->loyaltyIdentifier->reveal()
        );
    }

    public function testResolverResolveTemplate()
    {
        $templateNames = ['_theme/tpp/deal/list.html.twig', 'deal/list.html.twig'];

        $this->loyaltyIdentifier->getActiveLoyalty()->shouldBeCalled();
        $this->activeLoyalty->getCode()->willReturn('tpp')->shouldBeCalled();

        $this->twig->resolveTemplate($templateNames)->willReturn(
            $expected = $this->prophesize(\Twig_Template::class)->reveal()
        );

        $template = $this->resolver->resolve('deal/list.html.twig');

        $this->assertSame($expected, $template);
    }

    public function TemplatePosibilitiesDataProvider()
    {
        return [
            ['tpp', 'deal/list.html.twig', ['_theme/tpp/deal/list.html.twig', 'deal/list.html.twig']],
            ['tpp', 'base.html.twig', ['_theme/tpp/base.html.twig', 'base.html.twig']],
            ['hp_bc', 'base.html.twig', ['_theme/hp_bc/base.html.twig', 'base.html.twig']],
            ['hp_bc', 'deal/create.html.twig', ['_theme/hp_bc/deal/create.html.twig', 'deal/create.html.twig']],
            ['hp_bc', 'deal/a/b.html.twig', ['_theme/hp_bc/deal/a/b.html.twig', 'deal/a/b.html.twig']],
        ];
    }

    public function TemplatePosibilitiesDataProviderWithoutActiveLoyalty()
    {
        return [
            ['deal/list.html.twig'],
            ['base.html.twig'],
            ['base.html.twig'],
            ['deal/create.html.twig'],
            ['deal/a/b.html.twig'],
        ];
    }

    /**
     * @dataProvider TemplatePosibilitiesDataProvider
     */
    public function testGetTemplatePosibilities($loyaltyCode, $name, $expectedNames)
    {
        $this->activeLoyalty->getCode()->willReturn($loyaltyCode);

        $result = $this->resolver->getTemplatePosibilities($name);

        $this->assertSame($expectedNames, $result);
    }

    /**
     * @dataProvider TemplatePosibilitiesDataProviderWithoutActiveLoyalty
     */
    public function testGetTemplatePosibilitiesWithoutActiveLoyalty($name)
    {
        $this->activeLoyalty->getCode()->willThrow(LoyaltyNotExistsException::class);

        $result = $this->resolver->getTemplatePosibilities($name);

        $this->assertSame([$name], $result);
    }
}
