<?php

namespace AppBundle\Entity;

use AppBundle\Util\TimestampableEntity;
use Doctrine\ORM\Mapping as ORM;

/**
 * Contiene los datos de todos los correos enviados.
 *
 * @ORM\Table(name="emails")
 * @ORM\Entity(repositoryClass="AppBundle\Entity\Repository\EmailRepository")
 * @ORM\HasLifecycleCallbacks()
 *
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class Email
{
    const STATUS_CREATED = 0;
    const STATUS_SUCCESS = 1;
    const STATUS_FAILED = 2;
    const STATUS_ERROR = 3;

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
     * @var EmailTemplate
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\EmailTemplate")
     * @ORM\JoinColumn(name="email_template_id", referencedColumnName="id")
     */
    private $emailTemplate;
    /**
     * @var array
     *
     * @ORM\Column(name="recipients", type="simple_array", nullable=true)
     */
    private $recipients;
    /**
     * @var User
     *
     * @ORM\Column(name="failed_recipients", type="simple_array", nullable=true)
     */
    private $failedRecipients;

    /**
     * @var integer
     *
     * @ORM\Column(name="status", type="smallint")
     */
    private $status = self::STATUS_CREATED;

    /**
     * @var string
     *
     * @ORM\Column(name="statusMessage", type="string", length=255, nullable=true)
     */
    private $statusMessage;

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text")
     */
    private $content;

    /**
     * @var string
     *
     * @ORM\Column(name="token", type="string", length=255, nullable=true)
     */
    private $token;

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
     * Set status
     *
     * @param integer $status
     * @return Email
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status
     *
     * @return integer 
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set statusMessage
     *
     * @param string $statusMessage
     * @return Email
     */
    public function setStatusMessage($statusMessage)
    {
        $this->statusMessage = $statusMessage;

        return $this;
    }

    /**
     * Get statusMessage
     *
     * @return string 
     */
    public function getStatusMessage()
    {
        return $this->statusMessage;
    }

    /**
     * Set content
     *
     * @param string $content
     * @return Email
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
     * Set emailTemplate
     *
     * @param \AppBundle\Entity\EmailTemplate $emailTemplate
     * @return Email
     */
    public function setEmailTemplate(\AppBundle\Entity\EmailTemplate $emailTemplate = null)
    {
        $this->emailTemplate = $emailTemplate;

        return $this;
    }

    /**
     * Get emailTemplate
     *
     * @return \AppBundle\Entity\EmailTemplate 
     */
    public function getEmailTemplate()
    {
        return $this->emailTemplate;
    }

    /**
     * @return string
     */
    public function getToken()
    {
        return $this->token;
    }

    /**
     * @param string $token
     */
    public function setToken($token)
    {
        $this->token = $token;
    }

    /**
     * Set recipients
     *
     * @param array $recipients
     * @return Email
     */
    public function setRecipients($recipients)
    {
        $this->recipients = $recipients;

        return $this;
    }

    /**
     * Get recipients
     *
     * @return array 
     */
    public function getRecipients()
    {
        return $this->recipients;
    }

    /**
     * Set failedRecipients
     *
     * @param array $failedRecipients
     * @return Email
     */
    public function setFailedRecipients($failedRecipients)
    {
        $this->failedRecipients = $failedRecipients;

        return $this;
    }

    /**
     * Get failedRecipients
     *
     * @return array 
     */
    public function getFailedRecipients()
    {
        return $this->failedRecipients;
    }
}
