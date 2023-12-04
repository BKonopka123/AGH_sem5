<?php
  
namespace info ;
  
class Model 
{
  
   private $table = array() ;
  
   function __construct() {
      $this->table['main'] = '/ , /index.php, /index.php?sub=Info, /index.php?sub=Info&action=main' ;
      $this->table['info'] = '/index.php?sub=Info&action=help' ;
      $this->table['list'] = '/index.php?sub=Baza, /index.php?sub=Baza&action=list' ;
      $this->table['form'] = '/index.php?sub=Baza&action=form' ;      
   }
  
   function getTable() {
     // return 'test - table' ;
     // print 'xxx' ;
     // print_r($table) ;
     return $this->table ;
   }
  
}
  
?>