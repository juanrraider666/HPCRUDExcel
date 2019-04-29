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
 * @Route("/deal-company")
 */
class DealCompanyController extends BaseController
{
    /**
     * Gets the companies for a given DealCompanyType
     *
     * @Route("/ajax-result/{id}", name="deal_company_get_by_type", options={"expose"=true})
     * @param Request $request
     * @param $id
     * @return JsonResponse
     */
    public function ajaxResultAction(Request $request, $id)
    {
        $dealCompanies = $this->getDoctrine()->getRepository('AppBundle:DealCompany')->findAllByCompanyType($id);
        return new JsonResponse($dealCompanies);
    }
}