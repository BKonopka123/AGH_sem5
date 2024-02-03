<?php 
class db {
    private $user = "1konopka" ;
    private $pass = "pass1konopka";
    private $host = "172.20.44.25";
    private $base = "1konopka";
    private $coll = "student";
    private $conn;
    private $dbase;
    private $collection;
 
    function __construct(){
      $this->conn = new MongoDB\Client("mongodb://{$this->user}:{$this->pass}@{$this->host}/{$this->base}");    
      $this->collection = $this->conn->{$this->base}->{$this->coll};
    }
 
    function select(){
      $cursor = $this->collection->find();
      $table = iterator_to_array($cursor);
      return $table ;
    }
 
    function insert($user){
      $ret = $this->collection->insertOne($user) ;
      return $ret;
    }

    function find($year){
      $cursor = $this->collection->find(['year' => $year]);
      $table = iterator_to_array($cursor);
      return $table;
    }

    function stat(){
      $cursor = $this->collection->aggregate([
        ['$group' => ['_id' => '$year', 'count' => ['$sum' => 1]]]
      ]);
      $table = iterator_to_array($cursor);
      return $table;
    }
}
?>