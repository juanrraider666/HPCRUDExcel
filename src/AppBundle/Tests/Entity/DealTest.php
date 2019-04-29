<?php

namespace AppBundle\Tests\Entity;

use AppBundle\Entity\Deal;
use AppBundle\Entity\DealCompany;
use AppBundle\Entity\DealProject;
use AppBundle\Entity\DealSubmitter;
use AppBundle\Entity\Loyalty;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

/**
 * @group entity
 */
class DealTest extends KernelTestCase
{
    private $user;

    private $loyalty;

    public function setUp()
    {
        $this->user = $this
            ->getMockBuilder(ExternalUser::class)
            ->disableOriginalConstructor()
            ->getMock();

        $this->loyalty = $this->getMock(Loyalty::class);
    }

    public function testNewInstance()
    {
        $entity = new Deal();

        $this->assertEmpty($entity->getId());
        $this->assertEmpty($entity->getAttributes());
        $this->assertEmpty($entity->getProject());
        $this->assertEmpty($entity->getProspectus());
        $this->assertEmpty($entity->getSubmitter());
        $this->assertEmpty($entity->getCreatedAt());
        $this->assertEmpty($entity->getUpdatedAt());

        return $entity;
    }

    /**
     * @depends testNewInstance
     */
    public function testSetters(Deal $entity)
    {
        $entity->setProspectus(new DealCompany());
        $entity->setProject(new DealProject());
        $entity->setSubmitter(new DealSubmitter($this->user, $this->loyalty));

        $this->assertEquals(new DealCompany(), $entity->getProspectus());
        $this->assertEquals(new DealProject(), $entity->getProject());
        $this->assertEquals(new DealSubmitter($this->user, $this->loyalty), $entity->getSubmitter());
    }

    /**
     * @group validation
     */
    public function testAssertValid()
    {
        static::bootKernel();

        $validator = static::$kernel->getContainer()->get('validator');

        $entity = new Deal();
        $entity->setTotalUsd(1);
        $entity->setDateEnd(new \DateTime('now'));

        $errors = $validator->validate($entity);

        $this->assertEquals(0, $errors->count());
    }

}