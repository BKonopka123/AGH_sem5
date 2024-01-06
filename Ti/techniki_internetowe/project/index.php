<?php

    // Autoloader
    function my_autoloader($class_name){
        $path_to_class = __DIR__. '/' . str_replace('\\', DIRECTORY_SEPARATOR, $class_name) . '.php';
        if ( file_exists($path_to_class) )  
            { require_once($path_to_class); }
        else {
            header('HTTP/1.1 404 Not Found') ;
            print '<!doctype html><html><head><title>404 Not Found</title></head><body><p>Invalid URL bbb</p></body></html>' ;
        }   
    }
    spl_autoload_register('my_autoloader');

    use src\controller\Info;

    // Routing
    try{
        if(empty ($_GET['action'])){ 
            $action = 'index'; 
        }
        else{ 
            $action = $_GET['action']; 
        } 
        $contr = "src\\controller\\Info";
        $controller = new $contr;
        echo $controller->$action();
    }
    catch (Exception $e){
        echo 'Error: [' . $e->getCode() . '] ' . $e->getMessage() ;
    }
?>