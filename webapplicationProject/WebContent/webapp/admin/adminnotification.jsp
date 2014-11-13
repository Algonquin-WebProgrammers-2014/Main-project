<!-- 
	Purpose: The admin notification
	Author: Rodolfo Navalon
	Added in Version: 0.2
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang,Utilities.ContextVariable" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/icon/webicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headerfooter.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notif.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminnotification.css">
	
	<title>Admin</title>
</head>
<body>

	<c:if test="${sessionScope.admin == null}">
		<c:redirect url="../verification/admin"/>
	</c:if>
		
	<%
	    ResourceBundle RB = MultiLang.generateResourceBdl(request,session);
	    String greeting = RB.getString("language");
	 %>
	 
	 <div id="header-parent">
	  	<div id=header>		
				<div id=header-title><img src="${pageContext.request.contextPath}/icon/pizza2.png"><span><%= RB.getString("appname") %></span></div>
		</div>
	 </div>

	<div class='master-container'>
	
		<div id='menu'>
				<ul>
					<li><a class='styleanchor' href="${pageContext.request.contextPath}/webapp/admin/">Edit Pizza Price</a></li><!--  
					--><li><a class='styleanchor' href="${pageContext.request.contextPath}/webapp/admin/adminnotification.jsp">Website Notification</a></li>
				</ul>	
		</div>

		<div class="commentboxcontainer">
				<h1>Website Notification</h1>
	        <div class="textbox-container">
	            <textarea id="commentbox"  class="commentbox"></textarea>
	        </div>
	        <button class="notificationboxsubmit" id="notificationboxsubmit" type="submit" onclick="sendMessage()" name="loginsubmit" >
				<i class="icon-arrow-right icon-large">Notify Clients</i>
			</button>
    	</div>
	
	</div>
	
	<%@ include file="/includes/footer.jsp" %>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/adminnotification.js"></script>
</body>
</html>