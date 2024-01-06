<?php
   namespace src;
   use PDO;
   use src\modell\Register;

   class Model {  
      static $dsn = 'sqlite:src/modell/baza.db';
      protected static $db;

      //Konstruktor klasy Model - inicjalizacja połączenia z bazą danych
      function __construct(){
         $data = explode(':',self::$dsn);
         if (!file_exists($data[1])){ 
            throw new Exception ( "Database file doesn't exist." );  
         }
         self::$db = new PDO ( self::$dsn );
         self::$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      }
   }
?>
