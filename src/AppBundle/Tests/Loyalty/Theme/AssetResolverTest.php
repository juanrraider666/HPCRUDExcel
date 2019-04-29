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
use AppBundle\Loyalty\Theme\AssetResolver;
use org\bovigo\vfs\vfsStream;
use org\bovigo\vfs\vfsStreamDirectory;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class AssetResolverTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var  vfsStreamDirectory
     */
    private $filesystemRoot;

    /**
     * @var AssetResolver
     */
    private $assetResolver;
    private $themesPath;
    private $themesWebPath;
    private $defaultTheme = '_default';
    private $loyaltyIdentifier;
    private $activeLoyalty;

    public function setUp()
    {
        $this->filesystemRoot = vfsStream::setup('root', null, $this->getThemeStructureDir());

        $this->themesPath = $this->filesystemRoot->url().'/theme';
        $this->themesWebPath = '/theme/';

        $this->loyaltyIdentifier = $this->prophesize(LoyaltyIdentifierInterface::class);

        $this->activeLoyalty = $this->prophesize(Loyalty::class);
        $this->loyaltyIdentifier->getActiveLoyalty()->willReturn(
            $this->activeLoyalty->reveal()
        );

        $this->assetResolver = new AssetResolver(
            $this->loyaltyIdentifier->reveal(),
            $this->themesWebPath,
            $this->themesPath,
            $this->defaultTheme
        );
    }

    public function testResolveDataProvider()
    {
        return [
            ['css/app.css', '_default'],
            ['js/app.js', '_default'],
            ['js/other.js', 'tpp'],
            ['img/a.png', '_default'],
            ['img/b.png', 'tpp'],
            ['img/sub-path/a.png', '_default'],
            ['img/sub-path/b.png', 'tpp'],
        ];
    }

    /**
     * @dataProvider testResolveDataProvider
     */
    public function testResolve($asset, $theme)
    {
        $this->activeLoyalty->getCode()->shouldBeCalled()->willReturn($theme);

        $result = $this->assetResolver->resolve($asset);
        $expected = $this->createExpectedString($asset, $theme);

        $this->assertSame($expected, $result);
    }

    /**
     * @dataProvider testResolveDataProvider
     */
    public function testResolveWithoutActiveLoyalty($asset)
    {
        $this->loyaltyIdentifier->getActiveLoyalty()->willThrow(LoyaltyNotExistsException::class);
        $this->activeLoyalty->getCode()->shouldNotBeCalled();

        $result = $this->assetResolver->resolve($asset);
        $expected = $this->createExpectedString($asset, '_default');

        $this->assertSame($expected, $result);
    }

    public function testAssetExists()
    {
        $result = $this->assetResolver->fileExistsForTheme('img/b.png', 'tpp');
        $this->assertTrue($result);

        $result = $this->assetResolver->fileExistsForTheme('css/app.css', '_default');
        $this->assertTrue($result);

        $result = $this->assetResolver->fileExistsForTheme('css/app_not_exists.css', 'tpp');
        $this->assertFalse($result);
    }

    private function createExpectedString($name, $theme = null)
    {
        return sprintf('%s/%s/%s', rtrim($this->themesWebPath, '/'), $theme ?: $this->defaultTheme, $name);
    }

    /**
     * @return array
     */
    private function getThemeStructureDir()
    {
        return [
            'theme' => [
                '_default' => [
                    'css' => ['app.css' => '.content{}'],
                    'js' => [
                        'app.js' => '(function(){})();',
                        'other.js' => '(function(){})();',
                    ],
                    'img' => [
                        'sub-path' => [
                            'a.png' => '',
                            'b.png' => '',
                        ],
                        'a.png' => '',
                        'b.png' => '',
                    ],
                ],
                'tpp' => [
                    'js' => [
                        'other.js' => '(function(){})();',
                    ],
                    'img' => [
                        'sub-path' => [
                            'b.png' => '',
                        ],
                        'b.png' => '',
                    ],
                ],
            ],
        ];
    }
}
