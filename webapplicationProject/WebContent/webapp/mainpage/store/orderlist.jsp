
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,
				 Utilities.DatabaseConnection,
				 java.sql.Statement,
				 java.sql.ResultSet,
				 java.util.ResourceBundle,
                 Utilities.MultiLang,
				 java.sql.SQLException" %>
				 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
		ResourceBundle RB2 = MultiLang.generateDatabaseResourceBdl();
		if(session.getAttribute("store") == null)
			response.sendRedirect(request.getContextPath()+"/webapp/verification/store/");
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="refresh" content="4; URL=http://localhost:8080/webapplicationProject/webapp/mainpage/store/orderlist.jsp"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderlist.css"/>
<title>STORE</title>
</head>
<body>
<div class="parent-div">

	<sql:setDataSource var="orderlist" driver="com.mysql.jdbc.Driver" url='<%= RB2.getString("db") %>' user='<%= RB2.getString("username") %>' password='<%= RB2.getString("password") %>'/>
		
	<sql:query dataSource="${orderlist}" var="result">
			SELECT * FROM storedb.order
	</sql:query>

	<div style="margin:0 auto 0; text-align: center; font-size: 40px" >
	<button style="float: right;" onclick="storeLogout()"><span>logout</span></button>
		<span>Store Orders</span>
	</div>

	<c:forEach var="order" items="${result.rows}">
		<div class="child-div">
				<div class="right-container">
					<button type="button" class="child-div-button-blue" id="${order.order_id}" onclick="info(this)">
						<i>Info</i>
					</button><br/>
					<button type="button" class="child-div-button-orange" id="${order.order_id}" onclick="clearOrder(this)">
						<i>Clear Order</i>
					</button>
					
				</div>
				<div class="right-container-status" >
					<div>
					
						<sql:query dataSource="${orderlist}" var="statuss">
								SELECT * FROM storedb.order WHERE order_id = '${order.order_id}'
						</sql:query>
						
						<c:forEach var="status" items="${statuss.rows}">
								<c:choose> 
								  <c:when test="${(status.status) >= 0}">
								  	<c:set value="check-mark-selected" var="orderpizza"></c:set>
								  </c:when>
								  <c:otherwise>
								  	<c:set value="check-mark" var="orderpizza"></c:set>
								  </c:otherwise>
								</c:choose>
								
								<c:choose> 
								  <c:when test="${(status.status) >= 1}">
								  	<c:set value="check-mark-selected" var="prep"></c:set>
								  </c:when>
								  <c:otherwise>
								  	<c:set value="check-mark" var="prep"></c:set>
								  </c:otherwise>
								</c:choose>
								
								<c:choose> 
								  <c:when test="${(status.status) >= 2}">
								  	<c:set value="check-mark-selected" var="bake"></c:set>
								  </c:when>
								  <c:otherwise>
								  	<c:set value="check-mark" var="bake"></c:set>
								  </c:otherwise>
								</c:choose>
								
								<c:choose> 
								  <c:when test="${(status.status) >= 3}">
								  	<c:set value="check-mark-selected" var="out"></c:set>
								  </c:when>
								  <c:otherwise>
								  	<c:set value="check-mark" var="out"></c:set>
								  </c:otherwise>
								</c:choose>
							</c:forEach>
						
						<table>
							<tr>
								<td class="order-delivered">
									<div id="${order.order_id}" onclick="order(this)">
										<i>order</i><br/><i>delivered</i><br/>
										<a class="${orderpizza}" >✔</a>
									</div>				
								</td>
								<td class="prep-pizza" >
									<div id="${order.order_id}" onclick="prep(this)">
										<i>prep</i><br/><i>pizza</i><br/>
										<a class="${prep}">✔</a>
									</div>									
								</td>
								<td class="bake-pizza" id="${order.order_id}" onclick="bake(this)">
									<div>
										<i>bake</i><br/><i>pizza</i><br/>
										<a class="${bake}">✔</a>
									</div>
								</td>
								<td class="out-for-deliver" id="${order.order_id}" onclick="out(this)">
									<div>
										<i>out for</i><br/><i>delivery</i><br/>
										<a class="${out}">✔</a>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="left-container">
					<i >Order ID:</i><i style="color: blue; font-weight: bold;"> <c:out value="${order.order_id}"/></i><br/>
					<div>Special Pizza:</div>
					<table class="t1">
					  <thead>
					    <tr>
						    <th>Item</th>
						    <th>Count</th>
						    <th>Size</th>
					    </tr>
					  </thead>
					  
					  
					  <sql:query dataSource="${orderlist}" var="pizzas">
									SELECT * FROM pizza WHERE order_order_id = '${order.order_id}'
					  </sql:query>
					  
					  <c:forEach var="pizza" items="${pizzas.rows}">
					  	<tr>
						    <td>${pizza.special_pizza_list_idspecial_pizza_list}</td>
						    <td>${pizza.quantity}</td>
						    <td>${pizza.size}</td>
					  	</tr>
					  </c:forEach>
					  
					 
					</table>
					<div>Topping Pizza:</div>
					
					<table class="t2">
					  <thead>
					    <tr>
						    <th>Item</th>
						    <th>Size</th>
						    <th>Topping</th>
					    </tr>
					  </thead>
					</table>
					
				</div>
			</div>
			<div class="child-info-div" id="info${order.order_id}">
			
				<sql:query dataSource="${orderlist}" var="customers">
					SELECT * FROM customer WHERE customer_id = '${order.customer_id}'
				</sql:query>
				
				<c:forEach var="customer" items="${customers.rows}">
					<i>Name: <c:out value="${customer.first_name}"/> <c:out value="${customer.last_name}"/></i><br/>
					<i>Phone Number: <c:out value="${customer.phone}"/></i><br/>
					<i>Address: <c:out value="${customer.address}"/></i>
				</c:forEach>
					  
			</div>
	</c:forEach>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/orderlist.js"></script>
</body>
</html>