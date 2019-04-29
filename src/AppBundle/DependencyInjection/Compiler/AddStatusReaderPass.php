<?php

namespace AppBundle\DependencyInjection\Compiler;

use Symfony\Component\DependencyInjection\Compiler\CompilerPassInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Reference;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class AddStatusReaderPass implements CompilerPassInterface
{
    public function process(ContainerBuilder $container)
    {
//        if (false === $container->hasDefinition('app.status_reader')) {
//            return;
//        }

   //     $definition = $container->getDefinition('app.status_reader');

     /*   foreach ($container->findTaggedServiceIds('loyalty.status_reader') as $id => $attributes) {
            $alias = $attributes[0]['alias'];
            $definition->addMethodCall('addReader', array(new Reference($id), $alias));
        }*/
    }
}