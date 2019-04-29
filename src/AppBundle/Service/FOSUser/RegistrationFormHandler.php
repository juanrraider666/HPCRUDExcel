<?php
/**
 * Created by PhpStorm.
 * User: WGONZALEZ
 * Date: 31/08/2017
 * Time: 11:10 AM
 */

namespace AppBundle\Service\FOSUser;

use AppBundle\Entity\DealCompany;
use AppBundle\Entity\User;
use FOS\UserBundle\Form\Handler\RegistrationFormHandler as BaseHandler;
use FOS\UserBundle\Mailer\MailerInterface;
use FOS\UserBundle\Model\UserManagerInterface;
use FOS\UserBundle\Util\TokenGeneratorInterface;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\HttpFoundation\Request;

class RegistrationFormHandler extends BaseHandler
{
    /**
     * @var CompanyManagerInterface
     */
    private $companyManager;

    public function __construct(FormInterface $form, Request $request, UserManagerInterface $userManager, MailerInterface $mailer, TokenGeneratorInterface $tokenGenerator, CompanyManagerInterface $companyManager)
    {
        parent::__construct($form, $request, $userManager, $mailer, $tokenGenerator);
        $this->companyManager = $companyManager;
    }

    /**
     * @param boolean $confirmation
     * @return bool
     */
    public function process($confirmation = false)
    {
        $user = $this->createUser();
        $this->form->setData($user);

        if ('POST' === $this->request->getMethod()) {
            $this->form->bind($this->request);
            if ($this->form->isValid()) {
                if($this->form->get('newCompany')->getData() === true){
                    $user = $this->processNewDealCompany($this->form->get('newDealCompany')->getData(),$user);
                }
                $this->onSuccess($user, $confirmation);
                return true;
            }
        }

        return false;
    }

    public function processNewDealCompany(DealCompany $dealCompany, User $user){
        $dealCompany->setState($dealCompany->getCity()->getState());
        $dealCompany->setCountry($dealCompany->getState()->getCountry());
        $dealCompany = $this->companyManager->createDealCompany($dealCompany);
        return $user->setDealCompany($dealCompany);
    }
}