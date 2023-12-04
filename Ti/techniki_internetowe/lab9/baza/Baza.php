<?php
  
namespace baza;
  
use appl\ { View, Controller };

class Baza extends Controller {
  
   protected $layout ;
   protected $model ;
  
   function __construct(){
      parent::__construct();
      $this->layout = new View('main');
      $this->layout->css = $this->css;
      $this->layout->title  = 'Baza danych SQL';
      $this->layout->menu = $this->menu;
      $this->model  = new Model();
   }
  
  
   function listAll(){     
      $this->layout->header = 'Lista wszystkich rekordow';
      $this->view = new View('listAll');
      $this->view->data = $this->model->listAll();
      $this->layout->content = $this->view; 
      return $this->layout;
   }
      
    function insertRec(){
      $this->layout->header = 'Wprowadzanie danych do bazy';
      $this->view = new View('form');
      $this->layout->content = $this->view;
      return $this->layout;
   }
  
   function saveRec(){
      $data = $_POST['data'];
      $obj  = json_decode($data);
      if (isset($obj->fname) and isset($obj->lname) and isset($obj->city)){      
         $response = $this->model->saveRec($obj);
      }
      return ( $response ? "Dodano rekord" : "Blad " );
   }
  
   function info ($text){
      $this->layout->content = $text;
      return $this->layout; 
   }
  
   function search(){
      $this->layout->header = 'Wyszukiwanie danych w bazie';
      $this->view = new View('search');
      $this->layout->content = $this->view;
      return $this->layout;
   }

   function searchRec(){
      $data = $_POST['data'];
      $obj  = json_decode($data);
      if (isset($obj->lname)){     
         $this->layout = new View('found');
         $this->layout->header = 'Lista znalezionych rekordow';
         $response = $this->model->search($obj);
         if($response)
         {
            $this->view = new View('listAll');
            $this->view->data = $response;
         }
         else{
            $this->view= '<p>Nie znaleziono rekordow </p>';
         }
         $this->layout->content = $this->view; 
         return $this->layout; 
      }
   }

   function index(){
      return $this->layout;
   }
  
} 
  
?>