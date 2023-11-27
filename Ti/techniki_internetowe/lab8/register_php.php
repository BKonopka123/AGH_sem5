<?php
  
function my_autoloader($class){
    include  $class.'.php';
}  
spl_autoload_register('my_autoloader');

echo "<html><head><link rel='StyleSheet' href='style.css' type='text/css'></head>";
echo "<body><div id='main_box'><div id='header_one'><h1>Rejestracja - php</h1></div><div id='main_page_links_box'><div id='main_page_links'>";

$reg = new Register;
$reg->_read();
$reg->_write();
echo $reg->_save();
echo "</br>";
echo "<a href='index.html'>Powrot do programu glownego</a>";

echo "</div></div></body></html>";

?>