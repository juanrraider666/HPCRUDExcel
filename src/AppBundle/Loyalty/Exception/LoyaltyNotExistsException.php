<?php

namespace AppBundle\Loyalty\Exception;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class LoyaltyNotExistsException extends \Exception
{
    public static function codeNotExists($code)
    {
        return new static('_loyalty code invalid: "'. $code .'" not found !');
    }
}