<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
	     ResourceBundle RBheader = MultiLang.generateResourceBdl(request);
	 %>
	<div id="header-parent">
	  	<div id=header>		
	  			<div id=header-cart>
	  				<div id="cart-title">
						<span>items: 0</span><br/>
						<span>pizza cart</span>
					</div>
					<div id="cart-icon"><img id="cart-image" src="${pageContext.request.contextPath}/icon/shopping-cart.PNG" onclick="gotomain()"></div>
				</div>
				<div id=header-title><img src="${pageContext.request.contextPath}/icon/pizza2.png"><span><%= RBheader.getString("appname") %></span></div>
				
		</div>
	</div>
	
	<script>
	document.getElementById('header-title').onclick = function(){
		var path = "http://" + window.location.host + "/webapplicationProject/mainpage/";
		document.location.href = path;
	}
	
	function gotomain(){
		var path = "http://" + window.location.host + "/webapplicationProject/mainpage/";
		document.location.href = path;
	}
	</script>