<?php
    namespace src;
    
    abstract class Controller{
        protected $css; 
        protected $js;
        
        //Konstruktor klasy Controller
        function __construct(){
            $this->css = "<link rel=\"stylesheet\" href=\"src/view/css/style.css\" type=\"text/css\" media=\"screen\">";
            $this->js = "<script src=\"src/controller/js/script.js\"></script>";
        }
        
        //Metoda wyświetlająca stronę 404
        static function http404(){
            header('HTTP/1.1 404 Not Found');
            print '<!doctype html><html><head><title>404 Not Found</title></head><body><p>Invalid URL</p></body></html>';
            exit;
        }
        
        //Metoda wyświetlająca stronę 403
        function __call($name, $arguments){
            self::http404();
        }
    }
?>
