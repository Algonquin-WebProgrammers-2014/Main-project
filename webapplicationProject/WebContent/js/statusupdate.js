/**
 * 
 */

"use strict"

var timer = 0;

var Status = {};

Status.socket = null;
var notif = document.getElementById('quack');

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
		
		var data = message.data.split(":");
		if(data[0] != '4')
		{
			notif.currentTime = 0;
			notif.load();
			notif.play();
		}
		
		if(data[0] == 5)
			doServerNotification(data[1]);
		else
			callNoticationStatus("Order is updated: ",data[0]);
		
		var elem = document.getElementById('status');
		if(elem)
		{
			var status = parseInt(data[0]);
			if(status == 4)
				location.reload();
			else if(status < 4)
				updateStatus(status);
		}
	}
});


function isPlaying(playerId) {
    var player = document.getElementById(playerId);
    return !player.paused && !player.ended && 0 < player.currentTime;
}

/**
 * Call the notification.jsp to be printed on top of the page
 * 
 * @param s - the string to be printed in the notification
 * @param t - the type of notification either warning(red) or success(green)
 * @returns the created input string with the value as its value inside of it.
 * **/
function callNoticationStatus(s,t){
	
	if(timer)
	{
		clearTimeout(timer);
		timer = 0;
	}
	

	if(t == '0')
	{
		document.getElementById('floating-notif').innerHTML = s + "ORDER DELIVERED TO STORE";
		document.getElementById('floating-notif').className = 'floating-notif-order';
		document.getElementById('floating-notif').setAttribute("style", "color:#fff;display:block; animation: fadein 0.5s;-moz-animation: fadein 0.5s; -webkit-animation: fadein 0.5s;-o-animation: fadein 0.5s;");
	} else if(t == '1') {
		document.getElementById('floating-notif').innerHTML = s + "PREPPING PIZZA";
		document.getElementById('floating-notif').className = 'floating-notif-prep';
		document.getElementById('floating-notif').setAttribute("style", "color:#fff;display:block; animation: fadein 0.5s;-moz-animation: fadein 0.5s; -webkit-animation: fadein 0.5s;-o-animation: fadein 0.5s;");
	} else if(t == '2') {
		document.getElementById('floating-notif').innerHTML = s + "BAKING PIZZA";
		document.getElementById('floating-notif').className = 'floating-notif-bake';
		document.getElementById('floating-notif').setAttribute("style", "color:#fff;display:block; animation: fadein 0.5s;-moz-animation: fadein 0.5s; -webkit-animation: fadein 0.5s;-o-animation: fadein 0.5s;");
	} else if(t == '3') {
		document.getElementById('floating-notif').innerHTML = s + "OUT FOR DELIVERY";
		document.getElementById('floating-notif').className = 'floating-notif-out';
		document.getElementById('floating-notif').setAttribute("style", "color:#fff; display:block; animation: fadein 0.5s;-moz-animation: fadein 0.5s; -webkit-animation: fadein 0.5s;-o-animation: fadein 0.5s;");
	} else {
		
	}
	
	timer = setTimeout(hideFloatinNotifStatus, 2000);
}

/**
 * Hide the notification when another notification is going in.
 * **/
function hideFloatinNotifStatus(){
	document.getElementById('floating-notif').setAttribute("style", "display:none;");
}

function doServerNotification(message){
	if(timer)
	{
		clearTimeout(timer);
		timer = 0;
	}
	
	document.getElementById('floating-notif').innerHTML = "Server Message: <span style='color:#000000'>" + message + "</span>";
	document.getElementById('floating-notif').className = 'floating-notif';
	document.getElementById('floating-notif').setAttribute("style", "color:#fff; display:block; animation: fadein 0.5s;-moz-animation: fadein 0.5s; -webkit-animation: fadein 0.5s;-o-animation: fadein 0.5s;");
	
	timer = setTimeout(hideFloatinNotifStatus, 4000);
}

function updateStatus(data){
	if(data >= 0)
		document.getElementById('order').className = 'check-mark-selected';
	else
		document.getElementById('order').className = 'check-mark';
	if(data >= 1)
		document.getElementById('prep').className = 'check-mark-selected';
	else
		document.getElementById('prep').className = 'check-mark';
	if(data >= 2)
		document.getElementById('bake').className = 'check-mark-selected';
	else
		document.getElementById('bake').className = 'check-mark';
	if(data >= 3)
		document.getElementById('out').className = 'check-mark-selected';
	else
		document.getElementById('out').className = 'check-mark';
}

Status.initialized = function(){
	if(window.location.protocol == 'http:') {
		Status.connect('ws://'+ window.location.host + '/webapplicationProject/statusupdate/');
	} else {
		Status.connect('wss://' + window.location.host + '/webapplicationProject/statusupdate/');
	}
};

Status.initialized();