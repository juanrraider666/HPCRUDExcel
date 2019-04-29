<?php

namespace AppBundle\Loyalty\PointAssignment;

use AppBundle\Entity\DealSubmitter;
use AppBundle\Loyalty\LoyaltySoapClient;
use AppBundle\Soap\DealSoapException;
use AppBundle\Util\LoggerTrait;


class LoyaltyPointAssigner
{
    use LoggerTrait;

    /**
     * @var LoyaltySoapClient
     */
    private $loyaltySoapClient;

    /**
     * LoyaltyPointAssigner constructor.
     * @param LoyaltySoapClient $loyaltySoapClient
     */
    public function __construct(LoyaltySoapClient $loyaltySoapClient = null)
    {
        $this->loyaltySoapClient = $loyaltySoapClient;
    }

    public function assignPoints(DealSubmitter $dealSubmitter, PointInterface $point, $dealUnits)
    {
        if ($this->loyaltySoapClient == null) {
            return;
        }

        try {
            $result = $this->loyaltySoapClient->createBehaviorPoint(
                $dealSubmitter->getCompanyId(),
                $dealSubmitter->getUserId(),
                $dealSubmitter->getProfileId(),
                0,
                $point->getDescription(),
                $point->getPointValueTypeName(),
                $dealUnits
            );

            return $result;

        } catch (DealSoapException $e) {
            $this->addLog('error', 'createPointBehavior - '.$e->getMessage());
        } catch (\Exception $e) {
            $this->addLog('error', 'createPointBehavior - '.$e->getMessage());
        }

        return null;
    }
}