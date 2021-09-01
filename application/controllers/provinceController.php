<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
    class provinceController extends CI_Controller{
        //envoyer tout les provinces dans la page province
        function showAllProvince(){
            $this->load->model('provinceModel');
            $data['allprovince'] = $this->provinceModel->getProvince();
            //var_dump($data);
            $this->load->view('province',$data);
        }
    }
?>