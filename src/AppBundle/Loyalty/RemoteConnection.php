<?php

namespace AppBundle\Loyalty;


use Optime\Bundle\SimpleSsoClientBundle\External\RemoteConnectionInterface;
use Symfony\Component\HttpFoundation\RequestStack;

class RemoteConnection implements RemoteConnectionInterface
{
    /**
     * @var LoyaltyIdentifierInterface
     */
    private $loyaltyIdentifier;
    /**
     * @var RequestStack
     */
    private $requestStack;

    /**
     * RemoteConnection constructor.
     * @param LoyaltyIdentifierInterface $loyaltyIdentifier
     * @param RequestStack $requestStack
     */
    public function __construct(LoyaltyIdentifierInterface $loyaltyIdentifier, RequestStack $requestStack)
    {
        $this->loyaltyIdentifier = $loyaltyIdentifier;
        $this->requestStack = $requestStack;
    }

    /**
     * @return string
     */
    public function getUsername()
    {
        return $this->loyaltyIdentifier->getActiveLoyalty()->getSsoUsername();
    }

    /**
     * @return string
     */
    public function getPrivateKey()
    {
        return $this->loyaltyIdentifier->getActiveLoyalty()->getSsoPrivateKey();
    }

    /**
     * @return string
     */
    public function getLoginUrl()
    {
        return $this->prepareUrlHost($this->loyaltyIdentifier->getActiveLoyalty()->getSsoBaseUrl().'login');
    }

    /**
     * @return string
     */
    public function getVerificationUrl()
    {
        return $this->loyaltyIdentifier->getActiveLoyalty()->getSsoBaseUrl().'verify';
    }

    private function prepareUrlHost($url)
    {
        $request = $this->requestStack->getCurrentRequest();

        if (!$request->headers->has('referer')) {
            return $url;
        }

        $refererHost = parse_url($request->headers->get('referer'), PHP_URL_HOST);
        $loyaltyHost = parse_url($url, PHP_URL_HOST);

        if ($request->getHost() == $refererHost) {
            return $url;
        }

        return preg_replace('/('.$loyaltyHost.')/', $refererHost, $url, 1);
    }
}