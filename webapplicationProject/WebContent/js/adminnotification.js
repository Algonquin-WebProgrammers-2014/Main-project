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
		//location.reload();
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

function sendMessage()
{
	var message = document.getElementById('commentbox').value;
	if(message != ''){
		document.getElementById('commentbox').value ="";
		Status.socket.send(message);
	}
}