<?php

namespace AppBundle;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
final class MailerEvents
{
    /**
     *
     * Symfony\Component\EventDispatcher\GenericEvent
     *
     * @Event
     */
    const PRE_SEND = 'mailer.pre_sendl';

    /**
     * Symfony\Component\EventDispatcher\GenericEvent
     *
     * @Event
     */
    const POST_SEND = 'mailer.post_send';

    /**
     * Symfony\Component\EventDispatcher\GenericEvent
     *
     * @Event
     */
    const SEND_FAIL = 'mailer.send_fail';
}