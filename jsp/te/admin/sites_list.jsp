<%@include file="include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<% 
	 Template template = (Template)request.getAttribute("template");
	//wb.getHttpServletResponse().addHeader("Cache-Control","no-cache");
        //wb.getHttpServletResponse().addHeader("Pragma","no-cache");
	response.addHeader("Cache-Control","no-cache");
        response.addHeader("Pragma","no-cache");
%>
<mm:cloud uri="<%= cloudUri %>" method="http" jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<mm:listnodes type="sites">
</mm:listnodes>

<a href="new_site.jsp">nieuwe site maken</a>
</body>
</html>
</mm:cloud>
