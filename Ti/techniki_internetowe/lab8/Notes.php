<?php

interface NoteInterface {
    function _read(); 
    function _save_messages();
    function _read_messages();
}

class Notes implements NoteInterface {
    private $dbfile = "files/notesdb.db" ;
	private $dbh = null ;
	function __construct(){}
	
    function _save_messages(){
		$this->dbh = dba_open( $this->dbfile, "c");
		$timestamp = time();
		$arr = array();
		$arr['message'] = $_POST['message'];
		$serialized_data = serialize($arr) ;
		dba_insert($timestamp, $serialized_data, $this->dbh);
        dba_close($this->dbh);
		return "Zapisano informacje w bazie danych";
	}
	
    function _read(){
		if($_SERVER['REQUEST_METHOD'] === 'POST')
			$message = $_POST['message'];
		return $message;
	}
		
    function _read_messages(){
		$this->dbh = dba_open( $this->dbfile, "r");
		if (!$this->dbh) {
			die("Nie można otworzyć bazy danych");
		}
		$messages = array();
		$key = dba_firstkey($this->dbh);
		while ($key !== false){
			$value = dba_fetch($key, $this->dbh);
			$messages[$key] = $value;
			$key = dba_nextkey($this->dbh);
		}
		dba_close($this->dbh);
		return $messages;
	}
}

?>