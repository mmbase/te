<%@include file="include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<%@page import="nl.vpro.*"%>
<%
  Template template = (Template)request.getAttribute("template");
  response.addHeader("Cache-Control","no-cache");
  response.addHeader("Pragma","no-cache");
%>
<mm:import externid="number" required="true" jspvar="number"/>
<mm:cloud uri="<%= cloudUri %>" name="mmbase" method="http" jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<mm:node referid="number" jspvar="node">
<div class="tesites">
<form action="change_name_commit.jsp" method="POST">
	<input type="hidden" name="number" value="<mm:field name="number"/>">
<table>
	<tr><td align="right">Naam van de website</td><td><input type="text" name="name" value="<%= htmlAttributeEscape.encode(node.getStringValue("name"))%>"/>
</td></tr>
</table>
</form>
</div>
</mm:node>
</head>
<body>
</body>
</html>
</mm:cloud>
