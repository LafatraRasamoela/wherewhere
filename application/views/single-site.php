<!DOCTYPE html>
<html lang="en">

<head>
  <!-- basic -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- mobile metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1">

  <title>single site</title>

  <link rel="stylesheet" href="<?php echo site_url('assets/css/bootstrap.min.css'); ?>">
  <!-- style css -->
  <link rel="stylesheet" href="<?php echo site_url('assets/css/styleSite.css');?>">

</head>
<!-- body -->

<body class="main-layout">

<!-- vegetable -->
<div id="vegetable" class="vegetable">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div  class="titlepage">
          <h2> DETAILS <strong class="llow">SITE</strong> </h2>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xl-5 col-lg-5 col-md-5 col-sm-12 ">
        <div class="vegetable_shop">
          <h3>Best Site Touristique</h3>
          <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages andIt is a long established fact that a reader will be distracted </p>
        </div>
      </div>
       <div class="col-xl-7 col-lg-7 col-md-7 col-sm-12 ">
        <div class="vegetable_img">
         <figure><div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="<?php echo site_url('assets/img/gallery/v1.jpg');?>" style="width:150%">
  
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="<?php echo site_url('assets/img/gallery/v3.jpg');?>" style="width:150%">
 
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="<?php echo site_url('assets/img/gallery/v4.jpg');?>" style="width:150%">
 
</div>

</div></figure>        </div>
      </div>
<br><br><br><br>

<br>

<div style="text-align:center; display: none">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>


    </div>
  </div>
</div>
<!-- fin vegetable -->
<br><br>
<div class="container">
  

<div class="row">

   <div class = "col-md-12">
  <div class="column">
    <img src="<?php echo site_url('assets/img/gallery/v1.jpg');?>" style="width:150%" onclick="openModal();currentSlide(1)" class="hover-shadow cursor">
  </div>
  <div class="column">
    <img src="<?php echo site_url('assets/img/gallery/v2.jpg');?>" style="width:150%" onclick="openModal();currentSlide(2)" class="hover-shadow cursor">
  </div>
  <div class="column">
    <img src="<?php echo site_url('assets/img/gallery/v3.jpg');?>" style="width:150%" onclick="openModal();currentSlide(3)" class="hover-shadow cursor">
  </div>
  <div class="column">
    <img src="<?php echo site_url('assets/img/gallery/v4.jpg');?>" style="width:150%" onclick="openModal();currentSlide(4)" class="hover-shadow cursor">
  </div>

<div id="myModal" class="modal">
  <span class="close cursor" onclick="closeModal()">&times;</span>
  <div class="modal-content">

    <div class="mySlidess">
      <div class="numbertext">1 / 4</div>
      <img src="<?php echo site_url('assets/img/gallery/v1.jpg');?>" style="width:100%">
    </div>

    <div class="mySlidess">
      <div class="numbertext">2 / 4</div>
      <img src="<?php echo site_url('assets/img/gallery/v2.jpg');?>" style="width:100%">
    </div>

    <div class="mySlidess">
      <div class="numbertext">3 / 4</div>
      <img src="<?php echo site_url('assets/img/gallery/v3.jpg');?>" style="width:100%">
    </div>
    
    <div class="mySlidess">
      <div class="numbertext">4 / 4</div>
      <img src="<?php echo site_url('assets/img/gallery/v4.jpg');?>" style="width:100%">
    </div>
    


</div>
  </div>
</div>

</div>
</div>

<script>
var slideIndex = 0;
showSlidesAuto();

function showSlidesAuto() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlidesAuto, 3000); // Change image every 2 seconds
}

function openModal() {
  document.getElementById("myModal").style.display = "block";
}

function closeModal() {
  document.getElementById("myModal").style.display = "none";
}

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlidess");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>

</body>

</html>