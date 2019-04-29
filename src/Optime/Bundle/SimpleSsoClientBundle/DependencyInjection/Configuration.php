<?php

namespace Optime\Bundle\SimpleSsoClientBundle\DependencyInjection;

use Symfony\Component\Config\Definition\Builder\TreeBuilder;
use Symfony\Component\Config\Definition\ConfigurationInterface;

/**
 * This is the class that validates and merges configuration from your app/config files.
 *
 * To learn more see {@link http://symfony.com/doc/current/cookbook/bundles/configuration.html}
 */
class Configuration implements ConfigurationInterface
{
    /**
     * {@inheritdoc}
     */
    public function getConfigTreeBuilder()
    {
        $treeBuilder = new TreeBuilder();
        $rootNode = $treeBuilder->root('simple_sso_client');

        $rootNode
            ->validate()
                ->ifTrue(function($v){ return $v['remote_connection_service'] ==  'simple_sso_client.default_remote_connection'; })
                ->then(function($v){
                    // Si se está usando el servicio por defecto, los parametros:
                    // username, password, url son requeridos

                    foreach (['username', 'password', 'url'] as $key) {
                        if(empty($v[$key])){
                            throw new \InvalidArgumentException(
                                sprintf('The key "%s" is required', $key)
                            );
                        }
                    }

                    return $v;
                })
            ->end()
            ->children()
                ->booleanNode('roles_from_profile')->defaultFalse()->end()
                ->scalarNode('username')->defaultNull()->cannotBeEmpty()->end()
                ->scalarNode('password')->defaultNull()->cannotBeEmpty()->end()
                ->scalarNode('url')->cannotBeEmpty()->defaultNull()->end()
                ->scalarNode('remote_connection_service')
                    ->cannotBeEmpty()
                    ->defaultValue('simple_sso_client.default_remote_connection')
                ->end()
                ->scalarNode('roles_resolver_service')
                    ->cannotBeEmpty()
                    ->defaultValue('simple_sso_client.security.roles_resolver.default')
                ->end()
            ->end();

        return $treeBuilder;
    }
}
