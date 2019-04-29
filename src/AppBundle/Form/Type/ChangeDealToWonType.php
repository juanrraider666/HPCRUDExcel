<?php

namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\Validator\Constraints\NotBlank;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class ChangeDealToWonType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('file', FileType::class, [
            'label' => 'label.deal_support.file',
            'constraints' => [
                new NotBlank(),
                new File([
                    'mimeTypes' => [
                        "image/png",
                        "image/jpeg",
                        "image/jpg",
                        "image/gif",
                        "application/pdf",
                        "application/x-pdf",
                    ],
                    'mimeTypesMessage' => 'form.deal.support.file.invalid_mime_type'
                ]),
            ],
        ]);
    }
}