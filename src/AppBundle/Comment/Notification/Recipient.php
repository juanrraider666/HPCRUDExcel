<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Comment\Notification;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class Recipient
{
    /**
     * @var string
     */
    private $name;
    /**
     * @var string
     */
    private $email;
    /**
     * @var int
     */
    private $userId;
    /**
     * @var int
     */
    private $companyId;


    /**
     * Recipient constructor.
     * @param string $name
     * @param string $email
     * @param int $userId
     * @param int $companyId
     */
    public function __construct($name, $email, $userId, $companyId)
    {
        $this->name = $name;
        $this->email = $email;
        $this->userId = $userId;
        $this->companyId = $companyId;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @return int
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * @return int
     */
    public function getCompanyId()
    {
        return $this->companyId;
    }
}