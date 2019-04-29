<?php

namespace AppBundle\Tests\Entity;


use AppBundle\Entity\City;
use AppBundle\Entity\Country;
use AppBundle\Entity\DealCompany;
use AppBundle\Entity\DealCompanyContact;
use AppBundle\Entity\State;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

/**
 * @group entity
 */
class DealCompanyTest extends KernelTestCase
{

    public function testNewInstance()
    {
        $entity = new DealCompany();

        $this->assertEmpty($entity->getId());
        $this->assertEmpty($entity->getName());
        $this->assertEmpty($entity->getAddress());
        $this->assertEmpty($entity->getCity());
        $this->assertEmpty($entity->getState());
        $this->assertEmpty($entity->getCountry());
        $this->assertEmpty($entity->getZipCode());
        $this->assertEmpty($entity->getWebsite());
        $this->assertEmpty($entity->getContact());
        $this->assertEmpty($entity->getAttributes());
    }

    public function testSetters()
    {
        $entity = new DealCompany();

        $entity->setName('nombre');
        $entity->setAddress('address');
        $entity->setCity(new City());
        $entity->setState(new State());
        $entity->setCountry(new Country());
        $entity->setZipCode('000000');
        $entity->setWebsite('www.test.com');
        $entity->setContact(new DealCompanyContact());

        $this->assertEquals('nombre', $entity->getName());
        $this->assertEquals('address', $entity->getAddress());
        $this->assertEquals(new City(), $entity->getCity());
        $this->assertEquals(new State(), $entity->getState());
        $this->assertEquals(new Country(), $entity->getCountry());
        $this->assertEquals('000000', $entity->getZipCode());
        $this->assertEquals('www.test.com', $entity->getWebsite());
        $this->assertEquals(new DealCompanyContact(), $entity->getContact());
    }

    /**
     * @group validation
     */
    public function testAssertInvalid()
    {
        static::bootKernel();

        $validator = static::$kernel->getContainer()->get('validator');

        $entity = new DealCompany();

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

        $entity = new DealCompany();

        $entity->setName('nombre');
        $entity->setAddress('address');
        $entity->setCity(new City());
        $entity->setState(new State());
        $entity->setCountry(new Country());
        $entity->setZipCode('000000');
        $entity->setWebsite('http://www.test.com');
        $entity->setContact(new DealCompanyContact());

        $entity->getContact()->setName('nombre');
        $entity->getContact()->setLastName('apellido');
        $entity->getContact()->setEmail('test@test.com');
        $entity->getContact()->setPosition('cargo');

        $errors = $validator->validate($entity);

        $this->assertEquals(0, $errors->count());
    }
    
}
