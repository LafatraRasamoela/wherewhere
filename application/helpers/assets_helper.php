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
/*---------------------------------------- */
    if ( ! function_exists('css_url3')){
        function css_url3($lien){
            return site_url("assets3/css/".$lien);
        }
    }

    if ( ! function_exists('img_url3')){
        function img_url3($lien){
            return site_url("assets3/img/".$lien);
        }
    }

    if ( ! function_exists('js_url3')){
        function js_url3($lien){
            return site_url("assets3/js/".$lien);
        }
    }
?>     