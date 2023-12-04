<?php
  
namespace info;
  
use appl\ { View, Controller };
  
class Info extends Controller {
  
    protected $layout;
    protected $model;
  
    function __construct(){
        parent::__construct();
        $this->layout = new View('main');   
        $this->layout->css = $this->css; 
        $this->layout->menu = $this->menu;
        $this->layout->title = 'Simple MVC' ;
    }
  
    function index(){
        $this->layout->header  = 'Simple MVC';
        $this->layout->content = 'Template - test !';
        return $this->layout;
    }
  
    function help(){
        $this->model = new Model();
        $this->layout->header  = 'Simple MVC';
        $this->view = new View('table');
        $this->view->data = $this->model->getTable();
        $this->layout->content = $this->view;
        return $this->layout;
    }
  
    function error( $text ){
        $this->layout->content = $text;
        return $this->layout;       
    }
}
  
?>
