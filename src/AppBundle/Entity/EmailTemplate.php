<?php

namespace AppBundle\Entity;

use AppBundle\Util\TimestampableEntity;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * EmailTemplate
 *
 * @ORM\Table(name="email_template")
 * @ORM\Entity(repositoryClass="AppBundle\Entity\Repository\EmailTemplateRepository")
 * @UniqueEntity("code")
 */
class EmailTemplate
{
    use TimestampableEntity;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="code", type="string", length=255, unique=true)
     * @Assert\NotBlank()
     */
    private $code;

    /**
     * @var string
     *
     * @ORM\Column(name="subject", type="string", length=255)
     * @Gedmo\Translatable
     * @Assert\NotBlank()
     */
    private $subject;

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text")
     * @Gedmo\Translatable
     * @Assert\NotBlank()
     */
    private $content;

    /**
     * @var string
     *
     * @ORM\Column(name="string_content", type="text", nullable=true)
     * @Gedmo\Translatable
     */
    private $stringContent;

    /**
     * @var boolean
     *
     * @ORM\Column(name="active", type="boolean")
     */
    private $active = true;

    /**
     * @var boolean
     *
     * @ORM\Column(name="test_data", type="array", nullable=true)
     */
    private $testData;

    /**
     * @ORM\Column(name="layout", type="string", length=100)
     * @Assert\NotBlank()
     */
    private $layout = 'default.html.twig';

    /**
     * @Gedmo\Locale
     */
    private $locale;

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set code
     *
     * @param string $code
     * @return EmailTemplate
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code
     *
     * @return string 
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set subject
     *
     * @param string $subject
     * @return EmailTemplate
     */
    public function setSubject($subject)
    {
        $this->subject = $subject;

        return $this;
    }

    /**
     * Get subject
     *
     * @return string 
     */
    public function getSubject()
    {
        return $this->subject;
    }

    /**
     * Set content
     *
     * @param string $content
     * @return EmailTemplate
     */
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Get content
     *
     * @return string 
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Set active
     *
     * @param boolean $active
     * @return EmailTemplate
     */
    public function setActive($active)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active
     *
     * @return boolean 
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set stringContent
     *
     * @param string $stringContent
     * @return EmailTemplate
     */
    public function setStringContent($stringContent)
    {
        $this->stringContent = $stringContent;

        return $this;
    }

    /**
     * Get stringContent
     *
     * @return string 
     */
    public function getStringContent()
    {
        return $this->stringContent;
    }

    /**
     * @return mixed
     */
    public function getLocale()
    {
        return $this->locale;
    }

    /**
     * @param mixed $locale
     */
    public function setLocale($locale)
    {
        $this->locale = $locale;
    }

    /**
     * Set testData
     *
     * @param array $testData
     * @return EmailTemplate
     */
    public function setTestData($testData)
    {
        $this->testData = $testData;

        return $this;
    }

    /**
     * Get testData
     *
     * @return array 
     */
    public function getTestData()
    {
        return $this->testData;
    }

    /**
     * Set layout
     *
     * @param boolean $layout
     * @return EmailTemplate
     */
    public function setLayout($layout)
    {
        $this->layout = $layout;

        return $this;
    }

    /**
     * Get layout
     *
     * @return boolean 
     */
    public function getLayout()
    {
        return $this->layout;
    }
}
