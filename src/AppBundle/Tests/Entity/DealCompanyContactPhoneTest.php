<?php
/**
 * Created by PhpStorm.
 * User: franjs
 * Date: 07/12/15
 * Time: 09:12 AM
 */

namespace AppBundle\Tests\Entity;


use AppBundle\Entity\DealCompanyContactPhone;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

/**
 * @group entity
 */
class DealCompanyContactPhoneTest extends KernelTestCase
{
    public function testNewInstance()
    {
        $entity = new DealCompanyContactPhone();

        $this->assertEmpty($entity->getId());
        $this->assertEmpty($entity->getCountryCode());
        $this->assertEmpty($entity->getAreaCode());
        $this->assertEmpty($entity->getPhoneNumber());
        $this->assertEmpty($entity->getNumber());
    }

    public function testSetters()
    {
        $entity = new DealCompanyContactPhone();

        $entity->setType(DealCompanyContactPhone::TYPE_MOBILE);
        $entity->setCountryCode('58');
        $entity->setAreaCode('0426');
        $entity->setPhoneNumber('2326948');

        $this->assertEquals('58', $entity->getCountryCode());
        $this->assertEquals('0426', $entity->getAreaCode());
        $this->assertEquals('2326948', $entity->getPhoneNumber());
        $this->assertEquals('58 (0426) 2326948', $entity->getNumber());
    }

//    public function testInvalidType()
//    {
//        $this->setExpectedException(\InvalidArgumentException::class);
//
//        $entity = new DealCompanyContactPhone();
//
//        $entity->setType('Invalid');
//    }

    public function testToString()
    {
        $entity = new DealCompanyContactPhone();

        $entity->setType(DealCompanyContactPhone::TYPE_MOBILE);
        $entity->setCountryCode('58');
        $entity->setAreaCode('0426');
        $entity->setPhoneNumber('2326948');

        $this->assertEquals('58 (0426) 2326948', (string) $entity);
    }

    /**
     * @group validation
     */
    public function testAssertInvalid()
    {
        static::bootKernel();

        $validator = static::$kernel->getContainer()->get('validator');

        $entity = new DealCompanyContactPhone();

        $errors = $validator->validate($entity);

        $this->assertGreaterThan(0, $errors->count());

        $entity->setCountryCode('123456');
        $entity->setAreaCode('123456');
        $entity->setPhoneNumber('1');

        $errors = $validator->validateProperty($entity, 'countryCode');
        $this->assertGreaterThan(0, $errors->count());
        $errors = $validator->validateProperty($entity, 'areaCode');
        $this->assertGreaterThan(0, $errors->count());
        $errors = $validator->validateProperty($entity, 'phoneNumber');
        $this->assertGreaterThan(0, $errors->count());

        $entity->setPhoneNumber('12344567899877456321545');

        $errors = $validator->validateProperty($entity, 'phoneNumber');
        $this->assertGreaterThan(0, $errors->count());

    }

    /**
     * @group validation
     */
    public function testAssertValid()
    {
        static::bootKernel();

        $validator = static::$kernel->getContainer()->get('validator');

        $entity = new DealCompanyContactPhone ();

        $entity->setType(DealCompanyContactPhone::TYPE_MOBILE);
        $entity->setCountryCode('58');
        $entity->setAreaCode('0426');
        $entity->setPhoneNumber('2326948');

        $errors = $validator->validate($entity);

        $this->assertEquals(0, $errors->count());
    }

}
