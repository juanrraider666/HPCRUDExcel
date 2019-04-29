<?php

namespace AppBundle\Security\Voter;

use AppBundle\Entity\Deal;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class UploadSupportVoter extends Voter
{

    protected function supports($attribute, $subject)
    {
        if (!$subject instanceof Deal) {
            return false;
        }

        if (!in_array($attribute, ['upload_support'])) {
            return false;
        }

        return true;
    }

    /**
     * @param string $attribute
     * @param Deal $deal
     * @param TokenInterface $token
     * @return bool
     */
    protected function voteOnAttribute($attribute, $deal, TokenInterface $token)
    {
        return Deal::WON_STATE === $deal->getStatus() and !$deal->getIsConfirmed()
        and $token->getUsername() === $deal->getSubmitter()->getUsername();
    }
}