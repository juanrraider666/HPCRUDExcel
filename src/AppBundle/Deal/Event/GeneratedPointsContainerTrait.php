<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Deal\Event;

use AppBundle\Entity\DealPoint;


/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
trait GeneratedPointsContainerTrait
{
    /**
     * @var DealPoint
     */
    private $genetaredPoints;

    public function getGeneratedPoints()
    {
        return $this->genetaredPoints;
    }

    /**
     * @param DealPoint $genetaredPoints
     */
    public function setGenetaredPoints($genetaredPoints)
    {
        $this->genetaredPoints = $genetaredPoints;
    }
}