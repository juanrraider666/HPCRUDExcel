<?php
/*
* OPTIME Consulting, Inc.
*
* Description:
*
* @author jaguilar
* @version 1.0  16/05/17
*/

namespace AppBundle\Mailer;

use AppBundle\Entity\User;
use AppBundle\Util\LoggerTrait;

class SaleMailer
{
    use LoggerTrait;

    /**
     * @var Mailer
     */
    private $mailer;

    private $templateSaleCompany;

    /**
     * RegistrationMailer constructor.
     * @param Mailer $mailer
     * @param $templateSaleCompany
     */
    public function __construct(
        Mailer $mailer,
        $templateSaleCompany
    ) {
        $this->mailer = $mailer;
        $this->templateSaleCompany = $templateSaleCompany;
    }

    /**
     * Envia un correo al admin de la company con la informacion de ventas generada.
     *
     * @param User $admin
     */
    public function sendAdminCompanyEmailMessage(User $admin)
    {
        $this->addLog('info',
            'Se envía un correo al admin de la company, para que realice la distribucion');

        $message = \Swift_Message::newInstance()
            //->setTo($admin->getEmail(), (string)$admin);
            ->setTo($admin->getEmail());

        $this->mailer->send($message, $this->templateSaleCompany, array(
            'first_name' => $admin->getPerson()->getFirstname(),
            'last_name' => $admin->getPerson()->getLastname(),
        ));
    }

}