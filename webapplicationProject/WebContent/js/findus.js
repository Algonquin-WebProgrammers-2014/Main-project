/**
 * 
 */

var map;

window.onload = function() {
	var xmlhttp;
	
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	} else 
	{
		xmlhttp = new ActiveXObject("Microsoft.XMLHttp");
	}
	
	xmlhttp.onreadystatechange = function() 
	{
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{
			document.getElementById("findus-main-table-container").innerHTML=xmlhttp.responseText;
		}
	}
	
	xmlhttp.open("GET", "http://" + window.location.host + "/webapplicationProject/storelocation");
	xmlhttp.send();
}


function initialize() {
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644)
  };
  
  map = new google.maps.Map(document.getElementById('find-us-map'),
      mapOptions);
}

google.maps.event.addDomListener(window, 'load', initialize);

function swap() {
	var win = window.open("http://google.com/maps?q=k1j+8v6&zoom=18", '_blank');
	win.focus();
}

