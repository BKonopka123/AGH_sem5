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

    var image = new Image();
    image.src = "src/view/photos/animacja.png";

    var r = 5 * zewnetrzne_swiatlo;

    var wynik = 10 * (zewnetrzne_swiatlo + 5) * iso/50 * 1/(time/100) * f; 
    console.log(wynik);

    image.onload = function() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.drawImage(image, 10, 40);
        ctx.beginPath();
        ctx.fillStyle = "#0000F7";
        ctx.globalAlpha = 0.2;
        ctx.fillRect(0, 325-10*zewnetrzne_swiatlo, 200, 20*zewnetrzne_swiatlo );
        var flag;
        if (wynik >=0 && wynik <= 1000){
            flag = 10;
        }
        else if(wynik > 1000 && wynik <= 3000){
            flag = 20;
        }
        else if(wynik > 3000 && wynik <= 10000){
            flag = 30;
        }
        else if(wynik > 10000 && wynik <= 50000){
            flag = 40;
        }
        else if(wynik > 50000 && wynik <= 100000){
            flag = 50;
        }
        else if(wynik > 100000 && wynik <= 400000){
            flag = 60;
        }
        else if(wynik > 400000 && wynik <= 1000000){
            flag = 70;
        }
        else{
            flag = 80;
        }
        ctx.moveTo(200, 325-(flag/2));
        ctx.lineTo(588+((flag/2)/1.1106), 325-(flag/2));
        ctx.lineTo(588-((flag/2)/1.1106), 325+(flag/2));
        ctx.lineTo(200, 325+(flag/2));
        ctx.lineTo(200, 325-(flag/2));

        ctx.moveTo(588+((flag/2)/1.1106), 325-(flag/2));
        ctx.lineTo(588+((flag/2)/1.1106), 96+((flag/2)/(1.732)));
        ctx.lineTo(588-((flag/2)), 96-((flag/2)/(1.732)));
        ctx.lineTo(588-((flag/2)), 325-(flag/2));
        ctx.lineTo(588+((flag/2)/1.1106), 325-(flag/2));
        
        ctx.moveTo(588-((flag/2)), 96-((flag/2)/(1.732)));
        ctx.lineTo(485-(flag/2 * 0.3249), 190-flag/2);
        ctx.lineTo(485+(flag/2 * 0.3249), 190+flag/2 );
        ctx.lineTo(588+((flag/2)/1.1106), 96+((flag/2)/(1.732)));
        ctx.lineTo(588-((flag/2)), 96-((flag/2)/(1.732)));
        
        ctx.moveTo(485-(flag/2 * 0.3249), 190-flag/2);
        ctx.lineTo(800, 190-flag/2);
        ctx.lineTo(800, 190+flag/2);
        ctx.lineTo(485+(flag/2 * 0.3249), 190+flag/2 );
        ctx.lineTo(485-(flag/2 * 0.3249), 190-flag/2);
        ctx.fill();
        ctx.globalAlpha = 1.0;

        // Define variables for circle position and movement
        var circleX = 200;
        var circleY = 325;
        var circleRadius = flag / 2;
        var dx = 1; // Horizontal movement speed
        var dy = 0; // Vertical movement speed
        var flag = false;

        function animate() {
            ctx.beginPath();
            ctx.fillStyle = "#0000FF";
            ctx.arc(circleX, circleY, circleRadius, 0, Math.PI * 2);
            ctx.fill();

            circleX += dx;
            circleY += dy;
            if(circleX  == 588 && circleY == 325) {
                dx = 0;
                dy = -1;
            }
            if(circleY == 96 && circleX == 588) {
                dx = -1;
                dy = 1;
            }
            if(circleY == 190 && circleX == 494) {
                dx = 1;
                dy = 0;
            }
            if(circleX == 800 && circleY == 190) {
                dx = 0;
                dy = 0;
            }
            requestAnimationFrame(animate);
        }
        
        animate();

        if(wynik >=1000 && wynik <= 3000){
            ctx.fillStyle = "#048912";
            ctx.fillRect(848, 173, 30, 30);
            ctx.font = "bold 18px Arial";
            ctx.fillText(wynik + '', 430, 560);
        }
        else{
            ctx.fillStyle = "#FF0808";
            ctx.fillRect(848, 173, 30, 30);
            ctx.font = "bold 18px Arial";
            ctx.fillText(wynik + '', 430, 560);
        }
        ctx.strokeStyle = "rgba( 255, 255, 255, 0.0 )";
        ctx.stroke();
    };


}


function animation_draw_start() {
    var canvas = document.getElementById("animation_canvas");
    var ctx = canvas.getContext("2d");
    var image = new Image();
    image.src = "src/view/photos/animacja.png";

    image.onload = function() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.drawImage(image, 10, 40);
    };
}


//Funkcja javascript obsługująca przyciski wykonujące animację
function animation_values(){
    animation_draw_start();

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
