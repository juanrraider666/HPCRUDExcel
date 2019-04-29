<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PhoneUser
 *
 * @ORM\Table(name="phone_user")
 * @ORM\Entity
 */
class PhoneUser extends Phone
{

    /**
     * @var \AppBundle\Entity\User
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\User", inversedBy="phones")
     */
    private $user;

    /**
     * Set user
     *
     * @param \AppBundle\Entity\User $user
     * @return PhoneUser
     */
    public function setUser(\AppBundle\Entity\User $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return \AppBundle\Entity\User
     */
    public function getUser()
    {
        return $this->user;
    }
}
