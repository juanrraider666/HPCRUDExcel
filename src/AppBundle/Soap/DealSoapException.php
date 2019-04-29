<?php

namespace AppBundle\Soap;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealSoapException extends \Exception
{
    /**
     * @param string     $connectionName
     * @param int        $message
     * @param \Exception $prevoius
     */
    public function __construct($connectionName, $message, \Exception $prevoius)
    {
        parent::__construct('[' . $connectionName . '] ' . $message, $prevoius->getCode(), $prevoius);
    }

    public function getFaultString()
    {
        return $this->getPrevious() instanceof \SoapFault
            ? $this->getPrevious()->getMessage()
            : null;
    }

    public function getFaultCode()
    {
        return $this->getPrevious() instanceof \SoapFault
            ? $this->getPrevious()->faultcode
            : null;
    }
}