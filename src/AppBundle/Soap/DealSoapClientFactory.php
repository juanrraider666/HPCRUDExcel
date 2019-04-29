<?php

namespace AppBundle\Soap;


use AppBundle\Entity\Deal;
use AppBundle\Loyalty\LoyaltyIdentifierInterface;
use AppBundle\Loyalty\LoyaltySoapClient;
use AppBundle\Util\Encrypter;
use AppBundle\Util\LoggerTrait;

/**
 * Class DealSoapClientFactory
 * @package AppBundle\Soap
 *
 * Clase para instanciar un objeto de la clase LoyaltySoapClient con los argumentos
 * necesarios según el loyalty con el que se necesita comunicar.
 *
 */
class DealSoapClientFactory
{
    use LoggerTrait;

    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;

    /**
     * @var Encrypter
     */
    private $encrypter;

    /**
     * @var bool
     */
    private $debug;

    /**
     * @param LoyaltyIdentifierInterface $loyaltyIdentifier
     * @param Encrypter $encrypter
     * @param $debug
     */
    public function __construct(LoyaltyIdentifierInterface $loyaltyIdentifier, Encrypter $encrypter, $debug)
    {
        $this->loyaltyIdentifier = $loyaltyIdentifier;
        $this->encrypter = $encrypter;
        $this->debug = $debug;
    }

    /**
     * @param Deal|null $deal
     * @return LoyaltySoapClient|null
     */
    public function createSoapClient(Deal $deal = null)
    {
        $loyalty = null != $deal ? $deal->getSubmitter()->getLoyalty() :
            $this->loyaltyIdentifier->getActiveLoyalty();

        try {
            $soapClient = new \SoapClient($loyalty->getWsdl(), [
                'cache_wsdl' => $this->debug ? WSDL_CACHE_NONE : WSDL_CACHE_BOTH,
                'trace' => $this->debug,
            ]);

            $loyaltySoapClient = new LoyaltySoapClient(
                $soapClient,
                $loyalty->getApiKey(),
                $loyalty->getNamespace(),
                $this->encrypter,
                $loyalty->getEncrypterKey()
            );

            return $loyaltySoapClient;

        } catch (\SoapFault $soapFault) {
            $this->addLog('error', 'createSoapClient - '.$soapFault->getMessage());

            throw $soapFault;
        }
    }
}