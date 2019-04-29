<?php
/*
 * This file is part of the Optime Consulting Company.
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Loyalty\Theme;

use AppBundle\Entity\Loyalty;
use AppBundle\Loyalty\Exception\LoyaltyNotExistsException;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class TwigTemplateResolver
{
    /**
     * @var \Twig_Environment
     */
    private $twig;
    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;

    /**
     * TwigTemplateResolver constructor.
     * @param \Twig_Environment $twig
     */
    public function __construct(\Twig_Environment $twig, LoyaltyIdentifierInterface $loyaltyIdentifier)
    {
        $this->twig = $twig;
        $this->loyaltyIdentifier = $loyaltyIdentifier;
    }

    /**
     * @param string $name
     * @return \Twig_Template
     * @throws \Exception
     * @throws \Twig_Error_Loader
     */
    public function resolve($name)
    {
        return $this->twig->resolveTemplate($this->getTemplatePosibilities($name));
    }

    /**
     * @param string $name
     * @return array
     */
    public function getTemplatePosibilities($name)
    {
        try {
            $loyalty = $this->loyaltyIdentifier->getActiveLoyalty();

            return [sprintf('_theme/%s/%s', $loyalty->getCode(), $name), $name];
        } catch (LoyaltyNotExistsException $e) {
            return [$name];
        }
    }
}