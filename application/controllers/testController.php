<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class testController extends CI_Controller{
    function test(){
        $this->load->model('lieuModel');
        $data = array();
        $data['valiny'] = $this->lieuModel->troisLieuProv(1);
        var_dump($data['valiny']);
    }
    
}