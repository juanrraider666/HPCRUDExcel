<?php
/**
 * Created by PhpStorm.
 * User: WGONZALEZ
 * Date: 28/08/2017
 * Time: 4:35 PM
 */

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/state")
 */
class StateController extends BaseController
{
    /**
     * Gets the companies for a given DealCompanyType
     *
     * @Route("/ajax-result/{id}", name="state_get_by_country", options={"expose"=true})
     * @param Request $request
     * @param $id
     * @return JsonResponse
     */
    public function ajaxResultAction(Request $request, $id)
    {
        $states = $this->getDoctrine()->getRepository('AppBundle:State')->findAllByCountryAsArray($id);
        return new JsonResponse($states);
    }
}