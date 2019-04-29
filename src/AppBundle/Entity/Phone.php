<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use AppBundle\Util\TimestampableEntity;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Phone
 *
 * @ORM\Table(name="phone")
 * @ORM\Entity
 *
 * @ORM\InheritanceType("JOINED")
 * @ORM\DiscriminatorColumn(name="discr", type="string")
 * @ORM\DiscriminatorMap({
 *        "Phone"           = "Phone",
 *        "PhoneUser"    = "PhoneUser"
 * })
 *
 */
class Phone
{
    use TimestampableEntity;

    const TYPE_HOME = 'Home';
    const TYPE_WORK = 'Office';
    const TYPE_FAX = 'Fax';
    const TYPE_MOBILE = 'Mobile';

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="type", type="string", length=50, columnDefinition="ENUM('Home', 'Office', 'Fax', 'Mobile')")
     *
     * @ Assert\Choice(callback="getValidTypes") @todo: verificar si realmente hace falta
     * @Assert\NotBlank(message="phone.type.not_null")
     */
    private $type;

    /**
     * @var string
     *
     * @ORM\Column(name="country_code", type="string", length=4)
     *
     * @Assert\NotBlank(message="label.code_not_empty")
     * @Assert\Regex(
     *     pattern="/^[0-9]+$/",
     *     message="label.c_only_numbers"
     * )
     * @Assert\Length(min="1", max="4", minMessage="phone.countryCode.length", maxMessage="phone.countryCode.length")
     */
    private $countryCode;

    /**
     * @var string
     *
     * @ORM\Column(name="area_code", type="string", length=5)
     *
     * @Assert\NotBlank(message="label.country_code_empty")
     * @Assert\Length(min="1", max="5", minMessage="phone.areaCode.length", maxMessage="phone.areaCode.length")
     * @Assert\Regex(
     *     pattern="/^[0-9]+$/",
     *     message="label.c_only_numbers"
     * )
     */
    private $areaCode;

    /**
     * @var string
     *
     * @ORM\Column(name="phone_number", type="string", length=15)
     *
     * @Assert\NotBlank(message="label.number_not_empty")
     * @Assert\Length(min="4", max="15", minMessage="phone.phoneNumber.length", maxMessage="phone.phoneNumber.length")
     * @Assert\Regex(
     *     pattern="/^[0-9]+$/",
     *     message="label.c_only_numbers"
     * )
     */
    private $phoneNumber;


    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set type
     *
     * @param string $type
     *
     * @return Phone
     */
    public function setType($type)
    {
        $validTypes = self::getValidTypes();
        // @todo: se cambio el in_array por array_key_exists ya que quiero verificar si el valor es correcto
        if (!array_key_exists($type, $validTypes)) {

            throw new \InvalidArgumentException(sprintf("Invalid Phone Type '%s', Available types are: %s", $type,
                join(', ', $validTypes)));
        }

        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set countryCode
     *
     * @param string $countryCode
     *
     * @return Phone
     */
    public function setCountryCode($countryCode)
    {
        $this->countryCode = (string)$countryCode;

        return $this;
    }

    /**
     * Get countryCode
     *
     * @return string
     */
    public function getCountryCode()
    {
        return $this->countryCode;
    }

    /**
     * Set areaCode
     *
     * @param string $areaCode
     *
     * @return Phone
     */
    public function setAreaCode($areaCode)
    {
        $this->areaCode = (string)$areaCode;

        return $this;
    }

    /**
     * Get areaCode
     *
     * @return string
     */
    public function getAreaCode()
    {
        return (string)$this->areaCode;
    }

    /**
     * Set phoneNumber
     *
     * @param string $phoneNumber
     *
     * @return Phone
     */
    public function setPhoneNumber($phoneNumber)
    {
        $this->phoneNumber = (string)$phoneNumber;

        return $this;
    }

    /**
     * Get phoneNumber
     *
     * @return string
     */
    public function getPhoneNumber()
    {
        return (string)$this->phoneNumber;
    }

    public function getNumber()
    {
        return trim(sprintf('%s (%s) %s', $this->getCountryCode(), $this->getAreaCode(), $this->getPhoneNumber()),
            ' ()');
    }

    public function __toString()
    {
        return $this->getNumber();
    }

    public static function getValidTypes()
    {
        return array(
            self::TYPE_WORK => self::TYPE_WORK,
            self::TYPE_MOBILE => self::TYPE_MOBILE,
        );
    }

    public function __clone()
    {
        return $this->id = null;
    }

    public function hasEmptyData()
    {
        return count(array_filter($this->toArray())) < 4;
    }

    public function toArray()
    {
        return array(
            'type' => $this->getType(),
            'countryCode' => $this->getCountryCode(),
            'areaCode' => $this->getAreaCode(),
            'phoneNumber' => $this->getPhoneNumber(),
        );
    }

    public function isEmpty()
    {
        return '' == trim($this->getCountryCode())
        and '' == trim($this->getAreaCode())
        and '' == trim($this->getPhoneNumber());
    }

    static public function createFromPhone(Phone $phone)
    {
        $new = new static();

        $new->updateFromPhone($phone);

        return $new;
    }

    public function updateFromPhone(Phone $phone)
    {
        $this->setType($phone->getType());
        $this->setCountryCode($phone->getCountryCode());
        $this->setAreaCode($phone->getAreaCode());
        $this->setPhoneNumber($phone->getPhoneNumber());

        return $this;
    }
}
