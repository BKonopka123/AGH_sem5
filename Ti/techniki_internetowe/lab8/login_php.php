<?php
  
function my_autoloader($class){
    include  $class.'.php';
}  
spl_autoload_register('my_autoloader');

$reg = new Register;

echo "<html><head><link rel='StyleSheet' href='style.css' type='text/css'></head>";
echo "<body><div id='main_box'><div id='header_one'><h1>Logowanie - php</h1></div><div id='main_page_links_box'><div id='main_page_links'>";

echo $reg->_login();
echo "</br>";
if($reg->_is_logged()){
    echo "<a href='user_panel.html'>Przejdz do panelu uzytkownika</a>";
}
else{
    echo "<a href='index.html'>Przejdz do strony glownej</a>";
}

echo "</div></div></body></html>";

?>