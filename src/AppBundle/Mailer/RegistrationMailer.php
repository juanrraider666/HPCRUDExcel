<?php
/*
* OPTIME Consulting, Inc.
*
* Description: 
*
* @author gbenitez
* @version 1.0  27/11/15
*/

namespace AppBundle\Mailer;


use AppBundle\Entity\User;
use AppBundle\Util\LoggerTrait;

class RegistrationMailer
{
    use LoggerTrait;

    /**
     * @var Mailer
     */
    private $mailer;

    private $genericPassword;

    private $deal_delete;
    private $deal_approve;
    private $deal_rejected;
    

    /**
     * RegistrationMailer constructor.
     * @param Mailer $mailer
     * @param $templateRegistrationOwnerCode
     * @param $templateRegistrationAdminCode
     * @param $templateRegistrationSalesCode
     * @param $templateAdminRegisteredCode
     * @param $templateSalesRegisteredCode
     */
    public function __construct(
        Mailer $mailer,
        $dealDelete,
        $dealApprove,
        $dealRejected
    ) {
        $this->mailer = $mailer;
        $this->deal_delete = $dealDelete;
        $this->deal_approve = $dealApprove;
        $this->deal_rejected = $dealRejected;
   
    }

    /**
     * Envia un correo al owner cuando se registra.
     *
     * @param User $owner
     */
    public function sendDealDeleteEmailMessage(User $owner)
    {
        $this->addLog('info',
            'Se envía un correo al owner para indicarle que el  registro se realizo con éxito');

        $message = \Swift_Message::newInstance()
            ->setTo($owner->getEmail(), (string)$owner);

        $this->mailer->send($message, $this->deal_delete, array(
            'firstname' => 'alexander',
            'lastname' => 'cortes',
        ));
    }

     /**
     * Envia un correo al owner cuando se registra.
     *
     * @param User $owner
     */
    public function sendDealApproveEmailMessage(User $owner)
    {
        $this->addLog('info',
            'Se envía un correo al owner para indicarle que el  registro se realizo con éxito');

        $message = \Swift_Message::newInstance()
            ->setTo($owner->getEmail(), (string)$owner);

        $this->mailer->send($message, $this->deal_approve, array(
            'firstname' => 'alexander',
            'lastname' => 'cortes',
        ));
    }
    
    /**
     * Envia un correo al owner cuando se registra.
     *
     * @param User $owner
     */
    public function sendDealRejectedEmailMessage(User $owner)
    {
        $this->addLog('info',
            'Se envía un correo al owner para indicarle que el  registro se realizo con éxito');

        $message = \Swift_Message::newInstance()
            ->setTo($owner->getEmail(), (string)$owner);

        $this->mailer->send($message, $this->deal_rejected, array(
            'firstname' => 'alexander',
            'lastname' => 'cortes',
        ));
    }

    /**
     * Envia un correo al admin cuando se registra.
     *
     * @param User $admin
     */
    public function sendRegistrationAdminEmailMessage(User $admin)
    {
        $this->addLog('info',
            'Se envía un correo al admin para indicarle que el  registro se realizo con éxito');

        $message = \Swift_Message::newInstance()
            ->setTo($admin->getEmail(), (string)$admin);

        $this->mailer->send($message, $this->templateRegistrationAdminCode, array(
            'firstname' => $admin->getPerson()->getFirstname(),
        ));
    }

    /**
     * Envia un correo al sales cuando se registra.
     *
     * @param User $sales
     */
    public function sendRegistrationSaleEmailMessage(User $sales)
    {
        $this->addLog('info',
            'Se envía un correo al vendedor para indicarle que el registro se realizo con éxito');

        $message = \Swift_Message::newInstance()
            ->setTo($sales->getEmail(), (string)$sales);

        $this->mailer->send($message, $this->templateRegistrationSalesCode, array(
            'firstname' => $sales->getPerson()->getFirstname(),
            'lastname' => $sales->getPerson()->getLastname(),
        ));
    }

    /**
     * Envía un correo al owner de la empresa, cuando su admin se registra.
     *
     * @param User $admin
     * @param $owner
     */
    public function sendRegistrationAdminRegisteredEmailMessage(User $admin, User $owner)
    {
        $this->addLog('info',
            'Se envía un correo al dueño  para indicarle que se registro su admin');

        $message = \Swift_Message::newInstance()
            ->setTo($owner->getEmail(), (string)$owner);

        $this->mailer->send($message, $this->templateAdminRegisteredCode, array(
            'firstname' => $owner->getPerson()->getFirstname(),
            'lastname' => $owner->getPerson()->getLastname()
        ));
    }

    /**
     * Envía un correo al admin de la empresa, cuando un vendedor se registra.
     *
     * @param User $sales
     * @param $admin
     */
    public function sendRegistrationSalesRegisteredEmailMessage(User $sales, User $admin)
    {
        $this->addLog('info',
            'Se envía un correo al admin para indicarle que se registro un vendedor');

        $message = \Swift_Message::newInstance()
            ->setTo($admin->getEmail(), (string)$admin);

        $this->mailer->send($message, $this->templateSalesRegisteredCode,array(
            'sales_firstname' => $sales->getPerson()->getFirstname(),
            'sales_lastname' => $sales->getPerson()->getLastname(),
            'sales_email' => $sales->getEmail(),
            'admin_firstname' => $admin->getPerson()->getFirstname(),
            'admin_lastname' => $admin->getPerson()->getLastname(),
        ));
    }

    /**
     * Envía un correo al sales, cuando es invitado (creado) por el owner o el admin.
     *
     * @param User $sales
     */
    public function sendRegistrationSalesPendingEmailMessage(User $sales)
    {
        $this->addLog('info',
            'Se envía un correo al vandedor  para indicarle que fue invitado al programa');

        $message = \Swift_Message::newInstance()
            ->setTo($sales->getEmail(), (string)$sales);

        $this->mailer->send($message, $this->templateSalesPendingCode, array(
            'firstname' => $sales->getPerson()->getFirstname(),
            'lastname' => $sales->getPerson()->getLastname(),
        ));
    }

    /**
     * Correo que se envia al vendedor, cuando su compañia aun no está registarda.
     * (Cuando no existe aun un owner aprobado).
     *
     * @param User $sales
     */
    public function sendRegistrationSalesPendingForPrincipalEmailMessage(User $sales)
    {
        $this->addLog('info',
            'Se envía un correo al vendedor para indicarle que su compañia aun no está registada');

        $message = \Swift_Message::newInstance()
            ->setTo($sales->getEmail(), (string)$sales);

        $this->mailer->send($message, $this->templateSalesPendingForPrincipalCode, array(
            'sales_rep_name' => $sales->getPerson()->getFirstname(),
        ));
    }

    /**
     * Envía un correo al admin, cuando es invitado (creado) por el owner.
     *
     * @param User $admin
     */
    public function sendRegistrationAdminPendingEmailMessage($admin)
    {
        $this->addLog('info',
            'Se envía un correo al admin  para indicarle que fue invitado el programa');

        $message = \Swift_Message::newInstance()
            ->setTo($admin->getEmail(), (string)$admin);

        $this->mailer->send($message, $this->templateAdminPendingCode, array(
            'firstname' => $admin instanceof User ? $admin->getPerson()->getFirstname() : $admin->getFirstname(),
            'lastname' => $admin instanceof User ? $admin->getPerson()->getLastname() : $admin->getLastname(),
        ));
    }
}