<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Directory HTML-5 Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="<?php echo site_url('assets/img/favicon.ico');?>">

		<!-- CSS here -->
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
     <header>
         </header>
        <div class="popular-location section-padding80">
            <div class="container">
                <div class="row">
                    <!--<div class="col-lg-12">-->
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-30" style="margin-left: 26%;" >
                            <span>Most visited places</span>
                            <h2>HOTEL ET RESERVATION</h2>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                <?php foreach($allprovince as $key => $province){ ?>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        
                            <div class="single-location mb-30">
                                <div class="location-img">
                                    <img src="<?php echo site_url('assets/img/gallery/location1.png');?>" alt="">
                                </div>
                                <div class="location-details">
                                    <p><?php echo $province['nomProvince']; ?></p>
                                    <a href="#" class="location-btn">65 <i class="ti-plus"></i> Location</a>
                                </div>
                               
                            </div>
                        
                    </div>
                    <?php } ?>
                </div>
                
                <!-- More Btn -->
                
            </div>
        </div>
        

    </main>
    
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>


    <!-- JS here -->
		<!-- All JS Custom Plugins Link Here here -->
        <script src="<?php echo site_url('assets/js/vendor/modernizr-3.5.0.min.js');?>"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="<?php echo site_url('assets/js/vendor/jquery-1.12.4.min.js');?>"></script>
        <script src="<?php echo site_url('assets/js/popper.min.js');?>"></script>
        <script src="<?php echo site_url('assets/js/bootstrap.min.js');?>"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="<?php echo site_url('assets/js/jquery.slicknav.min.js');?>"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="<?php echo site_url('assets/js/owl.carousel.min.js');?>"></script>
        <script src="<?php echo site_url('assets/js/slick.min.js');?>"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="<?php echo site_url('assets/js/wow.min.js');?>"></script>
		<script src="<?php echo site_url('assets/js/animated.headline.js');?>"></script>
        <script src="<?php echo site_url('assets/js/jquery.magnific-popup.js');?>"></script>

		<!-- Nice-select, sticky -->
        <script src="<?php echo site_url('assets/js/jquery.nice-select.min.js');?>"></script>
		<script src="<?php echo site_url('assets/js/jquery.sticky.js');?>"></script>
        
        <!-- contact js -->
        <script src="<?php echo site_url('assets/js/contact.js');?>"></script>
        <script src="<?php echo site_url('assets/js/jquery.form.js');?>"></script>
        <script src="<?php echo site_url('assets/js/jquery.validate.min.js');?>"></script>
        <script src="<?php echo site_url('assets/js/mail-script.js');?>"></script>
        <script src="<?php echo site_url('assets/js/jquery.ajaxchimp.min.js');?>"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="<?php echo site_url('assets/js/plugins.js');?>"></script>
        <script src="<?php echo site_url('assets/js/main.js');?>"></script>
        
    </body>
</html>