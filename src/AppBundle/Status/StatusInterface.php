<?php

namespace AppBundle\Status;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
interface StatusInterface
{
    public function getStatus();
    public function getStatusReference();
}