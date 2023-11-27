<?php
  
function my_autoloader($class){
    include  $class.'.php';
}  
spl_autoload_register('my_autoloader');

$notes = new Notes;

echo "<html><head><link rel='StyleSheet' href='style.css' type='text/css'></head>";
echo "<body><div id='main_box'><div id='header_one'><h1>Nowy wpis - php</h1></div><div id='main_page_links_box'><div id='main_page_links'>";

echo $notes->_save_messages() ;

echo "<br/>";
echo "<a href='user_panel.html'>Przejdz do panelu uzytkownika</a>";

echo "</div></div></body></html>";

?>