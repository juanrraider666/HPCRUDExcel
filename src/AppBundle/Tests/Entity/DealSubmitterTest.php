<?php

namespace AppBundle\Tests\Entity;


use AppBundle\Entity\DealSubmitter;
use AppBundle\Entity\Loyalty;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

/**
 * @group entity
 */
class DealSubmitterTest extends KernelTestCase
{
    private $user;

    private $loyalty;

    private $entity;

    public function setUp()
    {
        $this->user = $this
            ->getMockBuilder(ExternalUser::class)
            ->disableOriginalConstructor()
            ->getMock();

        $this->loyalty = $this->getMock(Loyalty::class);
        $this->entity = new DealSubmitter($this->user, $this->loyalty);
    }

    public function testNewInstance()
    {
        $entity = $this->entity;

        $this->assertEmpty($entity->getId());
        $this->assertEmpty($entity->getUserId());
        $this->assertEmpty($entity->getCompanyId());
    }

    public function testSetters()
    {
        $entity = $this->entity;

        $entity->setUserId(2);
        $entity->setCompanyId(1);

        $this->assertEquals(2, $entity->getUserId());
        $this->assertEquals(1, $entity->getCompanyId());

        return $entity;
    }

    /**
     * @group validation
     */
    public function testAssertInvalid()
    {
        static::bootKernel();

        $validator = static::$kernel->getContainer()->get('validator');

        $entity = $this->entity;

        $errors = $validator->validate($entity);

        $this->assertGreaterThan(0, $errors->count());
    }

    /**
     * @depends testSetters
     * @group validation
     */
    public function testAssertValid(DealSubmitter $entity)
    {
        static::bootKernel();

        $validator = static::$kernel->getContainer()->get('validator');

        $errors = $validator->validate($entity);

        $this->assertEquals(0, $errors->count());
    }

}
