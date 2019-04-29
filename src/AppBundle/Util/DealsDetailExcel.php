<?php

namespace AppBundle\Util;

use AppBundle\Entity\Deal;
use gbenitez\Bundle\AttributeBundle\Entity\Attribute;
use gbenitez\Bundle\AttributeBundle\Entity\Repository\AttributeRepository;
use gbenitez\Bundle\AttributeBundle\Model\Region\AttributeRegionResolver;
use gbenitez\Bundle\AttributeBundle\Util\AttributeValueArrayExtractor;
use PHPExcel;
use PHPExcel_IOFactory;
use Symfony\Component\Translation\TranslatorInterface;


class DealsDetailExcel
{
    /**
     * @var \PHPExcel
     **/
    private $phpExcel;
    /**
     * @var AttributesManager
     */
    private $attributesManager;
    /**
     * @var AttributeRegionResolver
     */
    private $regionResolver;
    /**
     * @var AttributeValueArrayExtractor
     */
    private $arrayExtractor;

    private $attributesByRegion = [];
    /**
     * @var TranslatorInterface
     */
    private $translator;

    public function __construct(
        AttributesManager $attributesManager,
        AttributeRegionResolver $regionResolver,
        AttributeValueArrayExtractor $arrayExtractor,
        TranslatorInterface $translator
    ) {
        $this->phpExcel = new PHPExcel();
        $this->attributesManager = $attributesManager;
        $this->regionResolver = $regionResolver;
        $this->arrayExtractor = $arrayExtractor;
        $this->translator = $translator;
    }

    public function download($deals)
    {
        $this->phpExcel->setActiveSheetIndex(0);
        $sheet = $this->phpExcel->getActiveSheet();
        $this->loadAttributesByRegion();

        $this->addHeaders($sheet);

        $this->addContent($sheet, $deals);
        $this->addBorderStyle($sheet);

        // Redirect output to a client’s web browser
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="deals.xlsx"');
        header('Cache-Control: max-age=0');
        // If you're serving to IE 9, then the following may be needed
        header('Cache-Control: max-age=1');

        $objWriter = PHPExcel_IOFactory::createWriter($this->phpExcel, 'Excel2007');
        $objWriter->save('php://output');

        exit;
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $dimension
     * @param $width
     */
    private function setColumnWidth(\PHPExcel_Worksheet $sheet, $col, $width)
    {
        $sheet->getColumnDimensionByColumn($col)->setWidth($width);

        return $this;
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $cell
     * @param $value
     * @return \PHPExcel_Cell|\PHPExcel_Worksheet
     */
    private function setValue(\PHPExcel_Worksheet $sheet, $cell, $value)
    {
        $sheet->setCellValue($cell, $value);

        return $this;
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $col
     * @param $row
     * @param $value
     * @return $this
     */
    private function setColRowValue(\PHPExcel_Worksheet $sheet, $col, $row, $value)
    {
        $sheet->setCellValueByColumnAndRow($col, $row, $value);

        return $this;
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $col
     * @param $row
     * @param $value
     * @param null $width
     * @return $this
     */
    private function setHeaderValue(\PHPExcel_Worksheet $sheet, $col, $row, $value, $width = null)
    {
        $this->setColRowValue($sheet, $col, $row, $value);

        if (null !== $width) {
            $this->setColumnWidth($sheet, $col, $width);
        }

        return $this;
    }

    /**
     * @param $sheet
     */
    private function addHeaders(\PHPExcel_Worksheet $sheet)
    {
        $projectFirstCol = $col = $this->addProspectusHeaders($sheet);
        $sheet->mergeCellsByColumnAndRow(0, 1, $col - 1, 1);

        $col = $this->addProjectHeaders($sheet, $col);
        $col = $this->addProductHeaders($sheet, $col);
        $sheet->mergeCellsByColumnAndRow($projectFirstCol, 1, $col, 1);

        $this->addHeaderStyles($sheet, 0, $col - 1);
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $col
     * @param $row
     * @param $attributes
     * @return string Columna en la que se debe continuar agregando headers
     */
    private function addAttributeHeaders(\PHPExcel_Worksheet $sheet, &$col, $row, $regions)
    {
        foreach ((array)$regions as $region) {
            if (!isset($this->attributesByRegion[$region])) {
                continue;
            }

            /** @var Attribute $attribute */
            foreach ($this->attributesByRegion[$region] as $attribute) {
                $this->setColRowValue($sheet, $col, $row, $attribute->getPresentation());
                $this->setColumnWidth($sheet, $col++, 30);
            }
        }
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $attributes
     * @return int
     */
    private function addProspectusHeaders(\PHPExcel_Worksheet $sheet)
    {
        $this->setValue($sheet, 'A1', 'Información del Prospecto');
        $col = 0;

        $this->addAttributeHeaders($sheet, $col, 2, 'deal_prospectus:before');

        $this->setHeaderValue($sheet, $col++, 2, 'Nombre de la Empresa', 35);
        $this->setHeaderValue($sheet, $col++, 2, 'Dirección', 40);
        $this->setHeaderValue($sheet, $col++, 2, 'País', 20);
        $this->setHeaderValue($sheet, $col++, 2, 'Estado', 35);
        $this->setHeaderValue($sheet, $col++, 2, 'Ciudad', 35);
        $this->setHeaderValue($sheet, $col++, 2, 'Código de área', 20);

        $this->addAttributeHeaders($sheet, $col, 2,
            ['deal_prospectus zipCode:after', 'deal_prospectus contact:before']
        );

        $this->setHeaderValue($sheet, $col++, 2, 'Website', 25);
        $this->setHeaderValue($sheet, $col++, 2, 'Nombre del Contacto', 30);
        $this->setHeaderValue($sheet, $col++, 2, 'Apellido del Contacto', 30);
        $this->setHeaderValue($sheet, $col++, 2, 'Cargo del Contacto', 30);
        $this->setHeaderValue($sheet, $col++, 2, 'Email del Contacto', 30);

        $this->addAttributeHeaders($sheet, $col, 2, 'deal_prospectus contact:after');

        $this->setHeaderValue($sheet, $col++, 2, 'Teléfono', 35);

        $this->addAttributeHeaders($sheet, $col, 2, 'deal_prospectus:after');

        return $col;
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $attributes
     * @param $col
     */
    private function addProjectHeaders(\PHPExcel_Worksheet $sheet, $col)
    {
        $this->setValue($sheet, 'M1', 'Información de la Oportunidad');

        $this->addAttributeHeaders($sheet, $col, 2, 'deal_project:before');

        $this->setHeaderValue($sheet, $col++, 2, 'Nombre del Proyecto', 40);
        $this->setHeaderValue($sheet, $col++, 2, 'Descripción del Proyecto', 45);

        $this->addAttributeHeaders($sheet, $col, 2, ['deal_project description:after', 'deal_project reason:before']);

        $this->setHeaderValue($sheet, $col++, 2, 'Razón del Proyecto', 20);
        $this->setHeaderValue($sheet, $col++, 2, 'Estatus del Proyecto', 35);

        $this->addAttributeHeaders($sheet, $col, 2, ['deal_project status:after', 'deal_project date_end:before']);

        $this->setHeaderValue($sheet, $col++, 2, 'Tiempo estimado de cierre', 35);

        $this->addAttributeHeaders($sheet, $col, 2, 'deal_project:after');

        return $col;
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $attributes
     * @param $col
     * @return mixed
     */
    private function addProductHeaders(\PHPExcel_Worksheet $sheet, $col)
    {
        $this->addAttributeHeaders($sheet, $col, 2, ['deal_product:before', 'deal_product summatory']);
        $this->setHeaderValue($sheet, $col++, 2, 'Total de la oportunidad en US$', 30);
        $this->addAttributeHeaders($sheet, $col, 2, 'deal_product:after');

        return $col;
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param Attribute[] $attributes
     * @param Deal[] $deals
     */
    private function addContent(\PHPExcel_Worksheet $sheet, $deals)
    {
        $row = 3;
        /** @var Deal $deal */
        foreach ($deals as $deal) {
            $col = 0;
            $dealAttributeValues = $this->arrayExtractor->toArray($deal->getAttributesWithChildren(), 'export');

            $this->addProspectusContent($sheet, $col, $row, $deal, $dealAttributeValues);
            $this->addProjectContent($sheet, $col, $row, $deal, $dealAttributeValues);
            $this->addProductContent($sheet, $col, $row, $deal, $dealAttributeValues);

            $row++;
        }
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $regionName
     * @param $col
     * @param $row
     * @param $dealAttributeValues
     */
    private function addAttributeValuesContent(\PHPExcel_Worksheet $sheet, $regions, &$col, $row, $dealAttributeValues)
    {
        foreach ((array)$regions as $region) {
            if (!isset($this->attributesByRegion[$region])) {
                continue;
            }

            foreach ($this->attributesByRegion[$region] as $id => $label) {
                $this->setColRowValue(
                    $sheet,
                    $col++,
                    $row,
                    array_key_exists($id, $dealAttributeValues) ? $dealAttributeValues[$id] : null
                );
            }
        }
    }

    private function loadAttributesByRegion()
    {
        $this->attributesByRegion = [];

        foreach ($this->attributesManager->getDealAttributes() as $attribute) {
            $region = $attribute->getRegion()->getName();
            $this->attributesByRegion[$region][$attribute->getId()] = $attribute;
        }
    }

    /**
     * Añade la información del prospecto (junto con los atributos) al excel en la fila indicada
     * @param \PHPExcel_Worksheet $sheet
     * @param $col
     * @param $row
     * @param $deal
     * @param $attributeValues
     */
    private function addProspectusContent(\PHPExcel_Worksheet $sheet, &$col, $row, $deal, $attributeValues)
    {
        $prospectus = $deal->getProspectus();
        $this->addAttributeValuesContent($sheet, 'deal_prospectus:before', $col, $row, $attributeValues);

        $this->setColRowValue($sheet, $col++, $row, $prospectus->getName());
        $this->setColRowValue($sheet, $col++, $row, $prospectus->getAddress());
        $this->setColRowValue($sheet, $col++, $row, $prospectus->getCountry()->getName());
        $this->setColRowValue($sheet, $col++, $row, $prospectus->getState()->getName());
        $this->setColRowValue($sheet, $col++, $row, $prospectus->getCity()->getName());
        $this->setColRowValue($sheet, $col++, $row, $prospectus->getZipCode());

        $regions = ['deal_prospectus zipCode:after', 'deal_prospectus contact:before'];
        $this->addAttributeValuesContent($sheet, $regions, $col, $row, $attributeValues);

        $this->setColRowValue($sheet, $col++, $row, $prospectus->getWebsite());
        $this->setColRowValue($sheet, $col++, $row, $prospectus->getContact()->getFirstName());
        $this->setColRowValue($sheet, $col++, $row, $prospectus->getContact()->getLastName());
        $this->setColRowValue($sheet, $col++, $row, $prospectus->getContact()->getPosition());
        $this->setColRowValue($sheet, $col++, $row, $prospectus->getContact()->getEmail());;

        $this->addAttributeValuesContent($sheet, 'deal_prospectus contact:after', $col, $row, $attributeValues);

        $phone = '('.$deal->getProspectus()->getContact()->getPhone()->getType().') '.
            $deal->getProspectus()->getContact()->getPhone()->getCountryCode().' '.
            $deal->getProspectus()->getContact()->getPhone()->getAreaCode().' '.
            $deal->getProspectus()->getContact()->getPhone()->getPhoneNumber();

        $this->setColRowValue($sheet, $col++, $row, $phone);

        $this->addAttributeValuesContent($sheet, 'deal_prospectus:after', $col, $row, $attributeValues);
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $row
     * @param $deal
     * @return array
     */
    private function addProjectContent(\PHPExcel_Worksheet $sheet, &$col, $row, Deal $deal, $attributeValues)
    {
        $project = $deal->getProject();
        $this->addAttributeValuesContent($sheet, 'deal_project:before', $col, $row, $attributeValues);

        $this->setColRowValue($sheet, $col++, $row, $project->getName());
        $this->setColRowValue($sheet, $col++, $row, $project->getDescription());

        $regions = ['deal_project description:after', 'deal_project reason:before'];
        $this->addAttributeValuesContent($sheet, $regions, $col, $row, $attributeValues);

        $this->setColRowValue($sheet, $col++, $row, $project->getReason());

        $regions = ['deal_project reason:after', 'deal_project status:before'];
        $this->addAttributeValuesContent($sheet, $regions, $col, $row, $attributeValues);

        $this->setColRowValue($sheet, $col++, $row, $this->translator->trans($project->getStatus()));

        $regions = ['deal_project status:after', 'deal_project date_end:before'];
        $this->addAttributeValuesContent($sheet, $regions, $col, $row, $attributeValues);

        $this->setColRowValue($sheet, $col++, $row, $deal->getDateEnd());

        $this->addAttributeValuesContent($sheet, 'deal_project:after', $col, $row, $attributeValues);
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $col
     * @param $row
     * @param Deal $deal
     * @param $attributeValues
     */
    private function addProductContent(\PHPExcel_Worksheet $sheet, &$col, $row, Deal $deal, $attributeValues)
    {
        $regions = ['deal_product:before', 'deal_product summatory'];
        $this->addAttributeValuesContent($sheet, $regions, $col, $row, $attributeValues);

        $this->setColRowValue($sheet, $col++, $row, $deal->getTotalUsd().' $');

        $this->addAttributeValuesContent($sheet, 'deal_product:after', $col, $row, $attributeValues);
    }

    private function addBorderStyle(\PHPExcel_Worksheet $sheet)
    {
        $styleBorders = array(
            'borders' => array(
                'allborders' => array(
                    'style' => \PHPExcel_Style_Border::BORDER_DOUBLE,
                    'color' => array('rgb' => 'F9F9F9'),
                ),
            ),
        );

        $sheet->getStyle(
            'A1:'.$sheet->getHighestColumn().$sheet->getHighestRow()
        )->applyFromArray($styleBorders);
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $beginCol
     * @param $endCol
     * @param $row
     * @throws \PHPExcel_Exception
     */
    private function addHeaderStyles(\PHPExcel_Worksheet $sheet, $beginCol, $endCol)
    {
        $sheet->getRowDimension(1)->setRowHeight(27);
        $sheet->getRowDimension(2)->setRowHeight(27);

        $headerStyles = array(
            'alignment' => array(
                'horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => \PHPExcel_Style_Alignment::VERTICAL_CENTER,
            ),
        );

        $subHeaderStyles = array(
            'alignment' => array(
                'horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => \PHPExcel_Style_Alignment::VERTICAL_CENTER,
            ),
            'fill' => array(
                'type' => \PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb' => 'A9A9A9'),
            ),
        );

        $sheet->getStyleByColumnAndRow($beginCol, 1, $endCol, 1)->applyFromArray($headerStyles);

        $sheet->getStyleByColumnAndRow($beginCol, 2, $endCol, 2)->applyFromArray($subHeaderStyles);
    }
}
