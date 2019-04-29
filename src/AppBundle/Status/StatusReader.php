<?php

namespace AppBundle\Status;

use AppBundle\Status\Reader\StatusReaderInterface;
use AppBundle\Status\StatusInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class StatusReader
{
    /**
     * @var StatusReaderInterface[]
     */
    private $readers = array();

    public function addReader(StatusReaderInterface $reader, $provider)
    {
        $this->readers[$provider] = $reader;
    }

    public function toString(StatusInterface $object)
    {
        return $this->resolveReader($object->getStatusReference())->toString($object);
    }

    public function integerToString($status, $provider)
    {
        return $this->resolveReader($provider)->integerToString($status);
    }

    public function resolveReader($provider)
    {
        if (isset($this->readers[$provider])) {
            return $this->readers[$provider];
        }

        throw new \InvalidArgumentException(sprintf(
            'No se reconoce el reader de status: "%s", los readers conocidos son: %s',
            $provider,
            array_keys($this->readers)
        ));
    }
}