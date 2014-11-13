
"use strict"

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
		Status.socket.send("l");
		var path = "http://" + window.location.host + "/webapplicationProject/webapp/mainpage/status";
		document.location.href = path;
	}
	
	Status.socket.onclose = function (){
		alert('socket is closed');
	}
	
	Status.socket.onmessage = function(message){
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