<!-- 
	Purpose: The Map of the store
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
<head>
<meta charset="UTF-8">
<title>Find Us</title>

<link rel="shortcut icon" href="/favicon.ico" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/findus.css">
<link href="${pageContext.request.contextPath}/css/headerfooter.css" rel="stylesheet" type="text/css" />

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>

</head>
<body>

	<%@ include file="/includes/header_title.jsp" %>


	 <%
	 	 request.getSession().setAttribute("page", ContextVariable.Page.FINDUS);
	     ResourceBundle RB = MultiLang.generateResourceBdl(request,session);
	     String greeting = RB.getString("language");
	 %>
	 
	
	<div class="master-container">
			<%@ include file="/includes/header_menu.jsp" %>
			<div id="findus-main-table-container" onload="staticLocationImage(this)"></div>
<!-- 			<div id="find-us-map" style="float:left;height:800px; width:100%;"></div> -->
			
	</div>
	
	<%@ include file="/includes/footer.jsp" %>
	
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/findus.js"></script>

</html>