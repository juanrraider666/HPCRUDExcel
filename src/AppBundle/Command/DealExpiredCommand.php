<?php

namespace AppBundle\Command;


use AppBundle\Entity\Deal;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class DealExpiredCommand extends ContainerAwareCommand
{
    protected function configure()
    {
        $this->setName('deal:expired-state')
             ->setDescription('Set deals to expired state and send close to expire notifications');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $dealsCloseToExpire = $this->getContainer()
            ->get('app.deal.close_to_expire')
            ->NotifyDealsCloseToExpire();

        $dealsExpired = $this->getContainer()
            ->get('app.deal.expired')->setDealsToExpiredState();

        if($dealsCloseToExpire == null) $dealsCloseToExpire = 0;
        if($dealsExpired == null) $dealsExpired = 0;

        $output->writeln('<info>Deals close to expired: '. $dealsCloseToExpire .'</info>');
        $output->writeln('<info>Deals set to ' . Deal::EXPIRED_STATE . ': '. $dealsExpired .'</info>');
    }
}