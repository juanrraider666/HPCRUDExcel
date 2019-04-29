<?php

namespace AppBundle\Validator\Constraints;

use Symfony\Component\Validator\Constraint;


/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 *
 * @Annotation
 * @Target({"PROPERTY", "METHOD"})
 */
class LoyaltyPassword extends Constraint
{
    public $message = 'label.vpassword_pattern_instructions';

}