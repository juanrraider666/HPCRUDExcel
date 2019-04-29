<?php

namespace AppBundle\Twig\Extension;

use AppBundle\Loyalty\LoyaltyIdentifierInterface;

class LayoutExtension extends \Twig_Extension
{

    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;

    /**
     * LayoutExtension constructor.
     * @param LoyaltyIdentifierInterface $loyaltyIdentifier
     */
    public function __construct(LoyaltyIdentifierInterface $loyaltyIdentifier)
    {
        $this->loyaltyIdentifier = $loyaltyIdentifier;
    }


    public function extendLayout()
    {
        $loyalty = $this->loyaltyIdentifier->getActiveLoyalty();

        switch($loyalty->getCode()){
            case 'tpp':
                return 'base.html.twig';
            case 'hp':
                return 'base_bootstrap.html.twig';
            default:
                return 'base.html.twig';
        }
    }

    public function getFunctions()
    {
        return array(
            new \Twig_SimpleFunction('extend_layout', array($this, 'extendLayout')),
        );
    }

    public function getName()
    {
        return 'layout_extension';
    }
}