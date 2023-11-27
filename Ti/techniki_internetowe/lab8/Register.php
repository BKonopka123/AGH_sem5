<?php

class Register{

    protected $data = array();
    private $dbh;
    private $dbfile = "files/datadb.db";
    private $dbfile_notes = "files/notesdb.db";
    private $ident = 'test';
    private $auth = false;
  
    function __construct(){ 
        session_set_cookie_params([
            'lifetime' => 360,
            'path' => '/~1konopka/',
            'domain' => $_SERVER['HTTP'],
            'secure' => false,
            'httponly' => false,
            'samesite' => 'LAX'
        ]);       
        session_start();
    }
    
    function _read(){
        $this->data['fname'] = $_POST['fname'];
        $this->data['lname'] = $_POST['lname'];
        $this->data['email'] = $_POST['email'];
        $this->data['pass'] = $_POST['pass'];
    }
         
    function _write(){
        echo "Wprowadzone dane<br/>" ;
        echo "Imię:".$this->data['fname']."<br/>";
        echo "Nazwisko:".$this->data['lname']."<br/>";
        echo "E-mail:".$this->data['email']."<br/>";
        echo "Hasło:".$this->data['pass']."<br/>";
    }
  
    function _save(){
        $this->dbh = dba_open($this->dbfile, "c");
        if(!dba_exists($this->data['email'], $this->dbh)){
            $serialized_data = serialize($this->data);
            dba_insert($this->data['email'],$serialized_data, $this->dbh) ;
            $text = 'Dane zostały zapisane';
        } 
        else{          
            $text = 'Dane dla podanego adresu e-mail sa w bazie danych';
        }
        dba_close($this->dbh) ;
        return $text;
    }  

    function _login(){
        $email = $_POST['email'];
        $pass = $_POST['pass'];
        $access = false;
        $this->dbh = dba_open($this->dbfile, "r");
        if(dba_exists($email, $this->dbh)){
            $serialized_data = dba_fetch($email, $this->dbh);
            $this->data = unserialize($serialized_data);
            if($this->data['pass'] == $pass){
                $_SESSION['auth'] = 'OK';
                $_SESSION['user'] = $email;
            $access = true;
            }
        }
        dba_close($this->dbh);
        $text = ( $access ? 'Uzytkownik zalogowany' : ' Uzytkownik niezalogowany ' ) ;
        return $text;
    }

    function _is_logged(){
        if(isset($_SESSION['auth'])){
            $ret = $_SESSION['auth'] == 'OK' ? true : false;
        } 
        else{ 
            $ret = false; 
        }
        return $ret;
    }

    function _logout(){
        unset($_SESSION);
        session_destroy();
        $text = 'Uzytkownik wylogowany';
        return $text;
    }

    function _read_user(){
        $email = $_SESSION['user'];
        $this->dbh = dba_open( $this->dbfile, "r");
        if(dba_exists($email, $this->dbh)){
            $serialized_data = dba_fetch($email, $this->dbh);
            $this->data = unserialize($serialized_data);
        }
        dba_close($this->dbh) ;
    }

    function _read_all(){
        $table = array();
        $this->dbh = dba_open( $this->dbfile, "r");
        $key = dba_firstkey($this->dbh);
        while($key){
            $serialized_data = dba_fetch($key, $this->dbh) ;
            $this->data = unserialize($serialized_data);
            $table[$key]['email'] = $this->data['email'];
            $table[$key]['fname'] = $this->data['fname'];
            $table[$key]['lname'] = $this->data['lname'];
            $key = dba_nextkey($this->dbh);
        }
        dba_close($this->dbh) ;
        return $table;
    }

}

?>