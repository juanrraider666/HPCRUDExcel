<?php

namespace Optime\Bundle\SimpleSsoClientBundle;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
interface ExternalUserInterface
{
    public function getCompanyId();
    public function getUserId();
    public function getProfileId();
    public function getCompanyTypeId();
    public function getRoles();
    public function getRolesByProfile();
}