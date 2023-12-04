<table border="1">
 <?php 
    if ($data) { 
       foreach ( $data as $row ) { 
       echo '<tr><td>'.$row['imie'].'</td><td>'.$row['nazwisko'].'</td><td>'.$row['miejscowosc'].'</td></tr>' ;
    }}
 ?> 