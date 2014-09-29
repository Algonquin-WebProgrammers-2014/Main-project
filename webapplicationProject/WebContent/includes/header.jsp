<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
	     ResourceBundle RBheader = MultiLang.generateResourceBdl(request);
	 %>
	<div id=header>
		<h1><%= RBheader.getString("appname") %></h1>
	</div>
	<div id='menu'>
		<ul>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/mainpage/"><%= RBheader.getString("home") %></a></li>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/verification/user/"><%= RBheader.getString("ordernow") %></a></li>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/verification/user/">Replace this LOL</a></li>
			<li><a class='styleanchor' href=index.html>Replace this LOL</a></li>
			<li><a class='styleanchor' href=index.html>Replace this LOL</a></li>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/verification/store/"><%= RBheader.getString("storelogin") %></a></li>
		</ul>	
	</div>