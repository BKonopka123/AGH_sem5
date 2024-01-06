<!DOCTYPE html>

<html lang="pl-PL">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <?php echo $css;?> 
    <?php echo $js;?>
    <title>Bartosz Konopka - Optyka w aparatach fotograficznych</title>
</head>

<body onLoad="panel_informations_start();">

    <div class="options_box">
        <div class="options_box_under">
            <a href="index.php">Strona główna</a>
        </div>
        <div class="options_box_under">
            <a href="index.php#animation_box">Animacja</a>
        </div>
        <div class="options_box_under">
            <a href="index.php#information_box">Opis zagadnienia</a>
        </div>
        <div class="options_box_under">
            <a href="index.php?action=register">Rejestracja</a>
        </div>
        <div class="options_box_under">
            <a href="index.php?action=login">Logowanie</a>
        </div>
        <div class="options_box_under">
            <a href="index.php?action=panel">Panel użytkownika</a>
        </div>
    </div>

    <div class="main_header">
            <h1>
                <span class="first_header_text">Panel Użytkownika</span>
            </h1>
    </div>

    <div id="information_box">

        <div class="information_header">
            Dane użytkownika
        </div>

        <div class="information_text_middle">
            <p id="user_information"> 
            </p>
        </div>

        <div class="information_header">
            Dane zapisane w animacji
        </div>

        <div class="information_text_middle">
            <p id="animation_information"> 
            </p>
        </div>

        <form name="logout_form">
            <input type="button" value="Wyloguj" onclick="logoutt()">
        </form>
        
    </div>

   
</body>