<?php

namespace AppBundle\Mailer;

use AppBundle\Entity\User;
use FOS\UserBundle\Mailer\MailerInterface;
use FOS\UserBundle\Model\UserInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class FOSUserMailer implements MailerInterface
{
    /**
     * @var Mailer
     */
    private $mailer;
    private $templateConfirmationCode;
    private $templateResettingCode;
    private $genericPassword;

    /**
     * FOSUserMailer constructor.
     *
     * @param Mailer $mailer
     * @param        $templateConfirmationCode
     * @param        $templateResettingCode
     * @param        $genericPassword
     */
    public function __construct(Mailer $mailer, $templateConfirmationCode, $templateResettingCode, $genericPassword)
    {
        $this->mailer = $mailer;
        $this->templateConfirmationCode = $templateConfirmationCode;
        $this->templateResettingCode = $templateResettingCode;
        $this->genericPassword = $genericPassword;
    }

    public function sendConfirmationEmailMessage(UserInterface $user)
    {
        $message = \Swift_Message::newInstance()
            ->setTo($user->getEmail(), (string) $user);

        $this->mailer->send($message, $this->templateConfirmationCode, array(
            'username' => $user->getUsername(),
            'firstname' => $user->getPerson()->getFirstname(),
            'lastname' => $user->getPerson()->getLastname(),
            'token' => $user->getConfirmationToken(),
            'temp_password' => $this->genericPassword,
        ));
    }

    /**
     * @param User $user
     */
    public function sendResettingEmailMessage(UserInterface $user)
    {
        $message = \Swift_Message::newInstance()
            ->setTo($user->getEmail(), (string) $user);

        $this->mailer->send($message, $this->templateResettingCode, array(
            'username' => $user->getUsername(),
            'firstname' => $user->getPerson()->getFirstname(),
            'lastname' => $user->getPerson()->getLastname(),
            'token' => $user->getConfirmationToken(),
        ));
    }
}