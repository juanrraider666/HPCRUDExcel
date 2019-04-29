<?php
/*
 * This file is part of the Manuel Aguirre Project.
 *
 * (c) Manuel Aguirre <programador.manuel@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Comment;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class Author
{
    /**
     * @var string
     */
    protected $email;

    /**
     * @var string
     */
    protected $name;

    /**
     * @var string
     */
    protected $profile;

    /**
     * @var string
     */
    protected $company;

    /**
     * Author constructor.
     * @param string $email
     * @param string $name
     * @param string $profile
     * @param $company
     */
    public function __construct($email, $name, $profile, $company)
    {
        $this->email = $email;
        $this->name = $name;
        $this->profile = $profile;
        $this->company = $company;
    }

    /**
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
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
    public function getProfile()
    {
        return $this->profile;
    }

    /**
     * @return mixed
     */
    public function getCompany()
    {
        return $this->company;
    }

    public function __toString()
    {
        return (string) $this->getEmail();
    }
}