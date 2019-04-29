<?php

namespace AppBundle\Email;

use AppBundle\Entity\EmailTemplate;
use AppBundle\Entity\Repository\EmailTemplateRepository;
use Doctrine\ORM\EntityNotFoundException;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Security\Csrf\TokenGenerator\TokenGeneratorInterface;
use Symfony\Component\Translation\TranslatorInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class EmailTemplateRenderer
{
    /**
     * @var \Twig_Environment
     */
    private $twig;
    /**
     * @var EmailTemplateRepository
     */
    private $emailTemplateRepository;
    /**
     * @var TokenGeneratorInterface
     */
    private $tokenGenerator;
    /**
     * @var TranslatorInterface
     */
    private $translator;
    /**
     * @var string
     */
    private $layoutsPath;

    /**
     * EmailTemplateRenderer constructor.
     *
     * @param \Twig_Environment       $twig
     * @param EmailTemplateRepository $emailTemplateRepository
     * @param TokenGeneratorInterface $tokenGenerator
     * @param TranslatorInterface     $translator
     * @param string                  $layoutsPath
     */
    public function __construct(\Twig_Environment $twig, EmailTemplateRepository $emailTemplateRepository, TokenGeneratorInterface $tokenGenerator, TranslatorInterface $translator, $layoutsPath)
    {
        $this->twig = $twig;
        $this->emailTemplateRepository = $emailTemplateRepository;
        $this->tokenGenerator = $tokenGenerator;
        $this->translator = $translator;
        $this->layoutsPath = $layoutsPath;
    }

    public function render(EmailTemplate $emailTemplate, array $context = array(), $locale = null)
    {
        $context['unique_token'] = $token = $this->tokenGenerator->generateToken();
        $html = $this->doRender($this->getTemplateName($emailTemplate), array(
            'content' => $emailTemplate->getContent(),
            'variables' => $context,
            'unique_token' => $token,
            '__email__' => isset($context['__email__']) ? $context['__email__'] : null,
        ), $locale);
        return new RenderedTemplate(
            $emailTemplate,
            $token,
            $html,
            $this->renderStringContent($emailTemplate, $context, $locale),
            $this->renderSubject($emailTemplate, $context, $locale)
        );
    }

    public function renderStringContent(EmailTemplate $template, array $context = array(), $locale = null)
    {
        if ('' == trim($template->getStringContent())) {
            return '';
        }

        return $this->doRender(
            $this->twig->createTemplate($template->getStringContent()),
            $context,
            $locale
        );
    }

    public function renderSubject(EmailTemplate $template, array $context = array(), $locale = null)
    {
        return $this->doRender(
            $this->twig->createTemplate($template->getSubject()),
            $context,
            $locale
        );
    }

    /**
     * @param $code
     * @param array $context
     * @param null $locale
     * @return RenderedTemplate
     * @throws EntityNotFoundException
     */
    public function getByCode($code, array $context = array(), $locale = null)
    {
        $emailTemplate = $this->emailTemplateRepository->findOneByCode($code);

        if (null == $emailTemplate) {
            throw new EntityNotFoundException("No existe una plantilla de correo con código \"{$code}\" activa");
        }

        return $this->render($emailTemplate, $context, $locale);
    }

    protected function doRender($template, array $context = array(), $locale = null)
    {
        
        if (null !== $locale) {
            $currentLocale = $this->translator->getLocale();
            $this->translator->setLocale($locale);
        }
        
        $strictVariables = $this->twig->isStrictVariables();
        $this->twig->disableStrictVariables();
        

        $content = $this->twig->resolveTemplate($template)->render($context);
        
        if ($strictVariables) {
            $this->twig->enableStrictVariables();
        }

        if (null !== $locale) {
            $this->translator->setLocale($currentLocale);
        }

        return $content;
    }

    private function getTemplateName(EmailTemplate $template)
    {
        return rtrim($this->layoutsPath, '/') . '/' . $template->getLayout();
    }
}