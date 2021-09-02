<?php if(! defined('BASEPATH')) exit('No direct script access allowed');
    class lieuModel extends CI_Model{
        //tous les lieux
        public function all(){
            $query= $this->db->query('SELECT * FROM lieu')->result_array();
            return  $query;
        }

        //liste lieu ao @province iray
        public function lieuProvince($id_province){
            $req = 'SELECT * FROM lieuProvLocal WHERE idProvince = %s';
            $req = sprintf($req, $id_province);
            $result= $this->db->query($req)->result_array();
            return $result;
        }

        //maka donne @lieu iray
        public function oneLieu($id_lieu){
            $req = 'SELECT * FROM lieuProvLocal WHERE idLieu = %s';
            $req = sprintf($req, $id_lieu);
            $result= $this->db->query($req)->result_array();
            return $result;
        }

        //maka lieu 3 voalahany @province
        public function troisLieuProv($id_province){
            $req = 'SELECT * FROM lieuProvLocal WHERE idProvince = %s LIMIT 3';
            $req = sprintf($req, $id_province);
            $result= $this->db->query($req)->result_array();
            return $result;
        }
        
    }
