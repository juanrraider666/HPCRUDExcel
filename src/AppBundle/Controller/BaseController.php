<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Loyalty;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Doctrine\ORM\Query;
use Symfony\Component\EventDispatcher\Event;

class BaseController extends Controller
{
    /**
     * Atajo para paginar una consulta de doctrine.
     *
     * @param Query|array $query
     * @param int $page
     * @param int $perPage
     *
     * @return \Knp\Component\Pager\Pagination\PaginationInterface
     */
    public function paginate($query, $page = null, $perPage = null)
    {
        $request = $this->get('request_stack')->getCurrentRequest();

        $page = $page ?: $request->get('page', 1);
        $perPage = $perPage ?: $request->get('perPage', 10);

        return $this->get('knp_paginator')->paginate($query, $page, $perPage);
    }

    /**
     * Atajo para traducir una etiqueta
     *
     * @param       $id
     * @param array $parameters
     * @param null $domain
     * @param null $locale
     *
     * @return string
     */
    public function trans($id, array $parameters = array(), $domain = null, $locale = null)
    {
        return $this->get('translator')->trans($id, $parameters, $domain, $locale);
    }

    /**
     * Atajo para despachar un evento desde un controlador
     *
     * @param string $name Nombre del evento a despachar
     * @param Event|null $event
     *
     * @return Event
     */
    public function dispatchEvent($name, Event $event = null)
    {
        return $this->get('event_dispatcher')->dispatch($name, $event);
    }

    /**
     * Atajo para obtener el loyalty de donde viene
     * el usuario
     *
     * @return Loyalty
     */
    public function getLoyalty()
    {
        return $this->get('app.loyalty.loyalty_identifier')->getActiveLoyalty();
    }

    /**
     * Atajo para obtener el rol del usuario
     *
     * @return null|string
     */
    public function getUserRole()
    {
        if($this->isGranted('ROLE_OPTIME_MASTER') or $this->isGranted('ROLE_SUPER_ADMIN')){
            return 'ROLE_OPTIME_MASTER';
        }

        if($this->isGranted('ROLE_APPROVER')){
            return 'ROLE_APPROVER';
        }

        if($this->isGranted('ROLE_SUBMITTER')){
            return  'ROLE_SUBMITTER';
        }

        return 'ROLE_USER';
    }
}
