<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class ReportController extends BaseController
{
    /**
     * @Route("/report/registration", name="report_registration")
     */
    public function reportAction()
    {
        $user = $this->getParameter('app.report.user');
        $password = $this->getParameter('app.report.password');
        $url ="https://bi.hpbluecarpetlar.net/pentaho/api/repos/%3Ahome%3Areport%3Aregistration-report.prpt/viewer?userid=$user&password=$password";
        return new JsonResponse($url);
    }

    /**
     * @Route("/reports/", name="report_registration_index")
     */
    public function index ()
    {
    	return $this->render('report/index.html.twig');
    }
}
