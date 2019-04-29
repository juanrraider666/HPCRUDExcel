<?php

namespace AppBundle\Comment\Service;

use AppBundle\Comment\Notification\Recipient;
use AppBundle\Entity\Deal;
use AppBundle\Entity\DealComment;
use AppBundle\Loyalty\Mailer\LoyaltyMailer;
use AppBundle\Soap\DealSoapException;
use Psr\Log\LoggerInterface;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class CommentMailer
{
    const EMAIL_TEMPLATE = 'opportunity_tracker.new_comment';

    /**
     * @var LoyaltyMailer
     */
    private $mailer;
    /**
     * @var LoggerInterface
     */
    private $logger;

    /**
     * CommentMailer constructor.
     * @param LoyaltyMailer $mailer
     */
    public function __construct(LoyaltyMailer $mailer, LoggerInterface $logger = null)
    {
        $this->mailer = $mailer;
        $this->logger = $logger;
    }

    public function send(Recipient $recipient, DealComment $comment, Deal $deal)
    {
        $locale = $deal->getSubmitter()->getLanguage();
        $author = $comment->getAuthor();

        $variables = [
            'comment' => $comment->getBody(),
            'author_name' => $author->getName(),
            'author_email' => $author->getEmail(),
            'deal_id' => $deal->getId(),
            'deal_company_name' => $deal->getProspectus()->getName(),
        ];

        if (null !== $this->logger) {
            $this->logger->debug('Notificando al usuario {email} de un nuevo comentario', [
                'email' => $recipient->getEmail(),
                'author_email' => $author->getEmail(),
                'deal_id' => $deal->getId(),
            ]);
        }

        try {
            $this->mailer->sendEmailToUser(
                self::EMAIL_TEMPLATE,
                $locale,
                $recipient->getUserId(),
                $recipient->getCompanyId(),
                serialize($variables)
            );
        } catch (DealSoapException $e) {
            if (null !== $this->logger) {
                $this->logger->error('Error al notificar al usuario {email} de un nuevo comentario', [
                    'email' => $recipient->getEmail(),
                    'error' => $e->getMessage(),
                ]);
            }
        }
    }
}