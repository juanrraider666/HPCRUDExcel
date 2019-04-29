<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Entity;

use FOS\CommentBundle\Entity\Thread;
use Doctrine\ORM\Mapping as ORM;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 *
 * @ORM\Entity(repositoryClass="AppBundle\Entity\Repository\DealThreadRepository")
 * @ORM\Table(name="deal_threads")
 */
class DealThread extends Thread
{
    /**
     * @var Deal
     * @ORM\Id()
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    protected $id;

    /**
     * DealThread constructor.
     * @param Deal $deal
     */
    public function __construct(Deal $deal = null)
    {
        if ($deal) {
            if (null === $deal->getId()) {
                throw new \LogicException("No se puede crear un hilo de comentarios para un deal no persistido");
            }

            $this->id = $deal->getId();
        }
    }
}