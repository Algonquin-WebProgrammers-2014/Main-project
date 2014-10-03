<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle,Utilities.MultiLang,Utilities.ContextVariable" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Header to be used in different pages -->
<head>
	<head>
	    <link rel="shortcut icon" href="${pageContext.request.contextPath}/icon/webicon.ico" >
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headerfooter.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
		<title>Pizza Ordering System Title Here</title>
	</head>
</head>

<body>
	 <%
	 	 request.getSession().setAttribute("page", ContextVariable.Page.MENU);
	     ResourceBundle RB = MultiLang.generateResourceBdl(request);
	     String greeting = RB.getString("language");
	 %>
	 
	<%@ include file="/includes/header_title.jsp" %>
	
	<div class='master-container'>
		<%@ include file="/includes/header_menu.jsp" %>
		
		<table class="menu-table">
			<tr>
					<th><div class="pizza-title">House Pizza</div>
					
					<div class="image-info">
						<img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/house.jpg">
						<div class="pizza-hint">I am an if of pizza okfds fdsfs dfsdf sf sdfsdfie jfasdfasd</div>
					</div>					
						<table>
							<tr>
								<th>
									<img title="fdsaklfsldk;fj" src="${pageContext.request.contextPath}/sizeimage/small.png">
								</th>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/medium.png">
								</th>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/large.png">
								</th>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/xlarge.png">
								</th>
							</tr>
							<tr>
								<th>
									<span>$12.99</span>
								</th>
								<th>
									<span>$12.99</span>
								</th>
								<th>
									<span>$12.99</span>
								</th>
								<th>
									<span>$12.99</span>
								</th>
							</tr>
						</table>
					</th>
					<th><div class="pizza-title">Billy’s Pizza</div><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/house.jpg">
						<table>
							<tr>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/small.png">
								</th>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/medium.png">
								</th>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/large.png">
								</th>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/xlarge.png">
								</th>
							</tr>
							<tr>
								<th>
									<span>$12.99</span>
								</th>
								<th>
									<span>$12.99</span>
								</th>
								<th>
									<span>$12.99</span>
								</th>
								<th>
									<span>$12.99</span>
								</th>
							</tr>
						</table>
					</th>
					<th><div class="pizza-title">Veggie Pizza</div><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/house.jpg">
						<table>
							<tr>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/small.png">
								</th>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/medium.png">
								</th>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/large.png">
								</th>
								<th>
									<img src="${pageContext.request.contextPath}/sizeimage/xlarge.png">
								</th>
							</tr>
							<tr>
								<th>
									<span>$12.99</span>
								</th>
								<th>
									<span>$12.99</span>
								</th>
								<th>
									<span>$12.99</span>
								</th>
								<th>
									<span>$12.99</span>
								</th>
							</tr>
						</table>
					</th>
			</tr>
			<tr>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/bounty_hunter.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/bounty_hunter.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/bounty_hunter.png"></th>
			</tr>
			<tr>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/drow_ranger.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/drow_ranger.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/drow_ranger.png"></th>
			</tr>
			<tr>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/faceless_void.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/faceless_void.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/faceless_void.png"></th>
			</tr>
			<tr>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/luna.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/luna.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/luna.png"></th>
			</tr>
			<tr>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/mirana.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/mirana.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/mirana.png"></th>
			</tr>
			<tr>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/morphling.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/morphling.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/morphling.png"></th>
			</tr>
			<tr>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/phantom_lancer.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/phantom_lancer.png"></th>
					<th><img id="cart-image" src="${pageContext.request.contextPath}/pizzaimage/phantom_lancer.png"></th>
			</tr>
		</table>
		
	</div>
	
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>