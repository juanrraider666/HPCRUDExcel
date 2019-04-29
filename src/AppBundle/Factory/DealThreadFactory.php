<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Factory;

use AppBundle\Comment\Factory\DealThreadFactoryInterface;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealThread;
use FOS\CommentBundle\Model\ThreadManagerInterface;


/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealThreadFactory implements DealThreadFactoryInterface
{
    /**
     * @var ThreadManagerInterface
     */
    private $threadManager;

    /**
     * @param ThreadManagerInterface $threadManager
     */
    public function __construct(ThreadManagerInterface $threadManager)
    {
        $this->threadManager = $threadManager;
    }

    /**
     * @param Deal $deal
     * @return DealThread
     */
    public function create(Deal $deal, $permalink)
    {
        $dealThread = new DealThread($deal);
        $dealThread->setPermalink($permalink);

        $this->threadManager->saveThread($dealThread);

        return $dealThread;
    }
}