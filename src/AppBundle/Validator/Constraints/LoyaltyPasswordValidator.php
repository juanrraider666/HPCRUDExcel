<?php

namespace AppBundle\Validator\Constraints;

use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;


/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class LoyaltyPasswordValidator extends ConstraintValidator
{

    public function validate($value, Constraint $constraint)
    {
        if (null === $value || '' === $value) {
            return;
        }

        if (!preg_match('/[A-Z]+/', $value)) {
            return $this->buildError($constraint, $value);
        }

        if (!preg_match('/[a-z]+/', $value)) {
            return $this->buildError($constraint, $value);
        }

        if (!preg_match('/[0-9]+/', $value)) {
            return $this->buildError($constraint, $value);
        }

        if (!preg_match('/\W+/', $value)) {
            return $this->buildError($constraint, $value);
        }

    }

    protected function buildError(Constraint $constraint, $value)
    {
        $this->context->buildViolation($constraint->message)
            ->setInvalidValue($value)
            ->addViolation();
    }
}