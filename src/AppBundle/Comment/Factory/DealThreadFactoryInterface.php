<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
namespace AppBundle\Comment\Factory;

use AppBundle\Entity\Deal;
use AppBundle\Entity\DealThread;


/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
interface DealThreadFactoryInterface
{
    /**
     * @param Deal $deal
     * @return DealThread
     */
    public function create(Deal $deal, $permalink);
}