<!-- 
Purpose: User Login for store employess to get all the order from the database.
Author: Rodolfo Navalon  
Added in Version: 0.2
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang,
                 Utilities.ContextVariable" %>
                 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%
		request.getSession().setAttribute("page", ContextVariable.Page.STORELOGIN);
		if(session.getAttribute("store") != null)
			response.sendRedirect(request.getContextPath()+"/webapp/mainpage/store/orderlist.jsp");
	%>
<head>
<meta charset="UTF-8">
<title>Store Login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headerfooter.css"  type="text/css" />
</head>
<body>

	 <%@ include file="/includes/header_title.jsp" %>

	 <%
	     ResourceBundle RB = MultiLang.generateResourceBdl(request,session);
	     String greeting = RB.getString("language");
	 %>
	 
	
	<div class="master-container">
		<%@ include file="/includes/header_menu.jsp" %>
		<div class="parent-container" style="margin-top:200px">
			<form id="effectsExplode" class="form-1" method="POST" action="${pageContext.request.contextPath}/storelogin">
				<p class="field">
					<input type="text" name="storeid" placeholder="<%= RB.getString("storeid") %>">
					<i class="icon-user icon-large"></i>
				</p>
				<p class="field">
					<input type="password" name="password" placeholder="<%= RB.getString("password") %>">
					<i class="icon-lock icon-large"></i>
				</p>
				<p class="submit">
					<button class="submitButton" id="buttonexplode" type="submit" name="loginsubmit" >
						<i class="icon-arrow-right icon-large"><%= RB.getString("login") %></i>
					</button>
				</p>
			</form>
		</div> 	

	</div>
	
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>