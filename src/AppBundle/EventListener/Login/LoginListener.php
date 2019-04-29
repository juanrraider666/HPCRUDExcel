<?php

namespace AppBundle\EventListener\Login;

use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpKernel\Event\FilterResponseEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Routing\Router;
use Symfony\Component\Security\Core\SecurityContext;
use Symfony\Component\Security\Http\Event\InteractiveLoginEvent;

/**
 * Login listener to redirect  LoginListener
 *
 * @author PAYUSO
 */
class LoginListener {

    /** @var SecurityContext */
    private $securityContext;
    private $router;
    private $dispatcher;

    /**
     * Constructor
     * @param SecurityContext $securityContext
     * @param \AppBundle\EventListener\Login\Router $router
     * @param \AppBundle\EventListener\Login\EventDispatcherInterface $dispatcher
     */
    public function __construct(SecurityContext $securityContext, Router $router, EventDispatcherInterface $dispatcher) {
        $this->securityContext = $securityContext;
        $this->router = $router;
        $this->dispatcher = $dispatcher;
    }
    
    /**
     * 
     * @param InteractiveLoginEvent $event
     */
    public function onSecurityInteractiveLogin(InteractiveLoginEvent $event) {
        if ($this->securityContext->isGranted ( 'IS_AUTHENTICATED_FULLY' )) {
            $user = $event->getAuthenticationToken ()->getUser ();

            if ($user->getLastLogin () === null) {
                $this->dispatcher->addListener ( KernelEvents::RESPONSE, array (
                        $this,
                        'onKernelResponse' 
                ) );
            }
        }
    }
    
    /**
     * 
     * @param \AppBundle\EventListener\Login\FilterResponseEvent $event
     */
    public function onKernelResponse(FilterResponseEvent $event) {
        $response = new RedirectResponse ( $this->router->generate ( 'fos_user_change_password' ) );
        $event->setResponse ( $response );
    }
}
