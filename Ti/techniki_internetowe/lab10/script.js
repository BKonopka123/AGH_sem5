function fn_add(){
    var fname = document.getElementById("fname").value;
    var lname = document.getElementById("lname").value;
    var course  = document.getElementById("course").value;
    var year = document.getElementById("year").value;
    //console.log(fname + " " + lname + " " + course + " " + year);
    var json_data = "{\"fname\":\"" + fname + "\",\"lname\":\"" + lname + "\",\"course\":\"" + course + "\",\"year\":\"" + year + "\"}";
    var msg = "data=" + encodeURIComponent(json_data);
    var url = "test_mongo.php?action=add&fname="+fname+"&lname="+lname+"&course="+course+"&year="+year;
    resp = function(response){
        document.getElementById("response").innerHTML = response; 
	}
    xmlhttpPost (url, msg, resp); 
}

function fn_search(){
    var course  = document.getElementById("course").value;
    var json_data = "{\"course\":\"" + course + "\"}";
    var msg = "data=" + encodeURIComponent(json_data);
    var url = "test_mongo.php?action=search&course="+course;
    resp = function(response){
        document.getElementById("response").innerHTML = response; 
	}
    xmlhttpPost (url, msg, resp); 
}

function fn_delete(){
    var course  = document.getElementById("lname").value;
    var json_data = "{\"lname\":\"" + course + "\"}";
    var msg = "data=" + encodeURIComponent(json_data);
    var url = "test_mongo.php?action=delete&lname="+course;
    resp = function(response){
        document.getElementById("response").innerHTML = response; 
	}
    xmlhttpPost (url, msg, resp); 
}


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