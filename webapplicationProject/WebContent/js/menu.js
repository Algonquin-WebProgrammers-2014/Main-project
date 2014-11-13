/**
 *
 * Purpose: For all the interaction javascript in menu
 * @author Rodolfo Navalon
 * @since 0.2
 */
var timer = 0;

/**
 * Add the specified item to the cart
 * 
 * @param id - the id of the button that was pressed
 * **/
function addToCart(id){
//	alert(document.getElementById('pizza-title'+id).innerHTML);
	
	var xmlhttp;
	var initial = document.getElementById("pizza-title"+id).getAttribute('initial');
	var name = document.getElementById("pizza-title"+id).getAttribute('pizza');
	var type = document.getElementById("pizza-title"+id).getAttribute('type');
	
	var small = document.getElementById("ismall"+id).value;
	var medium = document.getElementById("imedium"+id).value;
	var large = document.getElementById("ilarge"+id).value;
	var xlarge = document.getElementById("ixlarge"+id).value;
	
	if(isNaN(small) || isNaN(medium) || isNaN(large) || isNaN(xlarge)){
		callNotication("Must Input Number",1);
		resetInput(id);
		return false;
	}
	
	if(small == '')
		small = 0+"";
	if(medium == '')
		medium = 0+"";
	if(large == '')
		large = 0+"";
	if(xlarge == '')
		xlarge = 0+"";
	
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	} else 
	{
		xmlhttp = new ActiveXObject('Microsoft.XMLHTTP')
	}
	
	xmlhttp.onreadystatechange = function() 
	{
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{
			document.getElementById("pizza-cart-item-number").innerHTML=xmlhttp.responseText;
			callNotication((saveParseString(small) + saveParseString(medium) + saveParseString(large) + saveParseString(xlarge)) + " new items added to the pizza cart", 0);
		}
	}
	
	xmlhttp.open("GET", "http://" + window.location.host + "/webapplicationProject/cartupdate?type="+ type +"&name="+ name +"&initial=" + initial + "&s=" + small + "&m=" + medium + "&l=" + large + "&xl=" + xlarge + "&timeStamp="+new Date().getTime());
	xmlhttp.send();
	
	resetInput(id);
	
}

/**
 * Call the notification.jsp to be printed on top of the page
 * 
 * @param s - the string to be printed in the notification
 * @param t - the type of notification either warning(red) or success(green)
 * @returns the created input string with the value as its value inside of it.
 * **/
function callNotication(s,t){
	
	if(timer)
	{
		clearTimeout(timer);
		timer = 0;
	}
	
	document.getElementById('floating-notif').innerHTML = s;

	if(t == 1)
	{
		document.getElementById('floating-notif').className = 'error-notif';
		document.getElementById('floating-notif').setAttribute("style", "color:white;display:block; animation: fadein 0.5s;-moz-animation: fadein 0.5s; -webkit-animation: fadein 0.5s;-o-animation: fadein 0.5s;");
	} else {
		document.getElementById('floating-notif').className = 'floating-notif';
		document.getElementById('floating-notif').setAttribute("style", "color:black;display:block; animation: fadein 0.5s;-moz-animation: fadein 0.5s; -webkit-animation: fadein 0.5s;-o-animation: fadein 0.5s;");
	}
	
	timer = setTimeout(hideFloatinNotif, 3000);
}

/**
 * Reset the inputs to 0's
 * 
 * @param id - the id of the button that was pressed
 * **/

function resetInput(id){
	document.getElementById("ismall"+id).value = '';
	document.getElementById("imedium"+id).value = '';
	document.getElementById("ilarge"+id).value = '';
	document.getElementById("ixlarge"+id).value = '';
}

/**
 * If the string is empty it will return 0 or else will return the number that was inside the input box
 * 
 * @param s - the string that need to be parsed
 * **/
function saveParseString(s){
	if(!s)
		return 0;
	else
		return parseInt(s);
} 

/**
 * Hide the notification when another notification is going in.
 * **/
function hideFloatinNotif(){
	document.getElementById('floating-notif').setAttribute("style", "display:none;");

}