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
<mm:cloud uri="<%= cloudUri %>" name="mmbase" method="http" jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<form>
<table>
	<tr><td align="right">programma sites alias</td><td><input type="text" name="alias"></td></tr>
	<tr><td align="right">voorpagina</td>
		<td>
			<select name="frontpage">
	<mm:listnodes type="templates">
		<option value="<mm:field name="name"/>"><mm:field name="description"/></option>
	</mm:listnodes>
			</td></tr>
</table>
</form>
</head>
<body>
</body>
</html>
</mm:cloud>
