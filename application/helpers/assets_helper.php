<?php

    defined('BASEPATH') OR exit('No direct script access allowed');
    if ( ! function_exists('css_url')){
        function css_url($lien){
            return site_url("assets/css/".$lien);
        }
    }

    if ( ! function_exists('image_url')){
        function image_url($lien){
            return site_url("assets/images/".$lien);
        }
    }
    
    if ( ! function_exists('js_url')){
        function js_url($lien){
            return site_url("assets/js/".$lien);
        }
    }
?>     