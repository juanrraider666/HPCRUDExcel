<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Deal;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 *
 * @Route("/deal/{id}/support")
 */
class DealSupportController extends BaseController
{
    /**
     * @Route("/upload")
     * @Security("is_granted('upload_support', deal)")
     *
     * @param Deal $deal
     */
    public function uploadAction(Deal $deal)
    {
        dump($deal);
        return $this->render('base.html.twig', array());
    }
}
