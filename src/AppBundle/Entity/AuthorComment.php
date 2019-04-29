<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Entity;

use AppBundle\Comment\Author;
use Doctrine\ORM\Mapping as ORM;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 *
 * @ORM\Embeddable
 */
class AuthorComment extends Author
{
    /**
     * @var string
     *
     * @ORM\Column(type="string")
     */
    protected $email;

    /**
     * @var string
     *
     * @ORM\Column(type="string")
     */
    protected $name;

    /**
     * @var string
     *
     * @ORM\Column(type="string")
     */
    protected $profile;

    /**
     * @var string
     *
     * @ORM\Column(type="string")
     */
    protected $company;

    /**
     * @var int
     *
     * @ORM\Column(type="integer")
     */
    private $externalUserId;

    /**
     * @var int
     *
     * @ORM\Column(type="integer")
     */
    private $externalCompanyId;

    /**
     * @var int
     *
     * @ORM\Column(type="integer")
     */
    private $externalProfileId;

    /**
     * AuthorComment constructor.
     * @param string $externalUserId
     * @param string $externalCompanyId
     * @param string $externalProfileId
     * @param $email
     * @param $name
     * @param $profile
     * @param $company
     */
    public function __construct(
        $externalUserId,
        $externalCompanyId,
        $externalProfileId,
        $email,
        $name,
        $profile,
        $company
    ) {
        $this->externalUserId = $externalUserId;
        $this->externalCompanyId = $externalCompanyId;
        $this->externalProfileId = $externalProfileId;
        $this->email = $email;
        $this->name = $name;
        $this->profile = $profile;
        $this->company = $company;
    }


    /**
     * @return int
     */
    public function getExternalUserId()
    {
        return $this->externalUserId;
    }

    /**
     * @return int
     */
    public function getExternalCompanyId()
    {
        return $this->externalCompanyId;
    }

    /**
     * @return int
     */
    public function getExternalProfileId()
    {
        return $this->externalProfileId;
    }
}