<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use AppBundle\Util\TimestampableEntity;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * DealCompanyContactPhone
 *
 * @ORM\Table(name="deal_company_contact_phone")
 * @ORM\Entity
 */
class DealCompanyContactPhone
{
    use TimestampableEntity;

    const TYPE_HOME = 'Casa';
    const TYPE_WORK = 'Trabajo';
    const TYPE_FAX = 'Fax';
    const TYPE_MOBILE = 'Movil';

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
     * @ORM\Column(name="type", type="string", length=50, columnDefinition="ENUM('Casa', 'Trabajo', 'Fax', 'Movil')")
     *
     * @Assert\Choice(callback="getValidTypes") @todo: verificar si realmente hace falta
     * @Assert\NotBlank()
     */
    private $type;

    /**
     * @var string
     *
     * @ORM\Column(name="country_code", type="string", length=4)
     *
     * @Assert\NotBlank(message="Por favor ingrese el <strong>Codigo del País</strong>")
     * @Assert\Regex(
     *     pattern="/\d/",
     *     match=true,
     *     message="El <strong>Codigo del País</strong> debe contener solo números"
     * )
     * @Assert\Length(
     *     min=1,
     *     max=3,
     *     minMessage = "El Codigo del País debe contener al menos {{ limit }} digitos",
     *     maxMessage = "El Codigo del País debe contener maximo {{ limit }} digitos"
     * )
     */
    private $countryCode;

    /**
     * @var string
     *
     * @ORM\Column(name="area_code", type="string", length=5)
     *
     * @Assert\NotBlank(message="Por favor ingrese el <strong>Codigo de Área</strong> del teléfono")
     * @Assert\Regex(
     *     pattern="/\d/",
     *     match=true,
     *     message="El <strong>Codigo de Área</strong> debe contener solo números"
     * )
     * @Assert\Length(
     *     min=1,
     *     max=4,
     *     minMessage="El Codigo de Área debe contener al menos {{ limit }} digitos",
     *     maxMessage="El Codigo de Área debe contener maximo {{ limit }} digitos"
     * )
     */
    private $areaCode;

    /**
     * @var string
     *
     * @ORM\Column(name="phone_number", type="string", length=15)
     *
     * @Assert\NotBlank(message="Por favor ingrese el <strong>Número de Teléfono</strong>")
     * @Assert\Regex(
     *     pattern="/\d/",
     *     match=true,
     *     message="El <strong>Número de Teléfono</strong> debe contener solo números"
     * )
     * @Assert\Length(
     *     min=4,
     *     max=15,
     *     minMessage = "El <strong>Número de Teléfono</strong> debe contener al menos {{ limit }} digitos",
     *     maxMessage = "El <strong>Número de Teléfono</strong> debe contener maximo {{ limit }} digitos"
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
     * @return DealCompanyContactPhone
     */
    public function setType($type)
    {
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
     * @return DealCompanyContactPhone
     */
    public function setCountryCode($countryCode)
    {
        $this->countryCode = (string) $countryCode;

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
     * @return DealCompanyContactPhone
     */
    public function setAreaCode($areaCode)
    {
        $this->areaCode = (string) $areaCode;

        return $this;
    }

    /**
     * Get areaCode
     *
     * @return string
     */
    public function getAreaCode()
    {
        return $this->areaCode;
    }

    /**
     * Set phoneNumber
     *
     * @param string $phoneNumber
     *
     * @return DealCompanyContactPhone
     */
    public function setPhoneNumber($phoneNumber)
    {
        $this->phoneNumber = (string) $phoneNumber;

        return $this;
    }

    /**
     * Get phoneNumber
     *
     * @return string
     */
    public function getPhoneNumber()
    {
        return $this->phoneNumber;
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
            // TODO: se mandó a quitar pata Toshiba.
//            self::TYPE_HOME => 'phone.type.home',
            self::TYPE_WORK => self::TYPE_WORK,
            self::TYPE_FAX => self::TYPE_FAX,
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
}
