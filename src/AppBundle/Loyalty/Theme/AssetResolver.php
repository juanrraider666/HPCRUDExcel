<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Loyalty\Theme;

use AppBundle\Loyalty\Exception\LoyaltyNotExistsException;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class AssetResolver
{
    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;
    private $themeWebPath;
    private $themeDir;
    private $defaultTheme;

    /**
     * @param LoyaltyIdentifierInterface $loyaltyIdentifier
     * @param $themeWebPath
     * @param $themeDir
     * @param $defaultTheme
     */
    public function __construct(LoyaltyIdentifierInterface $loyaltyIdentifier, $themeWebPath, $themeDir, $defaultTheme)
    {
        $this->loyaltyIdentifier = $loyaltyIdentifier;
        $this->themeWebPath = rtrim($themeWebPath, '/');
        $this->themeDir = rtrim($themeDir, '/');
        $this->defaultTheme = $defaultTheme;
    }

    /**
     * @param $name
     * @return string
     */
    public function resolve($name)
    {
        $code = $this->getLoyaltyCode();

        if ($this->fileExistsForTheme($name, $code)) {
            return $this->createPath($name, $code);
        } else {
            return $this->createPath($name, $this->defaultTheme);
        }
    }

    public function fileExistsForTheme($name, $theme)
    {
        return is_file(sprintf('%s/%s/%s', $this->themeDir, $theme, $name));
    }

    private function createPath($name, $theme)
    {
        return sprintf('%s/%s/%s', $this->themeWebPath, $theme, $name);
    }

    /**
     * @return string
     */
    private function getLoyaltyCode()
    {
        try {
            $activeLoyalty = $this->loyaltyIdentifier->getActiveLoyalty();

            return $activeLoyalty->getCode();
        } catch (LoyaltyNotExistsException $e) {
            return '_default';
        }
    }
}