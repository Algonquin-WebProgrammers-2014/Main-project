<!-- 
	Purpose: The Pizza Title on the very top of the page with the name of the store and the cart system
	Author: Rodolfo Navalon
	Added in Version: 0.2
-->

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ResourceBundle,
 				 Utilities.MultiLang,
 				 Utilities.PizzaCollection" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
		if(session.getAttribute("lang") == null){
			response.sendRedirect(request.getContextPath()+"/");
			return;
		} 
	     ResourceBundle RBheader = MultiLang.generateResourceBdl(request,session);
	 %>
	 <audio src="${pageContext.request.contextPath}/audio/success.mp3" id="quack" autostart="false"></audio>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/statusupdate.js"></script>
	 
	<div id="header-parent">
	  	<div id=header>		
	  			<div id=header-cart>
	  				<div id="cart-title">
						<%=RBheader.getString("items") %>: <span id="pizza-cart-item-number"> <c:choose> <c:when test="${sessionScope.cart != null}">${sessionScope.cart.size}</c:when><c:otherwise>0</c:otherwise> </c:choose> </span><br/>
						<span><%=RBheader.getString("pizzacart") %></span>
					</div>
					<div id="cart-icon"><img id="cart-image" src="${pageContext.request.contextPath}/icon/shopping-cart.PNG" onclick="gotocart()"></div>
				</div>
				<div id="notification-table" class="notification-table">notification: <span id="notification-number">1</span></div>
				<div id=header-title><img src="${pageContext.request.contextPath}/icon/pizza2.png"><span><%= RBheader.getString("appname") %></span></div>
		</div>
	</div>
	
	<script>
	
	document.getElementById('header-title').onclick = function(){
		var path = "http://" + window.location.host + "/webapplicationProject/webapp/mainpage";
		document.location.href = path;
	}
	
	document.getElementById('notification-table').onclick = function(){
		
	}
	
	function gotocart(){
		var path = "http://" + window.location.host + "/webapplicationProject/webapp/mainpage/cart/";
		document.location.href = path;
	}
	</script>