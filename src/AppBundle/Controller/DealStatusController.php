<?php

namespace AppBundle\Controller;

use AppBundle\Form\Type\ChangeDealToWonType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DealStatusController extends BaseController
{
    /**
     * @Route("/change-status/{id}/{status}",
     *     name="change_deal_status",
     *     requirements={"status" = "(REGISTERED|APPROVED|REJECTED|NOT_WON|LOSS|CANCELED|EXPIRED|LOST)_STATE"}
     *  )
     */
    public function genericChangeAction(Request $request, $id, $status)
    {
        $em = $this->getDoctrine()->getManager();

        $deal = $this->get('app.repository.deal')->getDealById($id);

        if ($request->isMethod('POST')) {

            $deal->setStatus($status);

            $em->persist($deal);
            $em->flush();

            $this->get('app.deal.event_manager')->dispatchEventByDealStatus($deal);

            $this->addFlash('notice', $this->trans('flash.approved'));

            return $this->redirectToRoute('deal_list', array(
                '_loyalty' => $this->getLoyalty()->getCode(),
            ));
        }

        return $this->render('deal/change_status.html.twig', array(
            'deal' => $deal,
            'status' => $status,
        ));
    }

    /**
     * @Route("/change-status/{id}/won", name="deal_change_status_to_won",
     *     condition="request.isXmlHttpRequest()"
     * )
     * @Method("GET")
     */
    public function showChangeToWonFormAction($id)
    {
        if (!$deal = $this->get('app.repository.deal')->getDealById($id)) {
            throw $this->createNotFoundException('No existe el deal con id '.$id);
        }

        $form = $this->createForm(ChangeDealToWonType::class, null, [
            'action' => $this->generateUrl('deal_change_status_to_won_post', ['id' => $id]),
        ]);

        return $this->render('deal/status_change/won.html.twig', [
            'deal' => $deal,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/change-status/{id}/won", name="deal_change_status_to_won_post",
     *     condition="request.isXmlHttpRequest()"
     * )
     * @Method("POST")
     */
    public function changeToWonAction(Request $request, $id)
    {
        if (!$deal = $this->get('app.repository.deal')->getDealById($id)) {
            throw $this->createNotFoundException('No existe el deal con id '.$id);
        }

        $form = $this->createForm(ChangeDealToWonType::class, null, [
            'action' => $this->generateUrl('deal_change_status_to_won_post', ['id' => $id]),
        ]);
        $form->handleRequest($request);

        $response = $this->render('deal/status_change/won.html.twig', [
            'deal' => $deal,
            'form' => $form->createView(),
        ]);

        if (!$this->get('app.form.handler.change_status_to_won')->handle($form, $deal)) {
            $response->setStatusCode(Response::HTTP_BAD_REQUEST);
        }

        return $response;
    }
}
