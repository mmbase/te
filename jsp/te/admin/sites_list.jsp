<%@include file="include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<% 
	 Template template = (Template)request.getAttribute("template");
	response.addHeader("Cache-Control","no-cache");
        response.addHeader("Pragma","no-cache");
%>
<mm:cloud method="http" jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<table>
	<tr><th>status</th><th>site naam</th><th>beschrijving</th></tr>
<mm:listnodes type="tesites" constraints="state <> 0">
	<tr><td class="state_active">run</td><td><a href="view_site.jsp?number=<mm:field name="number"/>"><mm:field name="name"/></a></td><td><mm:field name="description"/></td></tr>
</mm:listnodes>
<mm:listnodes type="tesites" constraints="state = 0">
	<tr><td class="state_inactive">stoped</td><td><a href="view_site.jsp?number=<mm:field name="number"/>"><mm:field name="name"/></a></td><td><mm:field name="description"/></td></tr>
</mm:listnodes>
</table>
<a href="new_site.jsp">nieuwe site maken</a>
</body>
</html>
</mm:cloud>
