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
      $cursor = $this->collection->find();
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
         $filter = array ( 'ident' => $ident );
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
         $filter = array ( 'ident' => $ident );
      }
      //$option = array( 'justOne' => true, 'w' => 1 );
      //$ret = $this->collection->remove($filter,$option);
      $delresult = $this->collection->deleteOne($filter);
      $ret = $delresult->getDeletedCount(); 
      //return $ret['n'];
      return $ret;
    }

    function find($lname) {
      $filter = array ('lname' => $lname);
      $cursor = $this->collection->find($filter);
      $table = iterator_to_array($cursor);
      return $table ;
    }
}