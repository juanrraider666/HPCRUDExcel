<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class UserController extends BaseController
{
    /**
     * @Route("generatePassword")
     */
    public function generatePasswordAction()
    {
        
        $em = $this->getDoctrine()->getManager();
        $userManager = $this->container->get('fos_user.user_manager');
        $users = $this->get('app.user_repository')->findByLastLogin(null);
 
        dump($users);die();

        foreach($users as $user)
        {
            $id = $user->getId();
            $email = $user->getEmail();
            $emailUsername = explode("@", $email);
            $password = $emailUsername['0'].'$'.$id;
            
            dump($password);

            $user->setPlainPassword($password);
            dump($user);
            $userManager->updateUser($user, true);
        }  
        return $this->render('Landing/index.html.twig');
    }

    /**
     * @Route("generateFolder")
     */
    public function generateFolderByInvoice(){

        //Consultar todos los usuarios
        $users = $this->get('app.user_repository')->findBy(array('username' => 'senenbaez@conexionpc.com.mx'));
        foreach ($users as $user){
            if(in_array('ROLE_USER',$user->getRoles())){
                $role = 'ROLE_USER';

                $deals = $this->get('app.repository.deal')->getTotalsInvoiceByUser(array(),$user, false, $role);
                foreach($deals as $deal){
                    $nameUser = $this->formatearNombre($deal['userName']);
                    $folderUser = $this->container->getparameter('kernel.root_dir').'/../web/uploads/users/'.$nameUser;
                    //Si no existe la carpeta la creamos
                    if (!file_exists($folderUser)) {
                        mkdir($folderUser);
                    }
                    //Mover las facturas que se han cargado a la carpeta del usuario
                    if(!empty($deal['factura'])){
                        $dirReal = $this->container->getparameter('kernel.root_dir').'/../web/uploads/'.$deal['factura'];
                        $dirNew = $this->container->getparameter('kernel.root_dir').'/../web/uploads/users/'.$nameUser.'/'.$deal['factura'];
                        copy($dirReal, $dirNew);
                    }
                }
                dump('se movieron los archivos, veamos que paso');
            }else{
                dump('no hacer nada');
            }
        }
        die('entro');

        dump($deal);
        die('entro');
    }

    function formatearNombre($cadena){
        $tofind = "ÀÁÂÃÄÅàáâãäåÒÓÔÕÖØòóôõöøÈÉÊËèéêëÇçÌÍÎÏìíîïÙÚÛÜùúûüÿÑñ· ";
        $replac = "AAAAAAaaaaaaOOOOOOooooooEEEEeeeeCcIIIIiiiiUUUUuuuuyNn-_";
        $cadena = utf8_decode($cadena);
        $cadena = strtr($cadena, utf8_decode($tofind), $replac);
        $cadena = strtolower($cadena);
        return utf8_encode($cadena);

    }
}
