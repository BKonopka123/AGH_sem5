<?php
    namespace src;

    class View{

        protected $_file;
        protected $_data = array();
        
        //Konstruktor klasy View
        public function __construct($template){
            $file = 'src/view/template/'.strtolower($template).'.tpl';
            if (file_exists($file)){
                $this->_file =  $file;
            }
            else{
                throw new Exception("Template " . $file . " doesn't exist."); 
            }
        }
        
        //Metoda przypisująca wartość do zmiennej w szablonie
        public function __set($key, $value){
            $this->_data[$key] = $value;
        }
        
        //Metoda zwracająca wartość zmiennej w szablonie
        public function __get($key){
            return $this->_data[$key];
        }
        
        //Metoda wyświetlająca szablon
        public function __toString() {         
            extract($this->_data);
            ob_start();
            include($this->_file);
            $output = ob_get_contents();
            ob_end_clean();
            return $output;
        }
    }
?>