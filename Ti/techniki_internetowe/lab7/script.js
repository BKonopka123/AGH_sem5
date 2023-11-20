function sendRequest() {
    const xhr = new XMLHttpRequest();
    var myDiv = document.getElementById("histogram");

    var formData = {
        wiosna: document.getElementById("wiosna").checked == "1" ? "1" : "0",
        lato: document.getElementById("lato").checked == "1" ? "1" : "0",
        jesien: document.getElementById("jesien").checked == "1" ? "1" : "0",
        zima: document.getElementById("zima").checked == "1" ? "1" : "0"
    };

    var url = "../../cgi-bin/lab7.cgi";
    var data = "info=" + JSON.stringify(formData);

    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.addEventListener("load", e => {
        if (xhr.status == 200) {
            response = xhr.response;
            var json = JSON.parse(response);
            console.log(json);
            if(json != null)
                draw(json);
            myDiv.innerHTML = "<div style='width:28%; text-align:center; float:left;'>wiosna</div><div style='width:21%; text-align:center; float:left;'>lato</div><div style='width:23%; text-align:center; float:left;'>jesien</div><div style='width:24%; text-align:center; float:left;'>zima</div>";
        }
    });

    xhr.addEventListener("progress", e => {
        myDiv.innerHTML += "";
    });

    xhr.addEventListener("error", e => {
        alert("Blad polaczenia");
    });

    xhr.send(data);
}

function draw(json) {
    var wiosna = json.pory.wiosna;
    var lato = json.pory.lato;
    var jesien = json.pory.jesien;
    var zima = json.pory.zima;
    var sum = wiosna + lato + jesien + zima;

    console.log(wiosna + " " + lato + " " + jesien + " " + zima);
    
    var b_canvas = document.getElementById("canvas");
	var b_context = b_canvas.getContext("2d");

    b_context.clearRect(0,0,b_canvas.width,b_canvas.height);

	b_context.beginPath();
	b_context.fillStyle = "green";
	b_context.moveTo(30,498);
	b_context.lineTo(110,498);
	b_context.lineTo(110,498-wiosna*5);
	b_context.lineTo(30,498-wiosna*5);
    b_context.lineTo(30,498);
	b_context.fillRect(30,498-wiosna*5,80,wiosna*5);
	b_context.stroke();

    b_context.beginPath();
    b_context.fillStyle = "red";
    b_context.moveTo(150,498);
    b_context.lineTo(230,498);
    b_context.lineTo(230,498-lato*5);
    b_context.lineTo(150,498-lato*5);
    b_context.lineTo(150,498);
    b_context.fillRect(150,498-lato*5,80,lato*5);
    b_context.stroke();
    
    b_context.beginPath();
    b_context.fillStyle = "yellow";
    b_context.moveTo(270,498);
    b_context.lineTo(350,498);
    b_context.lineTo(350,498-jesien*5);
    b_context.lineTo(270,498-jesien*5);
    b_context.lineTo(270,498);
    b_context.fillRect(270,498-jesien*5,80,jesien*5);
    b_context.stroke();

    b_context.beginPath();
    b_context.fillStyle = "blue";
    b_context.moveTo(390,498);
    b_context.lineTo(470,498);
    b_context.lineTo(470,498-zima*5);
    b_context.lineTo(390,498-zima*5);
    b_context.lineTo(390,498);
    b_context.fillRect(390,498-zima*5,80,zima*5);
    b_context.stroke();
	
	// b_context.beginPath();
	// b_context.fillStyle = "yellow";
	// b_context.moveTo(200,600);
	// b_context.lineTo(300,600);
	// b_context.lineTo(300,600 - lato*500);
	// b_context.lineTo(200,600 - lato*500);
	// b_context.lineTo(200,600);
	// b_context.fillRect(200,600 - lato*500,100,lato*500);
	// b_context.stroke();

	// b_context.beginPath();
	// b_context.fillStyle = "red";
	// b_context.moveTo(350,600);
	// b_context.lineTo(450,600);
	// b_context.lineTo(450,600 - jesien*500);
	// b_context.lineTo(350,600 - jesien*500);
	// b_context.lineTo(350,600);
	// b_context.fillRect(350,600 - jesien*500,100,jesien*500);
	// b_context.stroke();

	// b_context.beginPath();
	// b_context.fillStyle = "blue";
	// b_context.moveTo(500,600);
	// b_context.lineTo(600,600);
	// b_context.lineTo(600,600 - zima*500);
	// b_context.lineTo(500,600 - zima*500);
	// b_context.lineTo(500,600);
	// b_context.fillRect(500,600 - zima*500,100,zima*500);
	// b_context.stroke();
}