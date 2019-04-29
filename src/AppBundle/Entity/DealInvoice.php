<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\UploadedFile as HttpUploadedFile;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * DealInvoice
 *
 * @ORM\Table()
 * @ORM\Entity
 * @UniqueEntity(fields = {"bussinesUnit", "invoiceNumber"}, message="Numero de factura ya existe")
 */
class DealInvoice
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;
    
     /**
        * @Assert\NotBlank(message="label.register_bill_error_bill_select")
        * @ORM\ManyToOne(targetEntity="DealBussinesUnit", cascade={"persist"})
        * @ORM\JoinColumn(name="deal_bussines_unit_id", referencedColumnName="id")
     */
    private $bussinesUnit;

    /**
     * @Assert\NotBlank(message="label.register_bill_error_company_select")
     * @ORM\ManyToOne(targetEntity="DealCompany", cascade={"persist"})
     * @ORM\JoinColumn(name="company_distributor_id", referencedColumnName="id")
     */
    private $companyDistributorId;

    /**
     * @var string
     * @Assert\NotBlank(message="label.register_bill_error_number_bill")
     * @ORM\Column(name="invoice_number", type="string", length=50)
     */
    private $invoiceNumber;
    
    /**
     * @var string
     * @ORM\Column(name="correlative", type="string", length=50, nullable=true)
     */
    private $correlative;

    /**
     * @var \DateTime
     * @Assert\NotBlank(message="label.register_bill_error_date_buy_bill")
     * @ORM\Column(name="purchase_invoice_date", type="date",nullable=true)
     */
    private $purchaseInvoiceDate;

    /**
     * @var string
     *
     * @ORM\Column(name="computo", type="string", length=50, nullable=true)
     */
    private $computo;
    
    /**
     * @var string
     *
     * @ORM\Column(name="computo_win_pro", type="string", length=2, nullable=true)
     */
    private $computoWinPro;

    /**
     * @var integer
     * @Assert\NotBlank(message="label.register_bill_error_number_units")
     * @ORM\Column(name="total_units", type="integer")
     
     */
    private $totalUnits;

    /**
     * @var integer
     * @Assert\NotBlank(message="label.register_bill_error_total_amount")
     * @ORM\Column(name="total_quantity", type="decimal", precision=20, scale=3, nullable=true))
     */
    private $totalQuantity;
    
    /**
     * @ORM\Column(name="certificado", type="string", nullable=true)
     *
     * @ Assert\NotBlank(message="label.register_bill_error_upload_certificate")
     * @Assert\File(
     *     maxSize = "5M",
     *     mimeTypes = {"application/pdf", "application/x-pdf","image/png","image/jpeg"},
     *     mimeTypesMessage="label.register_bill_error_upload_certificate"
     * )
     */
    private $certificado;

   /**
    * @ORM\Column(name="factura", type="string", nullable=true)
    *
    * @ Assert\NotBlank(message="label.register_bill_error_upload_bill")
    * @Assert\File(
    *     maxSize = "5M",
    *     mimeTypes = {"application/pdf", "application/x-pdf","image/png","image/jpeg"} ,
    *   mimeTypesMessage="label.register_bill_error_upload_bill"
    * )
    */
    private $factura;



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
     * Set bussinesUnit
     *
     * @param \AppBundle\Entity\DealBussinesunit $bussinesUnit
     * @return DealInvoice
     */
    public function setBussinesUnit(\AppBundle\Entity\DealBussinesUnit $bussinesUnit = null)
    {
        $this->bussinesUnit = $bussinesUnit;

        return $this;
    }
    

    
    /**
     * Get bussinesUnit
     *
     * @return \AppBundle\Entity\DealBussinesUnit
     */
    public function getBussinesUnit()
    {
        return $this->bussinesUnit;
    }

    /**
     * Set companyDistributorId
     *
     * @param integer $companyDistributorId
     *
     * @return DealInvoice
     */
    public function setCompanyDistributorId($companyDistributorId)
    {
        $this->companyDistributorId = $companyDistributorId;

        return $this;
    }

    /**
     * Get companyDistributorId
     *
     * @return integer
     */
    public function getCompanyDistributorId()
    {
        return $this->companyDistributorId;
    }

    /**
     * Set invoiceNumber
     *
     * @param string $invoiceNumber
     *
     * @return DealInvoice
     */
    public function setInvoiceNumber($invoiceNumber)
    {
        $this->invoiceNumber = $invoiceNumber;

        return $this;
    }

    /**
     * Get invoiceNumber
     *
     * @return string
     */
    public function getInvoiceNumber()
    {
        return $this->invoiceNumber;
    }
    
    
    /**
     * Set correlative
     *
     * @param string $correlative
     *
     * @return DealInvoice
     */
    public function setCorrelative($correlative)
    {
        $this->correlative = $correlative;

        return $this;
    }

    /**
     * Get correlative
     *
     * @return string
     */
    public function getCorrelative()
    {
        return $this->correlative;
    }
    
    
    

    /**
     * Set purchaseInvoiceDate
     *
     * @param \DateTime $purchaseInvoiceDate
     *
     * @return DealInvoice
     */
    public function setPurchaseInvoiceDate($purchaseInvoiceDate)
    {
        $this->purchaseInvoiceDate = $purchaseInvoiceDate;

        return $this;
    }

    /**
     * Get purchaseInvoiceDate
     *
     * @return \DateTime
     */
    public function getPurchaseInvoiceDate()
    {
        return $this->purchaseInvoiceDate;
    }

    /**
     * Set computo
     *
     * @param string $computo
     *
     * @return DealInvoice
     */
    public function setComputo($computo)
    {
        $this->computo = $computo;

        return $this;
    }

    /**
     * Get computo
     *
     * @return string
     */
    public function getComputo()
    {
        return $this->computo;
    }
    
    /**
     * Set computoWinPro
     *
     * @param string $computoWinPro
     *
     * @return DealInvoice
     */
    public function setComputoWinPro($computoWinPro)
    {
        $this->computoWinPro = $computoWinPro;

        return $this;
    }

    /**
     * Get computoWinPro
     *
     * @return string
     */
    public function getComputoWinPro()
    {
        return $this->computoWinPro;
    }
    
    /**
     * Set totalUnits
     *
     * @param integer $totalUnits
     *
     * @return DealInvoice
     */
    public function setTotalUnits($totalUnits)
    {
        $this->totalUnits = $totalUnits;

        return $this;
    }

    /**
     * Get totalUnits
     *
     * @return integer
     */
    public function getTotalUnits()
    {
        return $this->totalUnits;
    }

    /**
     * Set totalQuantity
     *
     * @param integer $totalQuantity
     *
     * @return DealInvoice
     */
    public function setTotalQuantity($totalQuantity)
    {
        $this->totalQuantity = $totalQuantity;

        return $this;
    }

    /**
     * Get totalQuantity
     *
     * @return integer
     */
    public function getTotalQuantity()
    {
        return $this->totalQuantity;
    }
    
     /**
     * @return \Symfony\Component\HttpFoundation\File\File
     */
    public function getCertificado()
    {
        return $this->certificado;
    }
    /**
     * @param string $certificado
     */
    public function setCertificado($certificado)
    {
        $this->certificado = $certificado;

        return $this;
    }
    
        /**
     * @return \Symfony\Component\HttpFoundation\File\File
     */
    public function getFactura()
    {
        return $this->factura;
    }
    /**
     * @param string $factura
     */
    public function setFactura($factura)
    {
        $this->factura = $factura;

        return $this;
    }

}

