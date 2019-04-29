<?php
/*
* OPTIME Consulting, Inc.
*
* Description: 
*
* @author gbenitez
* @version 1.0  26/11/15
*/

namespace AppBundle\Mailer;

use AppBundle\Entity\Redeemed;
use AppBundle\Entity\User;
use AppBundle\Mailer\Mailer;
use AppBundle\Util\LoggerTrait;

class TrackingMailer
{
    use LoggerTrait;

    /**
     * @var Mailer
     */
    private $mailer;

    private $templateRequestCode;
    private $templateApprovedCode;
    private $templateRejectCode;
    private $templateShippedCode;
    private $templateDeliveredCode;


    /**
     * TrackingMailer constructor.
     * @param \AppBundle\Mailer\Mailer $mailer
     * @param $templateRequestCode
     * @param $templateApprovedCode
     * @param $templateRejectCode
     * @param $templateShippedCode
     * @param $templateDeliveredCode
     */
    public function __construct(Mailer $mailer, $templateRequestCode, $templateApprovedCode, $templateRejectCode, $templateShippedCode, $templateDeliveredCode)
    {
        $this->mailer = $mailer;
        $this->templateRequestCode = $templateRequestCode;
        $this->templateApprovedCode = $templateApprovedCode;
        $this->templateRejectCode = $templateRejectCode;
        $this->templateShippedCode = $templateShippedCode;
        $this->templateDeliveredCode = $templateDeliveredCode;
    }

    /**
     * @param $user
     * @param Redeemed $redeemed
     * @param $prizeData
     */
    public function sendRequestEmailMessage(User $user, Redeemed $redeemed, $prizeData )
    {
        $this->addLog('info',
            'Se envía un correo al usuario para indicarle su compra');

        $message = \Swift_Message::newInstance()
            ->setTo($user->getEmail(), (string) $user);
        $this->mailer->send($message, $this->templateRequestCode, array(
            'user_first_name' => $user->getPerson()->getFirstname(),
            'order_control' => $redeemed->getControlNumber(),
            'prizes_name' => $prizeData['title'],
            'points_total' => $redeemed->getTotalPoints(),
        ));
    }

    /**
     * @param Redeemed $redeemed
     * @param $prizeData
     */
    public function sendApprovedEmailMessage(Redeemed $redeemed, $prizeData)
    {
        $company = $redeemed->getCompany();
        $country = $company->getCountry();
        $address = $redeemed->getAddress();
        $user = $redeemed->getUser();
        $this->addLog('info',
            'Se envía un correo al usuario para indicarle su compra ha sido aprobada ');

        $message = \Swift_Message::newInstance()
            ->setTo($user->getEmail(), (string) $user);
        $this->mailer->send($message, $this->templateApprovedCode, array(
            'user_first_name' => $user->getPerson()->getFirstname(),
            'order_control' => $redeemed->getControlNumber(),
            'prizes_name' => $prizeData['title'],
            'fecha' => (string)$redeemed->getCreatedAt()->format('d/m/Y'),
            'user_title' =>$user->getPerson()->getLastname(),
            'user_email' =>$user->getEmail(),
            'user_company' => $company,
            'user_calle' => $address,
            'user_ciudad' => (string) $address->getCity(),
            'user_state' => (string) $address->getState(),
            'user_zip' => (string) $address->getPostalCode(),
            'user_country' => ($country ? (string) $country : null),
            'user_phone' => (string) $redeemed->getPhone(),
        ));
    }
    /**
     * @param Redeemed $redeemed
     * @param $prizeData
     */
    public function sendRejectedEmailMessage(Redeemed $redeemed, $prizeData)
    {
        $company = $redeemed->getCompany();
        $country = $company->getCountry();
        $user = $redeemed->getUser();
        $this->addLog('info',
            'Se envía un correo al usuario para indicarle su compra ha sido rechazado ');

        $message = \Swift_Message::newInstance()
            ->setTo($user->getEmail(), (string) $user);
        $this->mailer->send($message, $this->templateShippedCode, array(
            'user_first_name' => $user->getPerson()->getFirstname(),
            'order_control' => $redeemed->getControlNumber(),
            'points_total' => $redeemed->getTotalPoints(),
            'prizes_name' => $prizeData['title'],
            'user_title' =>$user->getPerson()->getLastname(),
            'user_email' =>$user->getEmail(),
            'user_company' => $company,
            'user_country' => ($country ? (string) $country : null),
            'user_phone' => (string) $redeemed->getPhone(),
        ));
    }
    /**
     * @param Redeemed $redeemed
     * @param $prizeData
     */
    public function sendShippedEmailMessage(Redeemed $redeemed, $prizeData)
    {
        $company = $redeemed->getCompany();
        $country = $company->getCountry();
        $user = $redeemed->getUser();
        $address = $redeemed->getAddress();
        $this->addLog('info',
            'Se envía un correo al usuario para indicarle su compra ha sido enviada ');

        $message = \Swift_Message::newInstance()
            ->setTo($user->getEmail(), (string) $user);
        $this->mailer->send($message, $this->templateRejectCode, array(
            'user_first_name' => $user->getPerson()->getFirstname(),
            'order_control' => $redeemed->getControlNumber(),
            'prizes_name' => $prizeData['title'],
            'fecha_de_canje' => (string)$redeemed->getCreatedAt()->format('d/m/Y'),
            'courier_site' => '',
            'airbill_number' => '',
            'points_total' => $redeemed->getTotalPoints(),
            'user_title' =>$user->getPerson()->getLastname(),
            'user_email' =>$user->getEmail(),
            'user_company' => $company,
            'user_calle' => $address,
            'user_ciudad' => (string) $address->getCity(),
            'user_state' => (string) $address->getState(),
            'user_zip' => (string) $address->getPostalCode(),
            'user_country' => ($country ? (string) $country : null),
            'user_phone' => (string) $redeemed->getPhone(),
        ));
    }
    /**
     * @param Redeemed $redeemed
     */
    public function sendDeliveredEmailMessage(Redeemed $redeemed)
    {
        $user = $redeemed->getUser();
        $this->addLog('info',
            'Se envía un correo al usuario para indicarle su compra ha sido enviada ');

        $message = \Swift_Message::newInstance()
            ->setTo($user->getEmail(), (string) $user);
        $this->mailer->send($message, $this->templateDeliveredCode, array(
            'user_first_name' => $user->getPerson()->getFirstname(),
            'order_control' => $redeemed->getControlNumber(),
        ));
    }

}