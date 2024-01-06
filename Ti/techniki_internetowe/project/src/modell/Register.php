<?php
    namespace src\modell;
    use PDO;

    use src\Model;

    class Register extends Model{
        private $ident = 'test';
        private $auth = false;
        private $sth;
    
        //Konstruktor klasy Register - inicializacja sesji
        function __construct(){ 
            parent::__construct();
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

        //Metoda sprawdzająca czy wpisany w formularzu email istnieje w bazie danych
        function register_search($obj){
            $this->sth = self::$db->prepare('SELECT * FROM user WHERE email = :email OR logi = :logi');
            $this->sth->bindValue(':email',$obj->email,PDO::PARAM_STR); 
            $this->sth->bindValue(':logi',$obj->login,PDO::PARAM_STR);
            $this->sth->execute();
            $resp = $this->sth->fetchAll(PDO::FETCH_ASSOC);
            return empty($resp);
        }

        //Metoda dodająca użytkownika do bazy danych w trakcie rejestracji
        function register_add_database($obj){
            $this->sth = self::$db->prepare('SELECT * FROM user');
            $this->sth->execute();
            $number = $this->sth->fetchAll(PDO::FETCH_ASSOC);
            $number = count($number) + 1;

            $this->sth = self::$db->prepare('INSERT INTO user(user_id, fname, lname, email, logi, pass) VALUES (:user_id, :fname, :lname, :email, :logi, :pass) ');
            $this->sth->bindValue(':user_id',$number,PDO::PARAM_INT);
            $this->sth->bindValue(':fname',$obj->fname,PDO::PARAM_STR); 
            $this->sth->bindValue(':lname',$obj->lname,PDO::PARAM_STR); 
            $this->sth->bindValue(':email',$obj->email,PDO::PARAM_STR);
            $this->sth->bindValue(':logi',$obj->login,PDO::PARAM_STR); 
            $this->sth->bindValue(':pass',$obj->pass,PDO::PARAM_STR); 
            $resp = ($this->sth->execute() ? 'true' : 'false');
            return $resp; 
        }

        //Metoda sprawdzająca czy wpisany w formularzu login i hasło istnieją w bazie danych
        function login_search($obj){
            $this->sth = self::$db->prepare('SELECT * FROM user WHERE logi = :logi AND pass = :pass');
            $this->sth->bindValue(':logi',$obj->login,PDO::PARAM_STR); 
            $this->sth->bindValue(':pass',$obj->pass,PDO::PARAM_STR); 
            $this->sth->execute();
            $resp = $this->sth->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($resp)){
                $_SESSION['user'] = $obj->login;
                $_SESSION['auth'] = 'OK';
            }
            return empty($resp);
        }

        //Metoda wylogowywująca użytkownika
        function logout(){
            unset($_SESSION);
            session_destroy();
            $text = 'Uzytkownik wylogowany';
            return $text;
        }

        //Metoda zwracająca informacje o użytkowniku z bazy
        function panel_informations_get(){
            $this->sth = self::$db->prepare('SELECT * FROM user WHERE logi = :logi');
            $this->sth->bindValue(':logi',$_SESSION['user'],PDO::PARAM_STR); 
            $this->sth->execute();
            $resp = $this->sth->fetchAll(PDO::FETCH_ASSOC);
            return $resp;
        }

        //Metoda zapisująca dane z animacji do bazy
        function animation_save($obj){
            $this->sth = self::$db->prepare('UPDATE user SET light = :light, iso = :iso, timee = :timee, f = :f WHERE logi = :logi');
            $this->sth->bindValue(':light',$obj->light,PDO::PARAM_STR); 
            $this->sth->bindValue(':iso',$obj->iso,PDO::PARAM_STR); 
            $this->sth->bindValue(':timee',$obj->time,PDO::PARAM_STR); 
            $this->sth->bindValue(':f',$obj->f,PDO::PARAM_STR); 
            $this->sth->bindValue(':logi',$_SESSION['user'],PDO::PARAM_STR); 
            $resp = ($this->sth->execute() ? 'true' : 'false');
            return($resp ? "Animacja wykonana, zapisano dane" : "Animacja wykonana, błąd w zapisie danych");
        }

        //Metoda zwracająca dane z bazy do animacji
        function animation_get($obj){
            $this->sth = self::$db->prepare('SELECT * FROM user WHERE logi = :logi');
            $this->sth->bindValue(':logi',$_SESSION['user'],PDO::PARAM_STR); 
            $this->sth->execute();
            $resp = $this->sth->fetchAll(PDO::FETCH_ASSOC);
            return $resp;
        }
    }
?>