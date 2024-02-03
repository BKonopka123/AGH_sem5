var request;
var objJSON;
var id_mongo;
const xhr = new XMLHttpRequest();
 
function list_table(){    
    xhr.open("GET", "http://pascal.fis.agh.edu.pl/~1konopka/techniki_internetowe/lab14/rest/list", true); 
    xhr.responseType = 'json';
    xhr.addEventListener("load", e => {
        if(xhr.status == 200){
            objJSON = xhr.response ;
            var txt = "";
            for(var id in objJSON){
                txt +=  id+": {" ;
                for(var prop in objJSON[id]){             
                    if(prop !== '_id'){ 
                        txt += prop+":"+objJSON[id][prop]+",";  
                    }
                    else{ 
                        txt += "id:" + objJSON[id][prop]['$oid']+","; 
                    } 
                }
                txt +="}<br/>";
            }
            document.getElementById('data').innerHTML = '';
            document.getElementById('result').innerHTML = txt;
        }
   })
   xhr.send(null);
}
 
function insert_form(){
    var form = "<form name='add'><table>" ;
    form    += "<tr><td>Imie</td><td><input type='text' name='fname'></input></td></tr>";
    form    += "<tr><td>Pora roku</td><td><select name='year' id='year'><option value='wiosna'>Wiosna</option><option value='lato'>Lato</option><option value='jesien'>Jesien</option><option value='zima'>Zima</option></select></td></tr>";
    form    += "<tr><td></td><td><input type='button' value='wyslij' onclick='insert_data(this.form)' ></input></td></tr>";
    form    += "</table></form>";
    document.getElementById('data').innerHTML = form;
    document.getElementById('result').innerHTML = ''; 
}
 
function insert_data(form){
    var user = {};
    if(form.fname.value == '' || form.year.value == ''){
        alert('Wypelnij wszystkie pola!');
        return;
    }
    user.fname = form.fname.value;
    user.year = form.year.value;
    txt = JSON.stringify(user);
    xhr.open("POST", "http://pascal.fis.agh.edu.pl/~1konopka/techniki_internetowe/lab14/rest/save", true);
    xhr.setRequestHeader('Content-Type', 'application/json')
    xhr.addEventListener("load", e => {
        if(xhr.status == 200){
            document.getElementById('data').innerHTML = ''; 
            document.getElementById('result').innerHTML = JSON.stringify(xhr.response);
        }
    })   
    xhr.send(txt);
}

function find_form(){
    document.getElementById('result').innerHTML = '';
    var form = "<form name='find'><tr><td>Pora roku</td><td><select name='year' id='year'><option value='wiosna'>wiosna</option><option value='lato'>lato</option><option value='jesien'>jesien</option><option value='zima'>zima</option></select></td></tr><input type='button' value='wyslij' onclick='find_data(this.form)' ></input></td></tr><table>";
    document.getElementById('data').innerHTML = form;
}

function find_data(form){
    let year = form.year.value;  
    xhr.open("GET", "http://pascal.fis.agh.edu.pl/~1konopka/techniki_internetowe/lab14/rest/find/" + year, true);
    xhr.responseType = 'json';
    xhr.addEventListener("load", e => {
        if(xhr.status == 200){
            objJSON = xhr.response ;
            var txt = "";
            for(var id in objJSON){
                txt +=  id+": {" ;
                for(var prop in objJSON[id]){             
                    if(prop !== '_id'){ 
                        txt += prop+":"+objJSON[id][prop]+",";  
                    }
                    else{ 
                        txt += "id:" + objJSON[id][prop]['$oid']+"," ; 
                    } 
                }
                txt +="}<br/>";
            }
            document.getElementById('data').innerHTML = '';
            document.getElementById('result').innerHTML = txt;
        }
   })
   xhr.send(null);
}

function stat(){
    xhr.open("GET", "http://pascal.fis.agh.edu.pl/~1konopka/techniki_internetowe/lab14/rest/stat", true);
    xhr.responseType = 'json';
    xhr.addEventListener("load", e => {
        if(xhr.status == 200){
            objJSON = xhr.response ;
            var txt = "";
            for(var id in objJSON){
                txt +=  id+": {" ;
                for(var prop in objJSON[id]){             
                    txt += prop+":"+objJSON[id][prop]+",";
                }
                txt +="}<br/>";
            }
            document.getElementById('data').innerHTML = '';
            document.getElementById('result').innerHTML = txt;
        }
   })
   xhr.send(null);
}