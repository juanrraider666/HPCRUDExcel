<?php

namespace AppBundle\Loyalty\PointAssignment;


interface PointInterface
{
    public function getPointValueTypeName();

    public function getDescription();
}