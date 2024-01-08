<?php
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);
//error_reporting(E_ALL);
 
require 'vendor/autoload.php' ;
include 'rest/mongo.php';
$db = new db();

    print "<!DOCTYPE HTML>\n";
    print "<html>\n";
    print "<head>\n";
    print "<meta http-equiv=\"content-type\" content=\"text/html; charset=iso-8859-2\">";
    print "<script src=\"script.js\" type=\"text/javascript\"></script>";
    print "<link rel=\"StyleSheet\" href=\"style.css\" type=\"text/css\">";
    print "<title>Lab 10 - Mongodb</title>";
    print "</head>";
    print "<body>";
    print "<pre>";
    print "<h1>CRUD w MongoDB</h1>";
    print "<a href=\"test_mongo.php?action=data\" >Dane w bazie</a><br/>";
    print "<a href=\"test_mongo.php?action=add\" >Dodaj do bazy</a><br/>";
    print "<a href=\"test_mongo.php?action=search\" >Szukaj w bazie</a><br/>";
    print "<a href=\"test_mongo.php?action=delete\" >Usun z bazy</a><br/>";

try{
    $action = $_GET['action']; 
    if($action == "data"){
        print "Zawartosc bazy danych<br/>";
        $data = $db->select();
        print_r($data);
        print "\n<br/>------------ <br/>\n" ;
    }
    elseif($action == "add" && empty($_GET['fname']) && empty($_GET['lname']) && empty($_GET['course']) && empty($_GET['year'])){
        print "<form name=\"add_form\" method=\"post\">";
        print "<label for=\"fname\">Podaj imie:</label><br>";
        print "<input type=\"text\" id=\"fname\" name=\"fname\"><br>";
        print "<label for=\"lname\">Podaj Nazwisko:</label><br>";
        print "<input type=\"text\" id=\"lname\" name=\"lname\"><br>";
        print "<label for=\"course\">Podaj Kierunek:</label><br>";
        print "<input type=\"text\" id=\"course\" name=\"course\"><br>";
        print "<label for=\"year\">Podaj Rok:</label><br>";
        print "<input type=\"text\" id=\"year\" name=\"year\"><br>";
        print "<input type=\"button\" value=\"Dodaj\" onclick=\"fn_add()\" />";
        print "</form>";
        print "<span id=\"response\"></span>";
    }
    elseif($action == "add" && isset($_GET['fname'] , $_GET['lname'] , $_GET['course'] , $_GET['year'])){
        $record = array ( 'fname' => $_GET['fname'], 'lname' => $_GET['lname'], 'course' => $_GET['course'], 'year' => $_GET['year'] ) ;
        $flag = $db->insert($record);
        print $flag?"Dodano do bazy":"Nie dodano do bazy";
        print "<br/>";
    }
    elseif($action == "search" && empty($_GET['course'])){
        print "<form name=\"add_form\" method=\"post\">";
        print "<label for=\"course\">Podaj Kierunek:</label><br>";
        print "<input type=\"text\" id=\"course\" name=\"course\"><br>";
        print "<input type=\"button\" value=\"Szukaj\" onclick=\"fn_search()\" />";
        print "</form>";
        print "<span id=\"response\"></span>";
    }
    elseif($action == "search" && isset($_GET['course'])){
        $data = $db->select();
        $course = $_GET['course'];
        $flag = false;
        foreach($data as $row){
            if($row['course'] == $course){
                print_r($row);
                print "<br/>";
                $flag = true;
            }
        }
        if(!$flag){
            print "Nie znaleziono studentow na tym kierunku";
        }
    }
    elseif($action == "delete" && empty($_GET['lname'])){
        print "<form name=\"add_form\" method=\"post\">";
        print "<label for=\"lname\">Podaj Nazwisko:</label><br>";
        print "<input type=\"text\" id=\"lname\" name=\"lname\"><br>";
        print "<input type=\"button\" value=\"Usun\" onclick=\"fn_delete()\" />";
        print "</form>";
        print "<span id=\"response\"></span>";
    }
    elseif($action == "delete" && isset($_GET['lname'])){
        $data = $db->select();
        $lname = $_GET['lname'];
        $flag = false;
        foreach($data as $row){
            if($row['lname'] == $lname){
                $flag = true;
                $id = $row['_id'];
                $flag = $db->delete($id,1) ;
                print $flag?"Usunieto z bazy":"Nie usunieto z bazy";
                print "<br/>";
            }
        }
        if(!$flag){
            print "Nie znaleziono studenta o tym nazwisku";
        }
    }
    else{
        print "Nieznana akcja";
    }
}
catch(Exception $e){
    echo 'Error: [' . $e->getCode() . '] ' . $e->getMessage() ;
}

print "</pre>" ;
print "</body>";
print "</html>";

?>