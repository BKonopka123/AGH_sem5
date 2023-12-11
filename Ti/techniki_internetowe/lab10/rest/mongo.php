<?php
  
//require 'vendor/autoload.php' ;
  
class db {
    private $user = "1konopka" ;
    private $pass = "pass1konopka";
    private $host = "172.20.44.25";
    private $base = "1konopka";
    private $coll = "student";
    private $conn;
    private $dbase;
    private $collection;
  
  
  
    function __construct() {
      //$this->conn = new Mongo("mongodb://{$this->user}:{$this->pass}@{$this->host}/{$this->base}");
      $this->conn = new MongoDB\Client("mongodb://{$this->user}:{$this->pass}@{$this->host}/{$this->base}");    
      //$this->dbase = $this->conn->selectDB($this->base);
      //$this->collection = $this->dbase->selectCollection($this->coll);
      $this->collection = $this->conn->{$this->base}->{$this->coll};
    }
  
    function select() {
     $cursor = $this->collection->find(); //rezultat to tablica z całymi obiektami wraz z polem _id
        //$cursor = $this->collection->find([],['projection' => ['_id' => 0]]);//wynik obejmuje wszystkie atrybuty oprócz _id
        //$cursor = $this->collection->find(['ident'=> 1],['projection' => ['_id' => 0]]);//filtrowanie wyników prez atrybut ident o wartosci 1 wynik obejmuje wszystkie atrybuty oprócz _id
 
      $table = iterator_to_array($cursor);
      return $table ;
    }
  
    function insert($user) {
      $ret = $this->collection->insertOne($user) ;
      return $ret;
    }
  
    function update($ident,$user,$flag) {
      if ( $flag ) {
         $rec = new MongoDB\BSON\ObjectId($ident);
         $filter = array ( '_id' => $rec );
      } else {
         $filter = array ( 'ident' => (int)$ident );//gdy przejmujemy $ident z query_string mamy tekst, a w bazie danych integery
      }
      $update = array ( '$set' => $user );
      //$option = array ( 'w' => 1 );
      //$ret = $this->collection->update($filter,$update,$option);
      $updresult = $this->collection->updateOne($filter,$update);
      //return $ret['nModified'];
      $ret = $updresult->getModifiedCount();
      return $ret;
    }
  
    function delete($ident,$flag) {
      if ( $flag ) {
         $rec = new MongoDB\BSON\ObjectId($ident);
         $filter = array ( '_id' => $rec );
      } else {
         $filter = array ( 'ident' => (int) $ident );//gdy przejmujemy $ident z query_string mamy tekst, a w bazie danych integery
      }
      //$option = array( 'justOne' => true, 'w' => 1 );
      //$ret = $this->collection->remove($filter,$option);
      $delresult = $this->collection->deleteOne($filter);
      $ret = $delresult->getDeletedCount(); 
      //return $ret['n'];
      return $ret;
    }
}
?>