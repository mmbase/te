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
<div class="tesites">
<form action="change_maps_commit.jsp" method="POST">
	<input type="hidden" name="number" value="<mm:field name="number"/>">
<table>
	<tr><td align="right">maps object</td><td>
	 <select name="maps" onChange="form.submit()">
	<mm:cloud>//VPRO cloud
	   <mm:listnodes type="maps" jspvar="t" orderby="title">
		<% if (t.getNumber() == node.getIntValue("maps")){ %>
			<option value="<mm:field name="number"/>" selected="true" ><mm:field name="title"/></option>
		<% } else { %>
			<option value="<mm:field name="number"/>"><mm:field name="title"/></option>
		<% } %>
	   </mm:listnodes>
	</mm:cloud>
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
