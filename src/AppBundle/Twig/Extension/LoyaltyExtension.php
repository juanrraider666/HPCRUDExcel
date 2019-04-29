<?php

namespace AppBundle\Twig\Extension;

use AppBundle\Loyalty\Exception\LoyaltyNotExistsException;
use Symfony\Component\DependencyInjection\ContainerInterface;

class LoyaltyExtension extends \Twig_Extension
{
    /**
     * @var ContainerInterface
     */
    private $container;

    /**
     * LoyaltyExtension constructor.
     * @param ContainerInterface $container
     */
    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function getFunctions()
    {
        return array(
            new \Twig_SimpleFunction('active_loyalty', array($this, 'getActiveLoyalty')),
            new \Twig_SimpleFunction('loyalty_templates', array($this, 'getTemplatePosibilities')),
            new \Twig_SimpleFunction('loyalty_asset', array($this, 'getAsset')),
            new \Twig_SimpleFunction('loyalty_asset_exists', array($this, 'assetExists')),
        );
    }

    /**
     * Returns the name of the extension.
     *
     * @return string The extension name
     */
    public function getName()
    {
        return 'loyalty_identifier_extension';
    }

    /**
     * @return \AppBundle\Entity\Loyalty|null
     * @throws \Exception
     */
    public function getActiveLoyalty()
    {
        try {
            return $this->container->get('app.loyalty.loyalty_identifier')->getActiveLoyalty();
        } catch (LoyaltyNotExistsException $e) {
            return;
        }
    }

    /**
     * @param string $name
     * @return array
     */
    public function getTemplatePosibilities($name)
    {
        return $this->container->get('app.template_resolver.twig')->getTemplatePosibilities($name);
    }

    /**
     * @param $name
     * @return string
     */
    public function getAsset($name)
    {
        return $this->container->get('app.resolver.assets')->resolve($name);
    }

    /**
     * @param $name
     * @param $theme
     * @return bool
     */
    public function assetExists($name, $theme)
    {
        return $this->container->get('app.resolver.assets')->fileExistsForTheme($name, $theme);
    }
}
