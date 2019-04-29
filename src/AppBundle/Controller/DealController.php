<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Deal;
use AppBundle\Entity\User;
use AppBundle\Entity\DealStatusLog;
use AppBundle\Entity\DealSubmitter;
use AppBundle\Exception\EntityNotFoundException;
use AppBundle\Form\Type\DealType;
use AppBundle\Form\Type\MyDealsFilterType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\ResponseHeaderBag;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use AppBundle\Email;
;

/**
 * DealController
 * @package AppBundle\Controller
 */
class DealController extends BaseController
{
    use TwigTemplateResolverRenderTrait;

    /**
     * @Route("/create", name="create_deal")
     *
     * @param Request $request
     * @return RedirectResponse|Response
     */
    public function createAction(Request $request)
    {
       
        $user = new User();
        
        $submitter = new DealSubmitter($user);
        $submitter->setLanguage($request->getLocale());

        $deal = new Deal();
        $deal->setUser($this->getUser()); 
        $deal->setStatus(Deal::REGISTERED_STATE);
        $deal = $this->get('app.attributes_manager')->getDealWithAttributes($deal);

        $form = $this->createForm(new DealType(), $deal);
        $form->handleRequest($request);
         
        if ($form->isSubmitted() && $form->isValid()) {
            
            $fileCertificado = $deal->getInvoice()->getCertificado();
            $fileFactura = $deal->getInvoice()->getFactura();



            $photoDir = $this->container->getParameter('kernel.root_dir') . '/../web/uploads';

            if (!file_exists($photoDir)) {
                mkdir($photoDir, 0777, true);
            }

            if ($fileCertificado) {
                 /*Se ajusta el nombre del archivo para guardarlo en la BD y moverlo a la carpetas de fotos*/
                $certificado = md5(uniqid()).'.'.$fileCertificado->guessExtension();
                $extesion = $fileCertificado->guessExtension();
                $fileCertificado->move($photoDir, $certificado);
               $deal->getInvoice()->setCertificado($certificado);
            } else {
                $deal->getInvoice()->setCertificado(null);
            }

            
            if ($fileFactura) {
                 /*Se ajusta el nombre del archivo para guardarlo en la BD y moverlo a la carpetas de fotos*/
                $factura = md5(uniqid()).'.'.$fileFactura->guessExtension();
                $extesion = $fileFactura->guessExtension();
                $fileFactura->move($photoDir, $factura);
                $deal->getInvoice()->setFactura($factura);
            } else {
                $deal->getInvoice()->setFactura(null);
            }
            

            $em = $this->getDoctrine()->getManager();
            $em->persist($deal);
            $em->flush();


            return $this->redirectToRoute('deal_saved', array(                
                'id' => $deal->getId(),
            ));
        }
        
        
        

        return $this->render('deal/new.html.twig', array(
            'form' => $form->createView(),
            'deal' => $deal,
        ));

    }

    /**
     * @Route("/saved/{id}", name="deal_saved")
     */
    public function savedAction(Request $request, Deal $deal)
    {
        
            
        

        $correlative = $this->get('app.deal.event_manager')->generateControlNum($deal);
        $status = $this->get('app.deal.event_manager')->definedStatusDeal($deal);
        return $this->render('deal/agradecimiento.html.twig', array(
            'deal' => $deal,
            'correlative' => $correlative,
        ));
    }

    
    /**
     * @Route("/edit/{id}", name="edit_deal")
     */
    public function editAction(Request $request, Deal $deal)
    {
        $form = $this->createForm(new DealType(), $deal);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $em = $this->getDoctrine()->getManager();
            $em->flush();

            $this->addFlash(
                'notice',
                'La Oportunidad se ha actualizado correctamente!'
            );

            return $this->redirectToRoute('deal_list', array(
                '_loyalty' => $this->getLoyalty()->getCode(),
            ));
        }

        return $this->render('deal/edit.html.twig', array(
            'form' => $form->createView(),
            'deal' => $deal,
        ));
    }

    /**
     * @Route("/list", name="deal_list",defaults={"page" = 1})
     */
    public function listAction(Request $request)
    {

        $filters = array();
        $role = $this->getUserRole();
        $page=1;
        $formFilter = $this->createForm(MyDealsFilterType::class, array());
        $formFilter->handleRequest($request);
        $filters = $formFilter->getData();
        $invoices = $this->getDoctrine()->getRepository('AppBundle:Deal')->getTotalsInvoiceByUser($filters,$this->getUser()->getId(),false,$role);
        $subtotal = $this->getDoctrine()->getRepository('AppBundle:Deal')->getTotalsInvoiceByUser($filters,$this->getUser()->getId(),true,$role);
        
//        $filters = $formFilter->getData();
//
//        $session = $request->getSession();
//        $session->set('user', $this->getUser());
//        $session->set('filters', $filters);
//
//        $summary = $this->getDoctrine()->getRepository('AppBundle:Deal')
//            ->getTotalsDealsByUser($this->getUser(), $this->getUserRole(), $filters);
//
//        $deals = $this->getDoctrine()->getRepository('AppBundle:Deal')
//            ->getDealsUserByStatus($this->getUser(), $this->getUserRole(), $filters);
//
        
        if($request->query->get('page')){
            $page = $request->query->get('page');
        }
        
        $pagination = $this->paginate($invoices,$page,4);
        

        return $this->render('deal/list.html.twig', array(
            //'summary' => $summary,
            'invoices' => $pagination,
            'subtotal' => reset($subtotal),
            'form_filter' => $formFilter->createView(),
            'totalCount' => count($invoices),
            'role'=> $role
            //'deals' => $pagination,
        ));
    }

    /**
     * @Route("/deals/download/detail", name="deals_detail_excel")
     */
    public function dealsDetailExcelAction(Request $request)
    {
        $session = $request->getSession();
        $filters = $session->has('filters') == true ? $session->get('filters') : null;
        $user = $session->get('user');

        $deals = $this->getDoctrine()->getRepository('AppBundle:Deal')
            ->getDealsUserByStatus($user, $this->getUserRole(), $filters);

        return $this->get('app.deals_detail_excel')->download($deals);
    }

    /**
     * @Route("/confirm/{id}", name="confirm_deal")
     */
    public function confirmDealAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $deal = $em->getRepository('AppBundle:Deal')->getDealById($id);

        if ($request->isMethod('POST')) {

            $deal->setIsConfirmed(true);
            $em->persist($deal);
            $em->flush();

            $this->get('app.deal.event_manager')->dispatchEventByDealStatus($deal);

            $this->addFlash('notice', $this->trans('flash.confirmed'));

            return $this->redirectToRoute('deal_list', array(
                '_loyalty' => $this->getLoyalty()->getCode(),
            ));
        }

        return $this->render('deal/confirm_deal.html.twig', array(
            'deal' => $deal,
        ));
    }
    
    /**
     * @Route("/deal/modal/{id}/{action}", name="print_modal")
    */
    
    public function printModalConfirmation(Request $request, Deal $deal,$action){
        return $this->render('deal/_modal_confirm.html.twig', array(
            'deal' => $deal,
            'action' => $action
        ));
        
    }
            
    /**
     * @Route("/deal/{id}/comments", name="deal_show_comments")
     */
    public function showComments(Deal $deal, Request $request)
    {
        try {
            $thread = $this->get('app.repository.deal_thread')->getThreadByDeal($deal);
        } catch (EntityNotFoundException $e) {
            $thread = $this->get('app.factory.deal_thread')->create(
                $deal, $request->getUri()
            );
        }

        $comments = $this->get('fos_comment.manager.comment')->findCommentTreeByThread($thread);

        return $this->render('deal/show_comments.html.twig', [
            'deal' => $deal,
            'comments' => $comments,
            'thread' => $thread,
        ]);
    }
    
    /**
     * @Route("/show/{id}", name="show_deal")
     */
    public function showAction(Request $request,Deal $id)
    {

        if (!$deal = $this->getDoctrine()->getRepository(Deal::class)->getDealById($id)) {
            throw $this->createNotFoundException('No existe el deal con id = '.$id);
        }
        
        return $this->render('deal/_modal_show.html.twig', array(
            'deal' => $deal,
        ));
    }

    
    /**
     * @Route("/deal/delete/{id}", name="deal_delete")
     */
    public function deleteAction(Request $request,Deal $deal)
    {
        $id = $this->get('app.deal.deleted')->setDealsDeleted($deal);
        $json = json_encode($id);
        $response = new Response($json, 200);
        $response->headers->set('Content-Type', 'application/json');        
       // $email = $this->get('app.registration_mailer')->sendDealDeleteEmailMessage($this->getUser());
        return $this->listAction($request);
    }
    
     /**
        * @Route("/deal/approve/{id}", name="deal_approve")
     */
    public function approveAction(Request $request,Deal $deal)
    {
        $id = $this->get('app.deal.approve')->setDealsApproved($deal);
        $json = json_encode($id);
        $response = new Response($json, 200);
        $response->headers->set('Content-Type', 'application/json');        
       // $email = $this->get('app.registration_mailer')->sendDealApproveEmailMessage($this->getUser());
        return $this->listAction($request);
    }
    
     /**
        * @Route("/deal/rejected/{id}", name="deal_rejected")
     */
    public function rejectedAction(Request $request,Deal $deal)
    {
        $id = $this->get('app.deal.rejected')->setDealsRejected($deal);
        $json = json_encode($id);
        $response = new Response($json, 200);
        $response->headers->set('Content-Type', 'application/json');        
        // $email = $this->get('app.registration_mailer')->sendDealRejectedEmailMessage($this->getUser());
        return $this->listAction($request);
    }
    
     /**
     * @Route("/deal/excel", name="deal_excel")
     */
    public function generateExcel(){
         
         $filters = array();
         $role = $this->getUserRole();
         $invoices = $this->getDoctrine()->getRepository('AppBundle:Deal')->getTotalsInvoiceByUser($filters,$this->getUser()->getId(),false,$role);
         $generateExcel = $this->get('app.deal.excel.report')->generateExcel($invoices);
         $excelService = $this->get('app.excel_export');
            $writer = $excelService->export($generateExcel['data'],$generateExcel['key'],'Invoices');
            return $excelService->createResponseFromWriter($writer, 'Invoices');

    }
}