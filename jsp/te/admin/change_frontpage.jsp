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
<form action="change_frontpage_commit.jsp" method="POST">
	<input type="hidden" name="number" value="<mm:field name="number"/>">
<table>
	<tr><td align="right">voorpagina</td><td>
	 <select name="frontpage" onChange="form.submit()">
   <mm:listnodes type="tetemplates" orderby="name" jspvar="t">
	<% if (t.getNumber() == node.getIntValue("frontpage")){ %>
      		<option value="<mm:field name="number"/>" selected="true" ><mm:field name="description"/></option>
	<% } else { %>
      		<option value="<mm:field name="number"/>"><mm:field name="description"/></option>
	<% } %>
   </mm:listnodes>
	</select>
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
