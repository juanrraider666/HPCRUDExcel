<?php

namespace AppBundle\DependencyInjection;

use Symfony\Component\Config\Definition\Builder\ArrayNodeDefinition;
use Symfony\Component\Config\Definition\Builder\TreeBuilder;
use Symfony\Component\Config\Definition\ConfigurationInterface;

/**
 * This is the class that validates and merges configuration from your app/config files
 *
 * To learn more see {@link http://symfony.com/doc/current/cookbook/bundles/extension.html#cookbook-bundles-extension-config-class}
 */
class Configuration implements ConfigurationInterface
{
    /**
     * {@inheritdoc}
     */
    public function getConfigTreeBuilder()
    {
        $treeBuilder = new TreeBuilder();
        $rootNode = $treeBuilder->root('app');

        // Here you should define the parameters that are allowed to
        // configure your bundle. See the documentation linked above for
        // more information on that topic.

        $this->addEmailSection($rootNode);


        return $treeBuilder;
    }

    protected function addSecuritySection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('security')
                    ->isRequired()
                    ->children()
                        ->scalarNode('login_path')
                            ->isRequired()
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('select_company_path')
                            ->cannotBeEmpty()
                            ->isRequired()
                        ->end()
                        ->scalarNode('confirm_terms_path')
                            ->isRequired()
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('landing_path')
                            ->isRequired()
                            ->cannotBeEmpty()
                        ->end()
                        ->scalarNode('first_login_target_path')->end()
                        ->arrayNode('loyalty_api_key')
                            ->children()
                                ->scalarNode('public')->isRequired()->cannotBeEmpty()->end()
                                ->scalarNode('private')->isRequired()->cannotBeEmpty()->end()
                            ->end()
                        ->end()
                    ->end()
                ->end()
            ->end();
    }

    protected function addProductSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('product')
                    ->children()
                        ->arrayNode('filters')
                            ->children()
                                ->booleanNode('profile')->defaultFalse()->end()
                                ->booleanNode('country')->defaultFalse()->end()
                                ->booleanNode('company_level')->defaultFalse()->end()
                                ->booleanNode('company_subtype')->defaultFalse()->end()
                            ->end()
                        ->end()
                    ->end()
                ->end()
            ->end();
    }

    protected function addRegistrationSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('registration')
                    ->isRequired()
                    ->children()
                        ->booleanNode('require_confirmation')->defaultTrue()->end()
                        ->booleanNode('require_company_confirmation')->defaultFalse()->end()
                        ->scalarNode('generic_password')->isRequired()->cannotBeEmpty()->end()
                        ->booleanNode('show_approve_terms_page')->defaultTrue()->end()
                        ->booleanNode('force_generic_password')->defaultTrue()->end()
                    ->end()
                ->end()
            ->end();
    }

    protected function addPrizeCentralSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('prize_central')
                    ->isRequired()
                    ->children()
                        ->scalarNode('namespace')->cannotBeEmpty()->defaultValue('prize-central')->end()
                        ->scalarNode('wsdl')->isRequired()->cannotBeEmpty()->end()
                        ->scalarNode('username')->isRequired()->cannotBeEmpty()->end()
                        ->scalarNode('password')->isRequired()->cannotBeEmpty()->end()
                    ->end()
                ->end()
            ->end();
    }

    protected function addPrizeTrackingSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('prize_tracking')
                    ->isRequired()
                    ->children()
                        ->scalarNode('namespace')->cannotBeEmpty()->defaultValue('prize-tracking')->end()
                        ->scalarNode('wsdl')->isRequired()->cannotBeEmpty()->end()
                        ->scalarNode('username')->isRequired()->cannotBeEmpty()->end()
                        ->scalarNode('password')->isRequired()->cannotBeEmpty()->end()
                        ->arrayNode('card_security')
                            ->isRequired()
                            ->children()
                                ->scalarNode('hmac_key')->isRequired()->cannotBeEmpty()->end()
                                ->scalarNode('encryption_key')->isRequired()->cannotBeEmpty()->end()
                            ->end()
                        ->end()
                        ->arrayNode('prize_type')
                            ->isRequired()
                            ->validate()
                                ->always()
                                ->then(function($v){
                                    if(!in_array($v['default'], $v['types'])){
                                        throw new \InvalidArgumentException(
                                            sprintf('La opción default="%s" no es válida, los valores validos son: [%s]'
                                            , $v['default'], join(', ', $v['types']))
                                        );
                                    }

                                    if(!array_key_exists($v['reloadable_card'], $v['types'])){
                                        throw new \InvalidArgumentException(
                                            sprintf('La opción reloadable_card="%s" no es válida, los valores validos son: [%s]'
                                            , $v['reloadable_card'], join(', ', array_keys($v['types'])))
                                        );
                                    }

                                    if(!array_key_exists($v['digital_reward'], $v['types'])){
                                        throw new \InvalidArgumentException(
                                            sprintf('La opción digital_reward="%s" no es válida, los valores validos son: [%s]'
                                            , $v['digital_reward'], join(', ', array_keys($v['types'])))
                                        );
                                    }

                                    return $v;
                                })
                            ->end()
                            ->children()
                                ->booleanNode('use_default')->defaultTrue()->end()
                                ->integerNode('reloadable_card')->isRequired()->cannotBeEmpty()->defaultValue(3)->end()
                                ->integerNode('digital_reward')->isRequired()->cannotBeEmpty()->defaultValue(4)->end()
                                ->scalarNode('default')->isRequired()->cannotBeEmpty()->end()
                                ->arrayNode('types')
                                    ->prototype('scalar')->end()
                                ->end()
                            ->end()
                        ->end()
                        ->arrayNode('checkout')
                            ->isRequired()
                            ->children()
                                ->scalarNode('control_number_prefix')->isRequired()->cannotBeEmpty()->end()
                            ->end()
                        ->end()
                    ->end()
                ->end()
            ->end();
    }

    protected function addAssetManagerSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('asset_manager')
                    ->canBeEnabled()
                    ->children()
                        ->scalarNode('namespace')->cannotBeEmpty()->defaultValue('asset-manager')->end()
                        ->scalarNode('wsdl')->isRequired()->cannotBeEmpty()->end()
                        ->scalarNode('api_key')->isRequired()->cannotBeEmpty()->end()
                        ->scalarNode('files_url')->isRequired()->cannotBeEmpty()->end()
                    ->end()
                ->end()
            ->end();
    }


    protected function addTrainingManagerSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('training_manager')
                    ->canBeEnabled()
                    ->children()
                        ->scalarNode('namespace')->cannotBeEmpty()->defaultValue('training-manager')->end()
                        ->scalarNode('wsdl')->isRequired()->cannotBeEmpty()->end()
                        ->scalarNode('username')->isRequired()->cannotBeEmpty()->end()
                        ->scalarNode('private_key')->isRequired()->cannotBeEmpty()->end()
                    ->end()
                ->end()
            ->end();
    }

    protected function addValidationSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('validation')
                    ->children()
                        ->arrayNode('email')
                            ->children()
                                ->scalarNode('pattern')->cannotBeEmpty()->defaultValue('.+')->end()
                                ->arrayNode('domains')
                                    ->prototype('scalar')
                                        ->defaultValue(array())
                                    ->end()
                                ->end()
                                ->booleanNode('match')->defaultTrue()->end()
                            ->end()
                        ->end()
                    ->end()
                ->end()
            ->end();
    }

    protected function addEmailSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('email')
                    ->children()
                        ->scalarNode('from_email')->cannotBeEmpty()->isRequired()->end()
                        ->scalarNode('from_name')->cannotBeEmpty()->isRequired()->end()
                        ->arrayNode('templates')
                            ->children()
                                ->scalarNode('deal_delete')->cannotBeEmpty()->isRequired()->end()
                                ->scalarNode('deal_approve')->cannotBeEmpty()->isRequired()->end()
                                ->scalarNode('deal_rejected')->cannotBeEmpty()->isRequired()->end()
                            ->end()
                        ->end()
                        ->arrayNode('options')
                            ->addDefaultsIfNotSet()
                            ->children()
                                ->scalarNode('transactional_group_id')->defaultNull()->end()
                                ->scalarNode('transactional_group_name')->defaultNull()->end()
                            ->end()
                        ->end()
                    ->end()
                ->end()
            ->end();
    }

    protected function addDesignSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('design')
                    ->children()
                        ->arrayNode('menu')
                            ->children()
                                ->booleanNode('editable')->defaultFalse()->end()
                                ->arrayNode('dropdown')
                                    ->children()
                                        ->arrayNode('levels')
                                            ->defaultValue(array(
                                                array(
                                                    'class' => 'dropdown',
                                                    'label_in_items' => false,
                                                )
                                            ))
                                            ->beforeNormalization()
                                                ->always()
                                                ->then(function($levels){
                                                    $normalized = array();

                                                    foreach($levels as $index => $level){
                                                        $normalized[$index + 1] = $level;
                                                    }

                                                    return $normalized;
                                                })
                                            ->end()
                                            ->prototype('array')
                                                ->children()
                                                    ->scalarNode('class')->isRequired()->end()
                                                    ->booleanNode('label_in_items')->defaultFalse()->end()
                                                ->end()
                                            ->end()
                                        ->end()
                                    ->end()
                                ->end()
                            ->end()
                        ->end()
                    ->end()
                ->end()
            ->end();
    }

    protected function addLanguagesSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
                ->arrayNode('languages')
                    ->requiresAtLeastOneElement()
                    ->useAttributeAsKey('locale')
                    ->prototype('array')
                        ->children()
                            ->arrayNode('date_format')
                                ->children()
                                    ->scalarNode('icu')->defaultNull()->end()
                                    ->scalarNode('php')->defaultNull()->end()
                                    ->scalarNode('datepicker')->defaultNull()->end()
                                ->end()
                                ->beforeNormalization()
                                    ->ifTrue(function ($v) {return !empty($v['icu']) and empty($v['datepicker']);})
                                    ->then(function ($v) {
                                        $v['datepicker'] = $v['icu'];

                                        return $v;
                                    })
                                ->end()
                            ->end()
                        ->end()
                    ->end()
                ->end()
            ->end();
    }
    protected function addDistributionPointSection(ArrayNodeDefinition $nodeDefinition)
    {
        $nodeDefinition
            ->children()
            ->arrayNode('distribution_point')
                ->isRequired()
                    ->children()
                        ->scalarNode('user_percent')->isRequired()->cannotBeEmpty()->end()
                    ->end()
                ->end()
            ->end();
    }
}
