<!-- 
	Purpose: The admin
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notif.css">
	
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
	
	<sql:setDataSource var="pizzadata" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:8888/storedb" user="rodolfouser" password="poldz123"/>
	<sql:query dataSource="${pizzadata}" var="pizzalist">
		SELECT * FROM special_pizza_list
	</sql:query>
		
		<div class="parent-cart-table" style="padding-top:20px">
			<h1>Edit Pizza Prices</h1>
			<table class="cart-table" style="table-layout: fixed;">
				<thead>
					<tr>
						<th><%=RB.getString("pizza") %></th>
						<th><%=RB.getString("small") %></th>
						<th><%=RB.getString("medium") %></th>
						<th><%=RB.getString("large") %></th>		
						<th><%=RB.getString("xlarge") %></th>	
						<th></th>
					</tr>
				</thead>
				
				<c:forEach var="pizza" items="${pizzalist.rows}">
					<tr class="pizza-size">
						<th>${pizza.name}</th>	
						<sql:query dataSource="${pizzadata}" var="sizelist">
							SELECT * FROM special_pizza_price WHERE idspecial_pizza_price = ${pizza.special_pizza_price_idspecial_pizza_price}
						</sql:query>
						
						<c:forEach var="price" items="${sizelist.rows}">
							<th id = "ismall${price.idspecial_pizza_price}" class="count">
								<span><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${price.small }"/></span>
							</th>
							<th id = "imedium${price.idspecial_pizza_price}" class="count">
								<span><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${price.medium }"/></span>
							</th>
							<th id = "ilarge${price.idspecial_pizza_price}" class="count">
								<span><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${price.large }"/></span>
							</th>
							<th id = "ixlarge${price.idspecial_pizza_price}" class="count">
								<span><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${price.xlarge }"/></span>
							</th>
							<th class="pizza-count-edit"><input type="button" class="edit-button" value="Edit" maxlength="2" size="2" onclick="toPerform(this, '${price.idspecial_pizza_price}')"/></th>
						</c:forEach>
					</tr>
				</c:forEach>
					
			</table>
		</div>
	</div>
	
	<%@ include file="/includes/footer.jsp" %>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>