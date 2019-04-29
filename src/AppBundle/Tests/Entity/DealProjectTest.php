<?php

namespace AppBundle\Tests\Entity;


use AppBundle\Entity\DealProject;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

/**
 * @group entity
 */
class DealProjectTest extends KernelTestCase
{
    public function testNewInstance()
    {
        $entity = new DealProject();

        $this->assertEmpty($entity->getId());
        $this->assertEmpty($entity->getName());
        $this->assertEmpty($entity->getDescription());
        $this->assertEmpty($entity->getStatus());
        $this->assertEmpty($entity->getReason());
        $this->assertEmpty($entity->getAttributes());
    }

    public function testSetters()
    {
        $entity = new DealProject();

        $entity->setName('nombre');
        $entity->setDescription('descripcion');
        $entity->setStatus('status');
        $entity->setReason('reason');

        $this->assertEquals('nombre', $entity->getName());
        $this->assertEquals('descripcion', $entity->getDescription());
        $this->assertEquals('status', $entity->getStatus());
        $this->assertEquals('reason', $entity->getReason());

        return $entity;
    }

    /**
     * @group validation
     */
    public function testAssertInvalid()
    {
        static::bootKernel();

        $validator = static::$kernel->getContainer()->get('validator');

        $entity = new DealProject();

        $errors = $validator->validate($entity);

        $this->assertGreaterThan(0, $errors->count());
    }

    /**
     * @depends testSetters
     * @group validation
     */
    public function testAssertValid(DealProject $entity)
    {
        static::bootKernel();

        $validator = static::$kernel->getContainer()->get('validator');

        $errors = $validator->validate($entity);

        $this->assertEquals(0, $errors->count());
    }

}
