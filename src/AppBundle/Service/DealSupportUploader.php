<?php

namespace AppBundle\Service;

use AppBundle\Entity\Deal;
use AppBundle\Entity\DealWonSupport;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\File\UploadedFile;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DealSupportUploader
{
    /** @var EntityManagerInterface */
    private $em;
    /** @var string */
    private $webPath;

    /**
     * DealSupportUploader constructor.
     * @param EntityManagerInterface $em
     * @param string $webPath
     */
    public function __construct(EntityManagerInterface $em, $webPath)
    {
        $this->em = $em;
        $this->webPath = rtrim($webPath, '/');
    }

    public function upload(Deal $deal, UploadedFile $supportFile)
    {
        if (!$deal->getSupport()) {
            $deal->setSupport(new DealWonSupport($deal));
        }

        $support = $deal->getSupport();
        $filename = $this->moveFile($supportFile, $deal);

        $support->setLabel($supportFile->getClientOriginalName());
        $support->setFilename($filename);

        $this->em->persist($deal->getSupport());
        $this->em->flush($deal->getSupport());
    }

    /**
     * @param UploadedFile $supportFile
     * @return string
     */
    private function moveFile(UploadedFile $supportFile, Deal $deal)
    {
        $filename = uniqid($deal->getId().'-').'.'.$supportFile->getClientOriginalExtension();
        $supportFile->move($this->webPath.'/uploads/deal/', $filename);

        return $filename;
    }
}