<?php

namespace AppBundle\DependencyInjection;

use Symfony\Component\Config\FileLocator;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Loader;
use Symfony\Component\HttpKernel\DependencyInjection\Extension;

/**
 * This is the class that loads and manages your bundle configuration
 *
 * To learn more see {@link http://symfony.com/doc/current/cookbook/bundles/extension.html}
 */
class AppExtension extends Extension
{
    /**
     * {@inheritdoc}
     */
    public function load(array $configs, ContainerBuilder $container)
    {
        $configs[0]['email']['from_email']='info@devsym.adobepcclub.com';
        $configs[0]['email']['from_name']='HPI';
        $configs[0]['email']['templates']['deal_delete']='deal.delete';
        $configs[0]['email']['templates']['deal_approve']='deal.approve';
        $configs[0]['email']['templates']['deal_rejected']='deal.rejected';
        
        
        
        $configuration = new Configuration();
        $config = $this->processConfiguration($configuration, $configs);

        $loader = new Loader\YamlFileLoader($container, new FileLocator(
            $container->getParameter('kernel.root_dir') . '/config/services/optional'
        ));

        
        $this->setEmailConfiguration($container, $config['email']);
        

        
    }
    private function setEmailConfiguration(ContainerBuilder $container, $config)
    {
        $container->setParameter('app.email.from_email', $config['from_email']);
        $container->setParameter('app.email.from_name', $config['from_name']);
        $container->setParameter('app.email.templates.password_resetting', null);
        $container->setParameter('app.registration.generic_password', null);
        
        //Email Deal Actions configuration
        $container->setParameter('app.email.templates.deal_delete',
        $config['templates']['deal_delete']);
        
        $container->setParameter('app.email.templates.deal_approve',
        $config['templates']['deal_approve']);
        
        $container->setParameter('app.email.templates.deal_rejected',
        $config['templates']['deal_rejected']);
        
        $container->setParameter('app.email.options',null);
        
    }

    
}
