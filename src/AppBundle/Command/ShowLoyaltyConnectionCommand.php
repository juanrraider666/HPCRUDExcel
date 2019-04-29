<?php

namespace AppBundle\Command;

use AppBundle\Entity\Loyalty;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\StyleInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Component\Yaml\Yaml;

class ShowLoyaltyConnectionCommand extends ContainerAwareCommand
{
    /**
     * {@inheritdoc}
     */
    protected function configure()
    {
        $this
            ->setName('loyalty:show')
            ->setDescription('Muestra la configuracion de conexion de un loyalty')
            ->addArgument('code', InputArgument::OPTIONAL, 'Codigo del loyalty');

    }

    /**
     * {@inheritdoc}
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $io = new SymfonyStyle($input, $output);

        if (null != $input->getArgument('code')) {
            $this->showLoyaltyInformation($io, $input);
        } else {
            $this->showLoyalties($io);
        }
    }

    /**
     * @param InputInterface $input
     * @param $io
     */
    protected function showLoyaltyInformation(StyleInterface $io, InputInterface $input)
    {
        $loyaltyCode = $input->getArgument('code');
        $loyalty = $this->getContainer()->get('app.repository.loyalty')->findOneByCode($loyaltyCode);

        if (!$loyalty) {
            $io->error(sprintf('No existe una conexion a un loyalty con el codigo "%s"', $loyaltyCode));

            return;
        }

        $io->section('Informacion del loyalty:');

        $io->table(['Atributo', 'valor'], [
            ['Nombre', $loyalty->getName()],
            ['SSO base URL', $loyalty->getSsoBaseUrl()],
            ['Api WSDL', $loyalty->getWsdl()],
            ['Activo', $this->booleanText($loyalty->isIsActive())],
            ['Configuracion', Yaml::dump($loyalty->getConfiguration(), 100, 2)],
        ]);
    }

    /**
     * @param $io
     */
    protected function showLoyalties($io)
    {
        $io->section('Loyalties registrados:');

        $io->table(['Loyalty', 'Codigo', 'Activo'], iterator_to_array($this->getLoyalties()));
    }

    /**
     * @return \Generator
     */
    private function getLoyalties()
    {
        $loyalties = $this->getContainer()->get('app.repository.loyalty')->findAll();

        /** @var Loyalty $loyalty */
        foreach ($loyalties as $loyalty) {
            yield [
                $loyalty->getName(),
                $loyalty->getCode(),
                $this->booleanText($loyalty->getIsActive()),
            ];
        }
    }

    /**
     * @param $condition
     * @return string
     */
    private function booleanText($condition)
    {
        return $condition ? "<fg=green>Si</>" : '<fg=red>No</>';
    }
}
