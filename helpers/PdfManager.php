<?php

require_once 'dependencies/dompdf/autoload.inc.php';
use Dompdf\Dompdf;

class PdfManager
{
    public function __construct()
    {

    }

    public function createPdf($usuarioId, $ediciones, $esDescarga)
    {
        $html = "<h4 style='text-align:center;'>Mis Ediciones</h4>";
        $html .= "<table border='1' width='100%' style='border-collapse: collapse;'>
                    <tr>
                        <th>Id Edición</th>
                        <th>Fecha</th>
                        <th>Producto</th>
                        <th>Edicion</th>
                        
                    </tr>";

        for($i = 0; $i < sizeof($ediciones); $i++){
            $html .=
                    "<tr>
                        <td>".$ediciones[$i]['id_edicion']."</td>
                        <td>".$ediciones[$i]['fecha']."</td>
                        <td>".$ediciones[$i]['nombre']."</td>
                        <td>".$ediciones[$i]['evento']."</td>
                    </tr>";
        }

        $html .= "</table>";

        $filename = "MisEdiciones";

        //try {

        $dompdf = new Dompdf();
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'landscape');
        $dompdf->render();
        if($esDescarga === true){
            $dompdf->stream($filename,array("Attachment"=>1));
        } else {
            $dompdf->stream($filename,array("Attachment"=>0));
        }

        //}catch (Exception $e){var_dump($e->getMessage());}
        //$dompdf->stream($filename);


    }

}