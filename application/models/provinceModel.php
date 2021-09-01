<?php if(! defined('BASEPATH')) exit('No direct script access allowed');
    class provinceModel extends CI_Model{

        function getProvince(){
            $req = $this->db->get('province');
            return $req->result_array();
        }
    }
?>