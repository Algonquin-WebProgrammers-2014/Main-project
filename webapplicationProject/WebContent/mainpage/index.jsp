<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle,
    Utilities.MultiLang" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Header to be used in different pages -->
<head>
	<head>
		<link href="${pageContext.request.contextPath}/css/headerfooter.css" rel="stylesheet" type="text/css" />
		<title>Pizza Ordering System Title Here</title>
	</head>
</head>

<body>
	 <%
	     ResourceBundle RB = MultiLang.generateResourceBdl(request);
	     String greeting = RB.getString("language");
	 %>
	 
	<%@ include file="/includes/header.jsp" %>
	
	<div id='content'>
		<img src="${pageContext.request.contextPath }/icon/frontpagepizza.jpg"></img>
	</div>
	
</body>
</html>