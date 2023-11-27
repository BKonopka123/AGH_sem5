<?php
  
function my_autoloader($class){
    include  $class.'.php';
}  
spl_autoload_register('my_autoloader');

$reg = new Register;

echo "<html><head><link rel='StyleSheet' href='style.css' type='text/css'></head>";
echo "<body><div id='main_box'><div id='header_one'><h1>Informacje o uzytkowniku - php</h1></div><div id='main_page_links_box'><div id='main_page_links'>";

if($reg->_is_logged()){ 
    $reg->_read_user();
    echo $reg->_write();
}

echo "<br/>";
echo "<a href='user_panel.html'>Przejdz do panelu uzytkownika</a>";

echo "</div></div></body></html>";

?>