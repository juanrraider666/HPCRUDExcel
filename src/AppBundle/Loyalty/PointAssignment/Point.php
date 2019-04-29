<?php

namespace AppBundle\Loyalty\PointAssignment;


class Point implements PointInterface
{
    const POINT_VALUE_TYPE_NAME_APPROVED = 'deal_registration.approved';

    const POINT_VALUE_TYPE_NAME_CONFIRMED = 'deal_registration.won';

    const DESCRIPTION_APPROVED = 'Deal Approved';

    const DESCRIPTION_CONFIRMED = 'Deal Confirmed';

    /**
     * @var string
     */
    private $pointValueTypeName;

    /**
     * @var string
     */
    private $description;

    /**
     * Point constructor.
     * @param $pointValueTypeName
     */
    public function __construct($pointValueTypeName)
    {
        $this->pointValueTypeName = $pointValueTypeName;

        switch($pointValueTypeName){
            case self::POINT_VALUE_TYPE_NAME_APPROVED:
                $this->description = self::DESCRIPTION_APPROVED;
                break;
            case self::POINT_VALUE_TYPE_NAME_CONFIRMED:
                $this->description = self::DESCRIPTION_CONFIRMED;
                break;
        }
    }

    /**
     * @return string
     */
    public function getPointValueTypeName()
    {
        return $this->pointValueTypeName;
    }

    /**
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }
}