<?php

namespace AppBundle\Tests\Entity;


use AppBundle\Entity\DealCompanyContact;
use AppBundle\Entity\DealCompanyContactPhone;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

/**
 * @group entity
 */
class DealCompanyContactTest extends KernelTestCase
{
    public function testNewInstance()
    {
        $entity = new DealCompanyContact();

        $this->assertEmpty($entity->getId());
        $this->assertEmpty($entity->getfirstName());
        $this->assertEmpty($entity->getLastName());
        $this->assertEmpty($entity->getEmail());
        $this->assertEmpty($entity->getPhone());
        $this->assertEmpty($entity->getPosition());
    }

    public function testSetters()
    {
        $entity = new DealCompanyContact();

        $entity->setFirstName('nombre');
        $entity->setLastName('apellido');
        $entity->setEmail('test@test.com');
        $entity->setPhone(new DealCompanyContactPhone());
        $entity->setPosition('cargo');

        $this->assertEquals('nombre', $entity->getfirstName());
        $this->assertEquals('apellido', $entity->getLastName());
        $this->assertEquals('test@test.com', $entity->getEmail());
        $this->assertEquals(new DealCompanyContactPhone(), $entity->getPhone());
        $this->assertEquals('cargo', $entity->getPosition());
    }

    /**
     * @group validation
     */
    public function testAssertInvalid()
    {
        static::bootKernel();

        $validator = static::$kernel->getContainer()->get('validator');

        $entity = new DealCompanyContact();

        $errors = $validator->validate($entity);

        $this->assertGreaterThan(0, $errors->count());
    }

    /**
     * @group validation
     */
    public function testAssertValid()
    {
        static::bootKernel();

        $validator = static::$kernel->getContainer()->get('validator');

        $entity = new DealCompanyContact();

        $entity->setFirstName('nombre');
        $entity->setLastName('apellido');
        $entity->setEmail('test@test.com');
        $entity->setPhone(new DealCompanyContactPhone());
        $entity->setPosition('cargo');

        $entity->getPhone()->setType(DealCompanyContactPhone::TYPE_MOBILE);
        $entity->getPhone()->setCountryCode('58');
        $entity->getPhone()->setAreaCode('243');
        $entity->getPhone()->setPhoneNumber('5555555');

        $errors = $validator->validate($entity);

        $this->assertEquals(0, $errors->count());
    }

}
