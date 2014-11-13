<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang,
                 Utilities.ContextVariable" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/icon/webicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headerfooter.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notif.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/status.css"/>
	
	<title>Status</title>
</head>
<body>
	<%@ include file="/includes/header_title.jsp" %>
	
	<%
	    ResourceBundle RB = MultiLang.generateResourceBdl(request,session);
		ResourceBundle RB2 = MultiLang.generateDatabaseResourceBdl();
	    String greeting = RB.getString("language");
	 	request.getSession().setAttribute("page", ContextVariable.Page.STATUS);
	 %>

	<div class='master-container'>
		<%@ include file="/includes/header_menu.jsp" %>
		
		<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver" url='<%= RB2.getString("db") %>' user='<%= RB2.getString("username") %>' password='<%= RB2.getString("password") %>'/>
		
		<sql:query dataSource="${database}" var="statuss">
				SELECT status FROM storedb.order WHERE order_id = '${cookie.orderId.value}'
		</sql:query>
		
		<c:choose> 
			  <c:when test="${(statuss.rowCount) == 0}">
			  	<c:set value="table-main-not-visible" var="table"></c:set>
			  	<c:set value="span-visible" var="span"></c:set>
			  </c:when>
			  <c:otherwise>
			  	<c:set value="table-main-visible" var="table"></c:set>
			  	<c:set value="span-not-visible" var="span"></c:set>
			  </c:otherwise>
		</c:choose>
		
		<c:forEach var="status" items="${statuss.rows}">
			<c:choose> 
			  <c:when test="${(status.status) >= 0}">
			  	<c:set value="check-mark-selected" var="order"></c:set>
			  </c:when>
			  <c:otherwise>
			  	<c:set value="check-mark" var="order"></c:set>
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
		
			<div id="status" class="status">
					<table class="${table}">
								<tr>
									<td class="order-delivered"><i><%= RB.getString("statusorder") %></i><br/><i><%= RB.getString("statusdeliver") %></i><br/>
										<a id="order" class="${order}">✔</a>
									</td>
									<td class="prep-pizza"><i><%= RB.getString("statusprep") %></i><br/><i><%= RB.getString("statuspreppizza") %></i><br/>
										<a id="prep" class="${prep}">✔</a>
									</td>
									<td class="bake-pizza"><i><%= RB.getString("statusbake") %></i><br/><i><%= RB.getString("statusbakepizza") %></i><br/>
										<a id="bake" class="${bake}">✔</a>
									</td>
									<td class="out-for-deliver"><i><%= RB.getString("statusoutfor") %></i><br/><i><%= RB.getString("statusdelivery") %></i><br/>
										<a id="out" class="${out}">✔</a>
									</td>
								</tr>
					</table>
					<div class="${span}">
						<span >Thank for ordering!</span><br/>
						<span >Enjoy your meal.</span>
					</div>
					
			</div>
	</div>
	
	<%@ include file="/includes/notification.jsp"%>
</body>
</html>