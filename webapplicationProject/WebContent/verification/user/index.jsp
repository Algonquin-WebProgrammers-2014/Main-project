<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<link href="${pageContext.request.contextPath}/css/headerfooter.css" rel="stylesheet" type="text/css" />

</head>
<body>

	 <%
	     ResourceBundle RB = MultiLang.generateResourceBdl(request);
	     String greeting = RB.getString("language");
	 %>
	<div id=header>
		<h1><%= RB.getString("appname") %></h1>
	</div>
	<div id='menu'>
		<ul>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/mainpage/"><%= RB.getString("home") %></a></li>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/verification/user/"><%= RB.getString("ordernow") %></a></li>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/verification/user/">Replace this LOL</a></li>
			<li><a class='styleanchor' href=index.html>Replace this LOL</a></li>
			<li><a class='styleanchor' href=index.html>Replace this LOL</a></li>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/verification/store/"><%= RB.getString("storelogin") %></a></li>
		</ul>	
	</div>
	
	<div class="parent-container">
	
		<form id="effectsExplode" class="form-1" method="POST" action="${pageContext.request.contextPath}/userlogin">
			<p class="field">
				<input type="text" name="first_name" placeholder="<%= RB.getString("username") %>">
				<i class="icon-user icon-large"></i>
			</p>
			<p class="field">
				<input type="password" name="last_name" placeholder="<%= RB.getString("password") %>">
				<i class="icon-lock icon-large"></i>	
			</p>
			<p class="submit">
				<button class="submitButton" id="buttonexplode" type="submit" name="loginsubmit" >
					<i class="icon-arrow-right icon-large"><%= RB.getString("login") %></i>
				</button>
			</p>
			<p class="create">
				<button class="submitButton" id="buttonexplode" type="submit" name="loginsubmit" >
					<i class="icon-arrow-right icon-large"><%= RB.getString("createaccount") %></i>
				</button>
			</p>
	
		</form>
		
		<div class="child-div-or">
				<a class="child-a-or">or</a>
		</div>
		
		<form id="effectsExplode" class="form-1" method="POST" action="${pageContext.request.contextPath}/userlogin">
			<p class="field">
				<input type="text" name="first_name" placeholder="<%= RB.getString("phone") %>">
				<i class="icon-user icon-large"></i>
			</p>
			
			<p class="submit">
				<button class="submitButton" id="buttonexplode" type="submit" name="loginsubmit" >
					<i class="icon-arrow-right icon-large"><%= RB.getString("enter") %></i>
				</button>
			</p>
	
		</form>
	</div>
	
	
</body>
</html>