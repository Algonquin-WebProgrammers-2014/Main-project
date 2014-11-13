/**
 * 
 */

var Status = {};

Status.socket = null;

Status.connect = (function(host) {
	
	if('WebSocket' in window){
		Status.socket = new WebSocket(host);
	} else if('MozWebSocket' in window) {
		Status.socket = new MozWebSocket(host);
	} else {
		alert("no websocket instance was found");
	}
	
	Status.socket.onopen = function(){
	}
	
	Status.socket.onclose = function (){
		alert('socket is closed');
	}
	
	Status.socket.onmessage = function(message){
		location.reload();
	}
});

Status.initialized = function(){
	if(window.location.protocol == 'http:') {
		Status.connect('ws://'+ window.location.host + '/webapplicationProject/statusupdate/');
	} else {
		Status.connect('wss://' + window.location.host + '/webapplicationProject/statusupdate/');
	}
};

Status.initialized();

function info(elem) {
//	alert(elem.id);
	var id = elem.id;
	var div = document.getElementById("info"+id);
	if(div.style.display == "block") {
		div.style.display='none';
	} else {
		div.style.display='block';
	}
}

function clearOrder(elem) {
	var data = '4:'+elem.id;
	Status.socket.send(data);
	location.reload();
}

function order(elem){
//	var path = "http://" + window.location.host + "/webapplicationProject/updatedata?status=0&id="+elem.id;
//	document.location.href = path;
	var data = '0:'+elem.id;
	Status.socket.send(data);
	location.reload();
}

function prep(elem){
//	var path = "http://" + window.location.host + "/webapplicationProject/updatedata?status=1&id="+elem.id;
//	document.location.href = path;
	var data = '1:'+elem.id;
	Status.socket.send(data);
	location.reload();
}
function bake(elem){
//	var path = "http://" + window.location.host + "/webapplicationProject/updatedata?status=2&id="+elem.id;
//	document.location.href = path;
	var data = '2:'+elem.id;
	Status.socket.send(data);
	location.reload();
}
function out(elem){
//	var path = "http://" + window.location.host + "/webapplicationProject/updatedata?status=3&id="+elem.id;
//	document.location.href = path;
	var data = '3:'+elem.id;
	Status.socket.send(data);
	location.reload();
}

function storeLogout(){
	var path = "http://" + window.location.host + "/webapplicationProject/storelogin?storelogout=y";
	document.location.href = path;
}