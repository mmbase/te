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
<mm:cloud name="mmbase" method="http" jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<mm:node referid="number" jspvar="node">
	<mm:setfield name="state">1</mm:setfield>
de site is geactiveerd en te zien op
<mm:node number="<%= node.getStringValue("maps") %>">
<a href="<te:url/>"><te:url/></a>
</mm:node>
</mm:node>
</head>
<body>
</body>
</html>
</mm:cloud>
