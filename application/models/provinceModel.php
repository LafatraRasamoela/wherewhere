<?php if(! defined('BASEPATH')) exit('No direct script access allowed');
    class provinceModel extends CI_Model{

        function getProvince(){
            $req = $this->db->get('province');
            return $req->result_array();
        }

        // function getModel(){
        //     $query = $this->db->query('SELECT * FROM province');
        //     $tab = array();
        //     foreach($query->result_array() as $row){
        //         $prov = new provinceModel();
        //         $prov -> setIdProvince($row['idProvince']);
        //         $prov -> setNomProvince($row['nomProvince']);
        //         $prov -> setImageProvince($row['imageProvince']);
        //         $tab[] = $prov; 
        //     }
        //     return $tab;
        // }


        // public function getIdProvince()
        // {
        //     return $this->idProvince;
        // }
        // public function setIdProvince($id)
        // {
        //     $this->idProvince = $id;
        //     return $this;
        // }
        // public function getNomProvince()
        // {
        //     return $this->nomProvince;
        // }
        // public function setNomProvince($nom)
        // {
        //     $this->nomProvince = $nom;
        //     return $this;
        // }
        // public function getImageProvince()
        // {
        //     return $this->imageProvince;
        // }
        // public function setImageProvince($image)
        // {
        //     $this->imageProvince = $image;
        //     return $this;
        // }
    }
?>