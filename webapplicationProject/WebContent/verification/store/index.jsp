<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang" %>
                 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%
		if(session.getAttribute("store") != null)
			response.sendRedirect(request.getContextPath()+"/mainpage/store/orderlist.jsp");
	%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headerfooter.css"  type="text/css" />
</head>
<body>
	 <%
	     ResourceBundle RB = MultiLang.generateResourceBdl(request);
	     String greeting = RB.getString("language");
	 %>
	
	<%@ include file="/includes/header.jsp" %>
	 
	 <h2>Language: </h2><p style="font-size: 20px">(<%= greeting %>)</p>
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

</body>
</html>