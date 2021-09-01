<!DOCTYPE html>
<html lang="en">
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <title>Where Where | Recherche </title>
      <!-- css here -->
      <link rel="stylesheet" href="<?php echo  site_url('assets/css/bootstrap.min.css');?>">
      <link rel="stylesheet" href="<?php echo site_url('assets/css/owl.carousel.min.css');?>">
      <link rel="stylesheet" href="<?php echo site_url('assets/css/slicknav.css');?>">
      <link rel="stylesheet" href="<?php echo site_url('assets/css/flaticon.css');?>">
      <link rel="stylesheet" href="<?php echo site_url('assets/css/animate.min.css');?>">
      <link rel="stylesheet" href="<?php echo site_url('assets/css/magnific-popup.css');?>">
      <link rel="stylesheet" href="<?php echo site_url('assets/css/fontawesome-all.min.css');?>">
      <link rel="stylesheet" href="<?php echo site_url('assets/css/themify-icons.css');?>">
      <link rel="stylesheet" href="<?php echo site_url('assets/css/slick.css');?>">
      <link rel="stylesheet" href="<?php echo site_url('assets/css/nice-select.css');?>">
      <link rel="stylesheet" href="<?php echo site_url('assets/css/style.css');?>">

</head>
<body>
      <div class="row m-4">
            <div class="col-md-12">
            <form>
                  <div class="form-row">
                        <div class="col-md-3">
                              <label class="my-1 mr-2" for="findme">Nom Hotel</label>
                              <input type="text" class="form-control" id="findme" placeholder="Hotel">
                        </div>
                        <div class="col-md-3">
                              <label class="my-1 mr-2" for="classe">Classe</label>
                              <select class="custom-select mr-sm-2" id="classe">
                                    <option selected>Choose...</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                              </select>                        
                        </div>
                        <div class="col-md-3">
                              <label class="my-1 mr-2" for="Province">Province</label>
                              <select class="custom-select mr-sm-2" id="Province">
                                    <option selected>Choose...</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                              </select>                        
                        </div>
                        <div class="col-md-3">
                              <label class="my-1 mr-2" for="localisation">Localisation</label>
                              <select class="custom-select mr-sm-2" id="localisation">
                                    <option selected>Choose...</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                              </select>                        
                        </div>
                        <div class="col-md-6">
                              <label class="my-1 mr-2" for="ex2">Prix min:</label>
                              <input id="ex2" type="range"  value="" data-min="0" data-max="1000" data-step="5" data-value="[0,1000]"/>
                              <input id="ex2" type="range"  value="" data-min="0" data-max="1000" data-step="5" data-value="[0,1000]"/>                         
                        </div>

                  </div>
            </form>
            </div>
      </div>
</body>
</html>