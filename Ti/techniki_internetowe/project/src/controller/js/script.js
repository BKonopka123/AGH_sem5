//Funkcja javascript obsługująca przyciski wykonujące animację
function aanimation(){
    //Pobranie danych z formularza
    var zewnetrzne_swiatlo = document.getElementById("zewnetrzne_swiatlo").value;
    var iso = document.getElementById("iso").value;
    var time = document.getElementById("time").value;
    var f = document.getElementById("f").value;

    //Walidacja danych
    if(zewnetrzne_swiatlo == "" || iso == "" || time == "" || f == ""){
        document.getElementById("response_animation").innerHTML = "Wypełnij wszystkie pola";
        return;
    }
    if(isNaN(zewnetrzne_swiatlo) || isNaN(iso) || isNaN(time) || isNaN(f)){
        document.getElementById("response_animation").innerHTML = "Wypełnij wszystkie pola liczbami";
        return;
    }
    if(zewnetrzne_swiatlo < 1 || zewnetrzne_swiatlo > 10 || iso < 50 || iso > 400 || time < 8 || time > 1000 || f < 1.7 || f > 8){
        document.getElementById("response_animation").innerHTML = "Wprowadź prawidłowe wartości";
        return;
    }
    document.getElementById("response_animation").innerHTML = "";

    //Przygotowanie danych do wysłania
    var json_data = "{\"light\":\"" + zewnetrzne_swiatlo + "\",\"iso\":\"" + iso + "\",\"time\":\"" + time + "\",\"f\":\"" + f + "\"}";
    var msg = "data=" + encodeURIComponent(json_data);
    var url = "index.php?action=animationdata";

    //Wysłanie danych do serwera
    resp = function(response){
        console.log(response);
        animation_draw(zewnetrzne_swiatlo, iso, time, f);
        document.getElementById("response_animation").innerHTML = response; 
    }
    xmlhttpPost(url, msg, resp); 
}

//Funkcja javascript obsługująca rysowanie animacji
function animation_draw(zewnetrzne_swiatlo, iso, time, f){
    var canvas = document.getElementById("animation_canvas");
    var ctx = canvas.getContext("2d");
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.beginPath();
    ctx.strokeStyle = "#000000";

    ctx.moveTo(0, 0);
    ctx.lineTo(300, 300);
    ctx.stroke();
}

//Funkcja javascript obsługująca przyciski wykonujące animację
function animation_values(){
    //Przygotoanie danych do wysłania
    var json_data = "{\"light\":\"" + 1 + "\",\"iso\":\"" + 50 + "\",\"time\":\"" + 8 + "\",\"f\":\"" + 1.7 + "\"}";
    var msg = "data=" + encodeURIComponent(json_data);
    var url = "index.php?action=animationvaluesset";

    //Wysłanie danych do serwera
    resp = function(response){
        console.log(response);
        var arr_response = JSON.parse(response);
        document.getElementById("zewnetrzne_swiatlo").value= arr_response["light"];
        document.getElementById("iso").value= arr_response["iso"];
        document.getElementById("time").value= arr_response["time"];
        document.getElementById("f").value= arr_response["f"]; 
    }
    xmlhttpPost(url, msg, resp); 
}

//Funkcja javascript obsługująca rejestrację
function register(){
    //Pobranie danych z formularza
    var fname = document.getElementById("fname").value;
    var lname = document.getElementById("lname").value;
    var email = document.getElementById("email").value;
    var login = document.getElementById("login").value;
    var password = document.getElementById("pass").value;

    //Walidacja danych
    if(fname == "" || lname == "" || email == "" || login == "" || password == ""){
        document.getElementById("response_register").innerHTML = "Wypełnij wszystkie pola"; 
        return;
    }
    var re = /\S+@\S+\.\S+/;
    if(!re.test(email)){
        document.getElementById("response_register").innerHTML = "Niepoprawny adres email"; 
        return;
    }

    //Przygotowanie danych do wysłania
    var json_data = "{\"fname\":\"" + fname + "\",\"lname\":\"" + lname + "\",\"email\":\"" + email + "\",\"login\":\"" + login + "\",\"pass\":\"" + password + "\"}";
    var msg = "data=" + encodeURIComponent(json_data);
    var url = "index.php?action=registerdata";

    //Wysłanie danych do serwera
    resp = function(response){
        console.log(response);
        document.getElementById("response_register").innerHTML = response; 
    }
    xmlhttpPost(url, msg, resp); 
}

//Funkcja javascript obsługująca logowanie
function loginn(){
    //Pobranie danych z formularza
    var login = document.getElementById("login").value;
    var password = document.getElementById("pass").value;

    //Przygotowanie danych do wysłania
    var json_data = "{\"login\":\"" + login + "\",\"pass\":\"" + password + "\"}";
    var msg = "data=" + encodeURIComponent(json_data);
    var url = "index.php?action=logindata";
    
    //Wysłanie danych do serwera
    resp = function(response){
        document.getElementById("response_login").innerHTML = response; 
    }
    xmlhttpPost(url, msg, resp); 
}

//Funkcja javascript obsługująca wylogowanie
function logoutt(){
    var url = "index.php?action=logoutdata";
    resp = function(response){
        window.location.reload();
    }
    xmlhttpPost(url, "", resp); 
}

//Funkcja javascript obsługująca wyświetlanie informacji w panelu informacyjnym
function panel_informations_start(){
    var url = "index.php?action=panel_informations";
    resp = function(response){
        var arr_response = JSON.parse(response);
        output_1 ="<table class=\"tableOne\">" + 
                  "<tr><td> <p style=\"font-weight: bold;\">id:</p> </td><td>" + arr_response["user_id"] + "</td></tr>" +
                  "<tr><td> <p style=\"font-weight: bold;\">Imię:</p> </td><td>" + arr_response["fname"] + "</td></tr>" + 
                  "<tr><td> <p style=\"font-weight: bold;\">Nazwisko:</p> </td><td>" + arr_response["lname"] + "</td></tr>" +
                  "<tr><td> <p style=\"font-weight: bold;\">Email:</p> </td><td>" + arr_response["email"] + "</td></tr>" +
                  "<tr><td> <p style=\"font-weight: bold;\">Login:</p> </td><td>" + arr_response["logi"] + "</td></tr>"
                  + "</table>";
        output_2 = "<table class=\"tableOne\">" + 
                  "<tr><td> <p style=\"font-weight: bold;\">Zewnętrzne światło:</p> </td><td>" + arr_response["light"] + "</td></tr>" +
                  "<tr><td> <p style=\"font-weight: bold;\">ISO:</p> </td><td>" + arr_response["iso"] + "</td></tr>" +
                  "<tr><td> <p style=\"font-weight: bold;\">Czas:</p> </td><td>" + arr_response["timee"] + "</td></tr>" +
                  "<tr><td> <p style=\"font-weight: bold;\">Przesłona:</p> </td><td>" + arr_response["f"] + "</td></tr>"
                  + "</table>";
        document.getElementById("user_information").innerHTML = output_1;
        document.getElementById("animation_information").innerHTML = output_2;
    }
    xmlhttpPost(url, "", resp); 
}

//Funkcja obsługująca przesyłanie danych do serwera
function xmlhttpPost(strURL, mess, respFunc){
    var xmlHttpReq = false;
    var self = this;
    // Mozilla/Safari
    if (window.XMLHttpRequest) {
      self.xmlHttpReq = new XMLHttpRequest();
    }
    // IE
    else if (window.ActiveXObject){
      self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
    }
    self.xmlHttpReq.onreadystatechange = function(){
      if(self.xmlHttpReq.readyState == 4){
        if ( self.xmlHttpReq.status == 200 ){    
          respFunc( self.xmlHttpReq.responseText );
        }
        else if ( self.xmlHttpReq.status == 401 ){
          window.location.reload();
        } 
      }
    }
    self.xmlHttpReq.open('POST', strURL);
    self.xmlHttpReq.setRequestHeader("X-Requested-With","XMLHttpRequest");
    self.xmlHttpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded; ");
    self.xmlHttpReq.send(mess);
}
