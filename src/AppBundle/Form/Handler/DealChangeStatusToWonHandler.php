<?php

namespace AppBundle\Form\Handler;

use AppBundle\Entity\Deal;
use AppBundle\Service\DealSupportUploader;
use AppBundle\Service\StatusChange\StatusWonUpdater;
use Symfony\Component\Form\Form;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealChangeStatusToWonHandler
{
    /** @var StatusWonUpdater */
    private $statusUpdater;

    /** @var DealSupportUploader */
    private $supportUploader;

    /**
     * DealChangeStatusToWonHandler constructor.
     * @param StatusWonUpdater $statusUpdater
     * @param DealSupportUploader $supportUploader
     */
    public function __construct(StatusWonUpdater $statusUpdater, DealSupportUploader $supportUploader)
    {
        $this->statusUpdater = $statusUpdater;
        $this->supportUploader = $supportUploader;
    }

    public function handle(Form $form, Deal $deal)
    {
        if (!$form->isSubmitted() or !$form->isValid()) {
            return false;
        }

        $this->supportUploader->upload($deal, $form['file']->getData());
        $this->statusUpdater->changeStatus($deal);

        return true;
    }
}