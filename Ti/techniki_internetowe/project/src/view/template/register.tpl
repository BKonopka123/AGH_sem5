<!DOCTYPE html>

<html lang="pl-PL">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <?php echo $css;?> 
    <?php echo $js;?>
    <title>Bartosz Konopka - Optyka w aparatach fotograficznych</title>
</head>

<body>
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
                <span class="first_header_text">Rejestracja</span>
            </h1>
    </div>

    <div id="information_box">
        <form name="register_form">
            <table style="margin-left: auto;margin-right: auto;">
                <tr>
                    <th><label for="fname">Imię:</label></th>
                    <th><input type="text" name="fname" id="fname"></th>
                </tr>
                <tr>
                    <th><label for="lname">Nazwisko:</label></th>
                    <th><input type="text" name="lname" id="lname"></th>
                </tr>
                <tr>
                    <th><label for="email">E-mail:</label></th>
                    <th><input type="text" name="email" id="email"></th>
                </tr>
                <tr>
                    <th><label for="login">Login:</label></th>
                    <th><input type="text" name="login" id="login"></th>
                </tr>
                <tr>
                    <th><label for="pass">Hasło:</label></th>
                    <th><input type="password" name="pass" id="pass"></th>
                </tr>
            </table>
            <br>
            <input type="button" value="Zarejestruj" onclick="register()">
        </form>

        <span id="response_register">
        </span>
    </div>
</body>