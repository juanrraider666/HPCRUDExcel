<?php

namespace AppBundle\Soap;

use AppBundle\Loyalty\SoapDeserializationException;
use AppBundle\Util\LoggerTrait;
use Symfony\Component\Stopwatch\Stopwatch;

/**
 * Clase base de los distintos Clientes que se comunican con otros programas
 *
 * (Prize Central, Prize Central Tracking, ...)
 *
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
abstract class DealSoapClient
{
    use LoggerTrait;

    /**
     * @var \SoapClient
     */
    protected $soapClient;
    /**
     * @var Stopwatch
     */
    private $stopwatch;

    /**
     * LoyaltySoapClient constructor.
     *
     * @param \SoapClient $soapClient
     */
    public function __construct(\SoapClient $soapClient)
    {
        $this->soapClient = $soapClient;
    }


    /**
     * @param Stopwatch $stopwatch
     */
    public function setStopwatch(Stopwatch $stopwatch = null)
    {
        $this->stopwatch = $stopwatch;
    }

    /**
     * Hace el llamado al servidor soap.
     *
     * @param       $function_name
     * @param array $arguments
     * @param array $options
     * @param null  $input_headers
     * @param array $output_headers
     *
     * @return mixed|null
     *
     * @throws DealSoapException
     */
    protected function call($function_name, array $arguments, array $options = null, $input_headers = null, array &$output_headers = null)
    {
        $stopwatchName = sprintf('%s::%s', __CLASS__, $function_name);
        if ($this->stopwatch) {
            $this->stopwatch->start($stopwatchName, 'loyalty');
        }

        $this->addLog('debug', '[{connection_name}] Llamando a {function_name}', array(
            'connection_name' => $this->getConnectionName(),
            'function_name' => $function_name,
            'parameters' => $this->normalizeLogArguments($arguments),
        ));

        try {
            $data = $this->soapClient->__soapCall(
                $function_name,
                $arguments,
                $options,
                $input_headers,
                $output_headers
            );
        } catch (\SoapFault $ex) {
            throw $this->createSoapException($ex, $this->soapClient->__getLastResponse(), $function_name);
        }

        if ($this->stopwatch and $this->stopwatch->isStarted($stopwatchName)) {
            $this->stopwatch->stop($stopwatchName);
        }

        return $data;
    }

    protected function createSoapException(\SoapFault $ex, $lastResponse, $functionName)
    {
        $this->addLog('error', '[{connection_name}] Ha ocurrido un error al llamar a {function_name}', array(
            'connection_name' => $this->getConnectionName(),
            'function_name' => $functionName,
            'error_response' => $this->soapClient->__getLastResponse(),
            'soap_request_headers' => $this->soapClient->__getLastRequestHeaders(),
            'soap_request' => $this->soapClient->__getLastRequest(),
            'soap_response_headers' => $this->soapClient->__getLastResponseHeaders(),
            'exception_message' => $ex->getMessage(),
        ));

        return new DealSoapException($this->getConnectionName(), $lastResponse, $ex);
    }

    /**
     * Prepara los parametros que se envian en los llamados Soap para que sean leibles en los Logs de la app.
     *
     * @param $args
     *
     * @return array
     */
    private function normalizeLogArguments($args)
    {
        if (isset($args['extra']) and is_string($args['extra'])) {
            $args['extra'] = unserialize($args['extra']);
        }

        return $args;
    }

    /**
     * Devuelve el nombre de la Aplicación a la que se está conectando.
     *
     * Util para información de depuración de aplicaciones (Log, Profiler, etc.).
     *
     * @return string
     */
    abstract protected function getConnectionName();

    /**
     * @param $data
     * @param bool|false $invalidValue
     * @return mixed
     * @throws SoapDeserializationException
     */
    protected function safeUnserialize($data, $invalidValue = false)
    {
        $unserializedData = @unserialize($data);

        if ($invalidValue === $unserializedData) {
            $this->addLog('error', 'No se pudo leer la respuesta del servicio web', [
                'unserialized' => $unserializedData,
            ]);

            throw new SoapDeserializationException(
                'No se pudo leer la respuesta del servicio web, el método serialize no ha devuelto datos válidos'
            );
        }

        return $unserializedData;
    }
}