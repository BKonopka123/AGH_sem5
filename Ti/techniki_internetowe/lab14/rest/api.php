<?php
         
require '../vendor/autoload.php' ;        
require_once("rest.php");
require_once("mongo.php");
     
class API extends REST {
     
    public $data = "";
     
    public function __construct(){
        parent::__construct();
              $this->db = new db() ;
    }
             
    public function processApi(){
        $func = "_".$this->_endpoint ; 
        if((int)method_exists($this,$func) > 0) {
            $this->$func();
              }  else {
            $this->response('Page not found',404); }         
    }
         
         
    private function _save() {
        if($this->get_request_method() != "POST") {
            $this->response('',406);
        }
        if(!empty($this->_request) ){
            try{
                $json_array = json_decode($this->_request,true);
                $res = $this->db->insert($json_array);
                if($res){
                    $result = array('return'=>'ok');
                    $this->response($this->json($result), 200);
                } 
                else{
                    $result = array('return'=>'not added');
                    $this->response($this->json($result), 200);
                }
            }catch(Exception $e){
                $this->response('', 400) ;
            }
        } 
        else{
            $error = array('status' => "Failed", "msg" => "Invalid send data");
            $this->response($this->json($error), 400);
        }
    }
 
    private function _list(){   
        if($this->get_request_method() != "GET"){
            $this->response('',406);
        }
        $result = $this->db->select() ;            
        $this->response($this->json($result), 200); 
    }
 
    private function json($data){
        if(is_array($data)){
            return json_encode($data);
        }
    }

	private function _find() {
		if($this->get_request_method() != "GET"){
            $this->response('',406);
        }
        $year = $this->_args[0];
        if(!empty($year)){
            $res = $this->db->find($year);               
            if(!empty($res)){
                $this->response($this->json($res),200);
            }     
            else{
                $failed = array('status' => "Failed", "msg" => "No records found.");
                $this->response($this->json($failed),200);
            }                   
        }
        else $this->response('',204);      
    }

    private function _stat(){
        if($this->get_request_method() != "GET"){
            $this->response('',406);
        }
        $res = $this->db->stat();               
        if(!empty($res)){
            $this->response($this->json($res),200);
        }     
        else{
            $failed = array('status' => "Failed", "msg" => "No records found.");
            $this->response($this->json($failed),200);
        }                   
    }
}
         
$api = new API;
$api->processApi();
 
?>