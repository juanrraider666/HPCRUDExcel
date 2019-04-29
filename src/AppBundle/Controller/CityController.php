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
 * @Route("/city")
 */
class CityController extends BaseController
{
    /**
     * Gets the companies for a given DealCompanyType
     *
     * @Route("/ajax-result/{id}", name="city_get_by_state", options={"expose"=true})
     * @param Request $request
     * @param $id
     * @return JsonResponse
     */
    public function ajaxResultAction(Request $request, $id)
    {
        $cities = $this->getDoctrine()->getRepository('AppBundle:City')->findAllByStateAsArray($id);
        return new JsonResponse($cities);
    }
}