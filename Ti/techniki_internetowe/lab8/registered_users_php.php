<?php
  
function my_autoloader($class){
    include  $class.'.php';
}  
spl_autoload_register('my_autoloader');

$reg = new Register;

echo "<html><head><link rel='StyleSheet' href='style.css' type='text/css'></head>";
echo "<body><div id='main_box'><div id='header_one'><h1>Zarejestrowani uzytkownicy - php</h1></div><div id='main_page_links_box'><div id='main_page_links'>";


if($reg->_is_logged()){ 
    $table = $reg->_read_all();
    echo "<table><tr><th>Nazwisko</th><th>Imie</th><th>E-mail</th></tr>";
    foreach($table as $key => $record){
      echo "<tr><td>".$record['fname']."</td><td>".$record['lname']."</td><td>".$record['email']."</td><tr>";
    }
    echo "</table>" ;
}

echo "<br/>";
echo "<a href='user_panel.html'>Przejdz do panelu uzytkownika</a>";

echo "</div></div></body></html>";

?>