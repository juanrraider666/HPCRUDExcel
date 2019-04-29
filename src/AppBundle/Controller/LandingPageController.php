<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\ResponseHeaderBag;

class LandingPageController extends BaseController
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction()
    {
        return $this->render('Landing/index.html.twig');
    }

    /**
     * @Route("/list/winners", name="list_winners")
     */
    public function showPdfAction()
    {
        $nameFile= 'winners.pdf';
        $filePDF = $this->container->getParameter('kernel.root_dir') . '/../web/uploads/'.$nameFile;
        $response = new BinaryFileResponse($filePDF);

        return $response;
    }


}
