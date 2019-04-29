<?php

namespace AppBundle\Tests\Factory;

use AppBundle\Entity\AuthorComment;
use AppBundle\Factory\DoctrineAuthorFactory;
use Optime\Bundle\SimpleSsoClientBundle\Security\User\ExternalUser;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class DoctrineAuthorFactoryTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var DoctrineAuthorFactory
     */
    private $factory;

    protected function setUp()
    {
        $this->factory = new DoctrineAuthorFactory();
    }

    public function testReturnCorrectInstance()
    {
        $externalUser = $this->prophesize(ExternalUser::class);
        $author = $this->factory->createFromExternalUser($externalUser->reveal());

        $this->assertInstanceOf(AuthorComment::class, $author);
    }

    public function testAuthorProperties()
    {
        $userId = 100;
        $email = 'email';
        $firstName = 'firstName';
        $lastName = 'lastName';
        $profileName = 'profileName';
        $profileId = 150;
        $companyName = 'companyName';
        $companyId = 200;

        $externalUser = $this->prophesize(ExternalUser::class);

        $externalUser->getUserId()->willReturn($userId);
        $externalUser->getEmail()->willReturn($email);
        $externalUser->getFirstName()->willReturn($firstName);
        $externalUser->getLastName()->willReturn($lastName);
        $externalUser->getProfileName()->willReturn($profileName);
        $externalUser->getProfileId()->willReturn($profileId);
        $externalUser->getCompanyName()->willReturn($companyName);
        $externalUser->getCompanyId()->willReturn($companyId);

        $author = $this->factory->createFromExternalUser($externalUser->reveal());

        $this->assertEquals($userId, $author->getExternalUserId());
        $this->assertEquals($email, $author->getEmail());
        $this->assertEquals($firstName.' '.$lastName, $author->getName());
        $this->assertEquals($profileName, $author->getProfile());
        $this->assertEquals($profileId, $author->getExternalProfileId());
        $this->assertEquals($companyName, $author->getCompany());
        $this->assertEquals($companyId, $author->getExternalCompanyId());
    }
}
