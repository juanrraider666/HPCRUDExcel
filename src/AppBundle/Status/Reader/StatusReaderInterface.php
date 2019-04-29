<?php

namespace AppBundle\Status\Reader;

use AppBundle\Status\StatusInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
interface StatusReaderInterface
{
    public function toString(StatusInterface $object);

    public function integerToString($status);
}