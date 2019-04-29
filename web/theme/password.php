<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Toshiba - Password</title>
    <link href="_default/css/open-sans.css" rel="stylesheet">
    <link href="_default/css/style.css" rel="stylesheet">
    <link href="_default/css/bootstrap.min.css" rel="stylesheet">
    <link href="_default/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script type="text/javascript">
      var verifyCallback = function(response) {
        alert(response);
      };
      var widgetId1;
      var onloadCallback = function() {
        widgetId1 = grecaptcha.render('example1', {
          'sitekey' : 'your_site_key',
          'theme' : 'light'
        });
      };
    </script>
  </head>
  <body>
    <header>
      <div class="container-fluid bg-black">
        <div class="container">
         <div class="row">
          <div class="col-md-12 padding-0-xs">
            <a href="#"><img src="_default/images/logo-partner.png" alt="Logo Partner" class="partner"></a>
            <div class="logo-toshiba hidden-xs">
              <img src="_default/images/logo-toshiba.png" alt="logo Toshiba">
            </div>
            <div class="visible-xs logo-toshiba-xs">
              <img src="_default/images/logo-toshiba.png" width="100" alt="Logo Toshiba">
            </div>
          </div>
         </div>
        </div>
      </div>
      <div class="container-fluid bg-top-2">
        <div class="container">
          <div class="bg-top-1">
            <span class="title-top">Actualización de contraseña</span>
          </div>
        </div><!--container-->
      </div><!--container-fluid-->
    </header>
    <div class="container margin-top-35">
     <div class="row">
     <div class="col-md-12">
      <form class="form-loyalty" action="javascript:alert(grecaptcha.getResponse(widgetId1));">
        <fieldset>
          <legend class="title-form">Por favor, introduzca su email y el código de validación a continuación</legend>
          <div class="col-sm-6 padding-0">
            <div class="form-group">
              <label for="email">Correo Electrónico</label>
              <input type="email" class="form-control" id="email" placeholder="Correo Electrónico"/>
             </div>
             <div class="form-group">
              <label for="email">Código de validación</label>
              <div id="example1" class="g-recaptcha" data-sitekey="6Lf1PwsTAAAAAJsgA_fEjrwBig_9Buw28Rnar2BM"></div>
            </div>
            <a href="#" class="btn btn-default">Cancelar</a>
          	<button type="submit" class="btn btn-primary">Siguiente</button>
          </div>
        </fieldset>
      </form>
     </div>
     </div>
    </div><!-- container-->
    <footer class="toshiba-footer">
      <div class="container">
        <div class="row">
          <div class="margin-label col-md-10">
            <a href="#">Contáctenos</a> &nbsp;|&nbsp; <br class="visible-xs"/>
            <a href="#">Preguntas Frecuentes</a> &nbsp;|&nbsp; <br class="visible-xs"/>
            <a href="#">Reglas de Premios</a> &nbsp;|&nbsp; <br class="visible-xs"/>
            <a href="#">Términos de Uso</a> &nbsp;|&nbsp; <br class="visible-xs"/>
            <a href="#">Declaración de Privacidad</a> &nbsp;|&nbsp; <br class="visible-xs"/>
            <a href="#">Acerca del Programa</a><br class="visible-xs"/>
          <br />&#169; 2015 Toshiba America Information Systems, Inc (TAIS). All Rights Reserved.
          </div>
          <div class="margin-label col-md-1">
            <a target="_blank" href="http://optimeconsulting.com/"><img src="_default/images/powered-optime.png" alt="Powered Optime"></a>
          </div>
         </div>
      </div><!-- container-->
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="_default/js/bootstrap.min.js"></script>
  </body>
</html>