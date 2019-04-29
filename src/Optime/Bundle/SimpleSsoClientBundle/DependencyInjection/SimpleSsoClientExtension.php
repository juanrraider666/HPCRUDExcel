<?php

namespace Optime\Bundle\SimpleSsoClientBundle\DependencyInjection;

use Symfony\Component\Config\FileLocator;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Loader;
use Symfony\Component\DependencyInjection\Reference;
use Symfony\Component\HttpKernel\DependencyInjection\Extension;

/**
 * This is the class that loads and manages your bundle configuration.
 *
 * @link http://symfony.com/doc/current/cookbook/bundles/extension.html
 */
class SimpleSsoClientExtension extends Extension
{
    /**
     * {@inheritdoc}
     */
    public function load(array $configs, ContainerBuilder $container)
    {
        $configuration = new Configuration();
        $config = $this->processConfiguration($configuration, $configs);

        $loader = new Loader\YamlFileLoader($container, new FileLocator(__DIR__.'/../Resources/config'));
        $loader->load('services.yml');

        $container->findDefinition('simple_sso_client.security.roles_resolver.default')
            ->replaceArgument(0, $config['roles_from_profile']);

        $this->configureRemoteConnectionService($container, $config);
        $this->configureRolesResolverService($container, $config);

    }

    /**
     * @param ContainerBuilder $container
     * @param $config
     */
    protected function configureRemoteConnectionService(ContainerBuilder $container, $config)
    {
        $serviceId = $config['remote_connection_service'];

        if ($serviceId == 'simple_sso_client.default_remote_connection') {
            $container->findDefinition('simple_sso_client.default_remote_connection')
                ->replaceArgument(0, $config['username'])
                ->replaceArgument(1, $config['password'])
                ->replaceArgument(2, rtrim($config['url'], '/'));
        } else {
            $container->removeDefinition('simple_sso_client.default_remote_connection');
            $container->setParameter('simple_sso_client.remote_connection.service', $serviceId);
        }

        $container->setAlias('simple_sso_client.remote_connection', $serviceId);
    }

    /**
     * @param ContainerBuilder $container
     * @param $config
     */
    protected function configureRolesResolverService(ContainerBuilder $container, $config)
    {
        $container->findDefinition('simple_sso_client.security.simple_sso_authenticator')
            ->replaceArgument(1, new Reference($config['roles_resolver_service']));
    }
}
