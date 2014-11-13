/**
 *
 * Purpose: For all the interaction javascript in cart system.
 * @author Rodolfo Navalon
 * @since 0.2
 */
var timer = 0;

/**
 * The main fucntion when a button is pressed and identify what type is a button that was pressed
 * @param v - the value
 * @param id - the id of the button that was pressed
 * **/
function toPerform(v,id)
{
	if(v.value === "Save") 
	{
		toEdit(v,id); 
	} 
	else if(v.value === "Edit") 
	{
		toSave(v,id);
	}
	
}

/**
 * When a save button is pressed this function will perform to save all the data that was editted in the input box
 * 
 * @param v - the value
 * @param id - the id of the button that was pressed
 * **/
function toSave(v,id) 
{
	v.className = 'save-button'
	v.value = 'Save'
		
	var smallV = document.getElementById('ismall'+id).getElementsByTagName('span')[0].innerHTML;
	var mediumV = document.getElementById('imedium'+id).getElementsByTagName('span')[0].innerHTML;
	var largeV = document.getElementById('ilarge'+id).getElementsByTagName('span')[0].innerHTML;
	var xLargeV = document.getElementById('ixlarge'+id).getElementsByTagName('span')[0].innerHTML;
	
	
	document.getElementById('ismall'+id).innerHTML = createInputString(smallV);
	document.getElementById('imedium'+id).innerHTML = createInputString(mediumV);
	document.getElementById('ilarge'+id).innerHTML = createInputString(largeV);
	document.getElementById('ixlarge'+id).innerHTML = createInputString(xLargeV);
}

/**
 * When a edit button is pressed.
 * This function will perform to edit the pizza cart and transform all the text to input boxes.
 * 
 * @param v - the value
 * @param id - the id of the button that was pressed
 * **/
function toEdit(v,id) 
{
	var xmlhttp;
	
	var smallV = document.getElementById('ismall'+id).getElementsByTagName('input')[0].value;
	var mediumV = document.getElementById('imedium'+id).getElementsByTagName('input')[0].value;
	var largeV = document.getElementById('ilarge'+id).getElementsByTagName('input')[0].value;
	var xLargeV = document.getElementById('ixlarge'+id).getElementsByTagName('input')[0].value;
	
	if(isNaN(smallV) || isNaN(mediumV) || isNaN(largeV) || isNaN(xLargeV)){
		callNotication("WARNING: Must Input Number", 1);
		return false;
	}
	
	if(smallV < 0 || mediumV < 0 || largeV < 0|| xLargeV < 0){
		callNotication("WARNING: Must be a Positive Number", 1);
		return false;
	}
	
	v.className = 'edit-button'
	v.value = 'Edit'
	
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHttp");
	}
	
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{			
			document.getElementById('ismall'+id).innerHTML = createSpanString(smallV);
			document.getElementById('imedium'+id).innerHTML = createSpanString(mediumV);
			document.getElementById('ilarge'+id).innerHTML = createSpanString(largeV);
			document.getElementById('ixlarge'+id).innerHTML = createSpanString(xLargeV);
			
			callNotication("Pizza Price Update", 0);
		}
	}
	
	xmlhttp.open("GET", "http://" + window.location.host + "/webapplicationProject/updatedata?adminedit=y&pizzaid="+ id +"&s="+ smallV +"&m="+ mediumV +"&l="+ largeV +"&xl="+ xLargeV +"");
	xmlhttp.send();
}

/**
 * Create a span string
 * 
 * @param v - the string to be created
 * @returns the created span string with the value as its value inside of it.
 * **/
function createSpanString(value)
{
	return "<span>" + value + "</span>";
}

/**
 * Create a input string
 * 
 * @param v - the string to be created
 * @returns the created input string with the value as its value inside of it.
 * **/
function createInputString(value)
{
	return '<input type="text" value='+ value + ' maxlength="5" size="5"/>'
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
 * Hide the notification when another notification is going in.
 * **/
function hideFloatinNotif(){
	document.getElementById('floating-notif').setAttribute("style", "display:none;");
}
