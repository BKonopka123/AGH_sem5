<?php
  
    namespace src\controller;
    
    use src\Controller;
    use src\View;
    use src\Model;
    use src\modell\Register;
    
    class Info extends Controller {
    
        protected $data;
        protected $layout;
        protected $register;
    
        //Konstruktor klasy Info
        function __construct(){
            parent::__construct();
            $this->layout = new View('main');   
            $this->layout->css = $this->css; 
            $this->layout->js = $this->js;
            $this->register = new Register();
        }
    
        //Metoda wyświetlająca stronę główną
        function index(){
            return $this->layout;
        }

        //Metoda wyświetlająca stronę odpowiedzialną za rejestrację
        function register(){
            $this->layout = new View('register');
            $this->layout->css = $this->css; 
            $this->layout->js = $this->js;
            return $this->layout;
        }

        //Metoda obsługująca przesłane dane z rejestracji
        function registerdata(){
            $data = $_POST['data'];
            $obj  = json_decode($data); 
            if(isset($obj->fname) && isset($obj->lname) && isset($obj->email) && isset($obj->login) && isset($obj->pass)){
                $check_mail = $this->register->register_search($obj);
                if(!$check_mail)
                    return "Podany email lub login już istnieje w bazie danych";
                $flag = $this->register->register_add_database($obj);
            }
            else{
                $flag = false;
            }
            return($flag ? "Dodano użytkownika<br><a href=\"index.php?action=login\">Logowanie</a>" : "Błąd w rejestracji");
        }

        //Metoda wyświetlająca stronę odpowiedzialną za logowanie
        function login(){
            if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'OK'){
                $this->layout = new View('logintwo');
                $this->layout->css = $this->css; 
                $this->layout->js = $this->js;
                return $this->layout;
            }
            else if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'NO'){
                $this->layout = new View('loginone');
                $this->layout->css = $this->css; 
                $this->layout->js = $this->js;
                return $this->layout;
            }
            else{
                $this->layout = new View('loginone');
                $this->layout->css = $this->css; 
                $this->layout->js = $this->js;
                return $this->layout;
            }
        }

        //Metoda obsługująca przesłane dane z logowania
        function logindata(){
            $data = $_POST['data'];
            $obj  = json_decode($data); 
            if(isset($obj->login) && isset($obj->pass)){
                $check_login = $this->register->login_search($obj);
                if($check_login)
                    return "Podany login lub hasło jest nieprawidłowe";
                $flag = true;
            }
            else{
                $flag = false;
            }
            return($flag ? "Zalogowano<br><a href=\"index.php?action=panel\">Panel użytkownika</a>" : "Błąd w logowaniu");
        }

        //Metoda wyświetlająca stronę odpowiedzialną za panel użytkownika
        function panel(){
            if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'OK'){
                $this->layout = new View('panelone');
                $this->layout->css = $this->css; 
                $this->layout->js = $this->js;
                return $this->layout;
            }
            else if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'NO'){
                $this->layout = new View('paneltwo');
                $this->layout->css = $this->css; 
                $this->layout->js = $this->js;
                return $this->layout;
            }
            else{
                $this->layout = new View('paneltwo');
                $this->layout->css = $this->css; 
                $this->layout->js = $this->js;
                return $this->layout;
            }
        }

        //Metoda wylogowywująca użytkownika
        function logoutdata(){
            $text = $this->register->logout();
            return $text;
        }

        //Metoda wyświetlająca informacje w panelu użytkownika
        function panel_informations(){
            $info = $this->register->panel_informations_get();
            $response = array(
                'user_id' => $info[0]['user_id'],
                'fname' => $info[0]['fname'],
                'lname' => $info[0]['lname'],
                'email' => $info[0]['email'],
                'logi'  => $info[0]['logi'],
                'pass'  => $info[0]['pass'],
                'light' => $info[0]['light'],
                'iso'   => $info[0]['iso'],
                'timee' => $info[0]['timee'],
                'f'     => $info[0]['f']
            );
            return json_encode($response);
        }

        //Metoda obsługujaca dane z animacji
        function animationdata(){
            $data = $_POST['data'];
            $obj  = json_decode($data); 
            if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'OK'){
                $flag = $this->register->animation_save($obj);
                return $flag; 
            }
            else if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'NO'){
                return "Animacja wykonana, aby zapisać dane zaloguj się";
            }
            else{
                return "Animacja wykonana, aby zapisać dane zaloguj się";
            }
        }

        //Metoda zwracająca dane z bazy do animacji
        function animationvaluesset(){
            $data = $_POST['data'];
            $obj  = json_decode($data); 
            if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'OK'){
                $info = $this->register->animation_get($obj);
                $response = array(
                    'light' => $info[0]['light'],
                    'iso'   => $info[0]['iso'],
                    'time' => $info[0]['timee'],
                    'f'     => $info[0]['f']
                );
                return json_encode($response);
            }
            else if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'NO'){
                return json_encode($obj);
            }
            else{
                return json_encode($obj);
            }
        }
    }
  
?>
