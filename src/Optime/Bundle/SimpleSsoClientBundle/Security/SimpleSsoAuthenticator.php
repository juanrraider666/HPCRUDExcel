<?php

namespace Optime\Bundle\SimpleSsoClientBundle\Security;

use Optime\Bundle\SimpleSsoClientBundle\External\RemoteConnectionInterface;
use Optime\Bundle\SimpleSsoClientBundle\Security\Exception\LoginException;
use Optime\Bundle\SimpleSsoClientBundle\Security\Provider\ExternalUserProviderInterface;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\Role\RolesResolverInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Guard\GuardAuthenticatorInterface;
use Symfony\Component\Security\Guard\Token\PostAuthenticationGuardToken;

class SimpleSsoAuthenticator implements GuardAuthenticatorInterface
{
    /**
     * @var RemoteConnectionInterface
     */
    private $remoteConnection;
    /**
     * @var RolesResolverInterface
     */
    private $rolesResolver;

    /**
     * SimpleSsoAuthenticator constructor.
     * @param RemoteConnectionInterface $remoteConnection
     * @param \Twig_Environment $twig
     * @param $rolesFromProfile
     */
    public function __construct(
        RemoteConnectionInterface $remoteConnection,
        RolesResolverInterface $rolesResolver
    ) {
        $this->remoteConnection = $remoteConnection;
        $this->rolesResolver = $rolesResolver;
    }

    /**
     * @param Request $request
     * @return array|void
     */
    public function getCredentials(Request $request)
    {
        if (!$request->query->has('_sso_otp')) {
            return;
        }

        return [
            'otp' => $request->query->get('_sso_otp'),
        ];
    }

    /**
     * @param mixed $credentials
     * @param UserProviderInterface $userProvider
     * @return UserInterface
     */
    public function getUser($credentials, UserProviderInterface $userProvider)
    {
        return $userProvider->loadUserByUsername($credentials['otp']);
    }

    public function checkCredentials($credentials, UserInterface $user)
    {
        return true;
    }

    public function onAuthenticationSuccess(Request $request, TokenInterface $token, $providerKey)
    {
        /*$request = $request->duplicate();
        $token->setAttribute('_sso_otp', $request->query->get('_sso_otp'));
        $request->query->remove('_sso_otp');
        $request->server->set('QUERY_STRING', http_build_query($request->query->all()));

        return new RedirectResponse($request->getUri(), 302);*/
    }

    public function onAuthenticationFailure(Request $request, AuthenticationException $exception)
    {
        throw new LoginException('Error de autenticación', $exception->getCode(), $exception);
    }

    public function start(Request $request, AuthenticationException $authException = null)
    {
        if ($authException instanceof LoginException) {
            // Si el AuthenticationFailure lanza un LoginException, no queremos redirigir al server sso.
            throw  new HttpException(
                Response::HTTP_UNAUTHORIZED,
                $authException->getMessage(),
                $authException->getPrevious()
            );
        }

        // debemos llamar al login y que luego nos rediriga al proyecto para crear la sesión.
        $url = sprintf(
            '%s?username=%s&_target=%s',
            $this->remoteConnection->getLoginUrl(),
            $this->remoteConnection->getUsername(),
            urlencode($request->getUri())
        );

        return new RedirectResponse($url);
    }

    public function supportsRememberMe()
    {
        return false;
    }

    public function createAuthenticatedToken(UserInterface $user, $providerKey)
    {
        return new PostAuthenticationGuardToken(
            $user,
            $providerKey,
            $this->rolesResolver->getRoles($user)
        );
    }
}