<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>The Palatin - Hotel &amp; Resort Template</title>

    <!-- Favicon -->
    <link rel="icon" href=<?php echo img_url3("core-img/favicon.ico"); ?> >

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href= <?php echo base_url("assets3/style.css"); ?> >

</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="cssload-container">
            <div class="cssload-loading"><i></i><i></i><i></i><i></i></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="palatin-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="palatinNav">

                        <!-- Nav brand -->
                        <a href=<?php echo base_url(); ?> class="nav-brand"><img src=<?php echo img_url3("core-img/logo.png"); ?> alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="index.html">Hotel</a></li>
                                    <li><a href="index.html">Site</a></li>
                                    <li><a href="index.html">Devis</a></li>
                                    <li><a href="index.html">Rechercher</a></li>
                                    <li><a href="index.html">Profil</a></li>
                                    
                                </ul> 
                                <form class="form-inline">  
                                    <div class="form-group mx-sm-3 mb-2">
                                        <label for="inputSearch" class="sr-only">Search</label>
                                        <input type="texr" class="form-control" id="inputSearch" placeholder="Search">
                                    </div>
                                    <button type="submit" class="btn btn-outline-warning mb-2"> Search</button>
                                </form>   
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center" style="background-image: url('<?php echo img_url3("bg-img/bg-5.jpg"); ?>');">
        <div class="bradcumbContent">
            <h2><?php echo $action; ?></h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Book Now Area Start ##### -->
   
    <!-- ##### Book Now Area End ##### -->

    <!-- ##### Service Intro Area Start ##### -->
    <section class="services-intro">
        <div class="container">
           
        </div>
    </section>
    <!-- ##### Service Intro Area End ##### -->

    <!-- ##### Core Features Start ##### -->
   <?php include($page.'.php'); ?>
    <!-- ##### Core Features End ##### -->

    <!-- ##### Services Area Start ##### -->
   
    <!-- ##### Services Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row">

                <!-- Footer Widget Area -->
                <div class="col-12 col-lg-5">
                    <div class="footer-widget-area mt-50">
                        <a href="#" class="d-block mb-5"><img src=<?php echo img_url3("core-img/logo.png"); ?> alt=""></a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris sceleri sque, at rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus finibus. </p>
                    </div>
                </div>

                <!-- Footer Widget Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="footer-widget-area mt-50">
                        <h6 class="widget-title mb-5">Find us on the map</h6>
                        <img src=<?php echo img_url3("bg-img/footer-map.png"); ?> alt="">
                    </div>
                </div>

                <!-- Footer Widget Area -->
                <div class="col-12 col-md-6 col-lg-3">
                    <div class="footer-widget-area mt-50">
                        <h6 class="widget-title mb-5">Subscribe to our newsletter</h6>
                        <form action="#" method="post" class="subscribe-form">
                            <input type="email" name="subscribe-email" id="subscribeemail" placeholder="Your E-mail">
                            <button type="submit">Subscribe</button>
                        </form>
                    </div>
                </div>

                <!-- Copywrite Text -->
                <div class="col-12">
                    <div class="copywrite-text mt-30">
                        <p><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src=<?php echo js_url3("jquery/jquery-2.2.4.min.js"); ?>></script>
    <!-- Popper js -->
    <script src=<?php echo js_url3("bootstrap/popper.min.js"); ?>></script>
    <!-- Bootstrap js -->
    <script src=<?php echo js_url3("bootstrap/bootstrap.min.js"); ?>></script>
    <!-- All Plugins js -->
    <script src=<?php echo js_url3("plugins/plugins.js"); ?>></script>
    <!-- Active js -->
    <script src=<?php echo js_url3("active.js"); ?>></script>
</body>

</html>