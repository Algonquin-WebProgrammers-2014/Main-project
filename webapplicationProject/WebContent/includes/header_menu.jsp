<!-- 
Purpose: The header menu of the website with corresponding sets and gets
Author: Rodolfo Navalon , Juan Marco Gloriani 
Added in Version: 0.2
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang,Utilities.ContextVariable" %>
	<%
	     ResourceBundle RBheaderTitle = MultiLang.generateResourceBdl(request,session);
	     HttpSession s = request.getSession();
	 %>
		<div id='menu'>
			<ul>
				<li><a class='styleanchor' id="<%= (s.getAttribute("page").equals(ContextVariable.Page.HOME) ? "selected" : "not")%>" href="${pageContext.request.contextPath}/webapp/mainpage/"><%= RBheaderTitle.getString("home") %> </a></li><!--  
				--><li><a class='styleanchor' id="<%= (s.getAttribute("page").equals(ContextVariable.Page.MENU) ? "selected" : "not")%>" href="${pageContext.request.contextPath}/webapp/mainpage/menu/"><%=RBheaderTitle.getString("pizzamenu") %></a></li><!--  
				--><li><a class='styleanchor' id="<%= (s.getAttribute("page").equals(ContextVariable.Page.STORELOGIN) ? "selected" : "not")%>" href="${pageContext.request.contextPath}/webapp/verification/store/"><%= RBheaderTitle.getString("storelogin") %></a></li><!--
				--><li><a class='styleanchor' id="<%= (s.getAttribute("page").equals(ContextVariable.Page.FINDUS) ? "selected" : "not")%>" href="${pageContext.request.contextPath}/webapp/mainpage/findus/"><%= RBheaderTitle.getString("findus") %></a></li><c:if test="${cookie.orderId != null}"><li><a class='styleanchor' id="<%= (s.getAttribute("page").equals(ContextVariable.Page.STATUS) ? "selected" : "not")%>" href="${pageContext.request.contextPath}/webapp/mainpage/status/"><%= RBheaderTitle.getString("status") %></a></li></c:if>
			</ul>	
		</div>