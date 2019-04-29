<?php

namespace AppBundle\Deal\Util;
ini_set('memory_limit', '-1');
set_time_limit(0);
use AppBundle\Entity\Deal;

class GenerateExcelReport
{
    /**
     * @param  $invoices
     * @return null|string
     */
    public function generateExcel($invoices)
    {
        $excel = array();
        $contador =0;
        foreach($invoices as $invoice){
            $excel[$contador]['b1'] = $invoice['correlative'];
            $excel[$contador]['c1'] = $invoice['companyName'];
            $excel[$contador]['d1'] = $invoice['companyType'];
            $excel[$contador]['e1'] = $invoice['invoiceNumber'];
            $excel[$contador]['f1'] = $invoice['purchaseInvoiceDate'];
            $excel[$contador]['g1'] = $invoice['created'];
            $excel[$contador]['h1'] = $invoice['disti'];
            $excel[$contador]['i1'] = $invoice['name'];
            $excel[$contador]['j1'] = $invoice['procesadores'];
            $excel[$contador]['k1'] = $invoice['winPro'];
            $excel[$contador]['l1'] = $invoice['totalUnits'];
            $excel[$contador]['m1'] = $invoice['totalQuantity'];
            $excel[$contador]['n1'] = $invoice['userName'];
            $excel[$contador]['o1'] = $invoice['email'];
            $excel[$contador]['p1'] = !empty($invoice['factura'])?$invoice['factura']:'';
            $contador++;
        }
        $keys = array(  'b1'=>'ID',
                        'c1'=>'Nombre de la Compañía',
                        'd1'=>'Tipo de Compañía',
                        'e1'=>'No de Factura',
                        'f1'=>'Fecha de la Factura',
                        'g1'=>'Fecha de Carga Factura',
                        'h1'=>'Compro a:',
                        'i1'=>'Categoría de Producto',
                        'j1'=>'Procesadores',
                        'k1'=>'Windows Pro',
                        'l1'=>'Unidades de la Factura',
                        'm1'=>'Total de Factura',
                        'n1'=>'Usuario',
                        'o1'=>'Email',
                        'p1'=>'Archivo');

        $response= array();
        $response['data']=$excel;
        $response['key']=$keys;

        return $response;
    }

}