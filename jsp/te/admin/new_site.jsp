<%@include file="include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<%
  Template template = (Template)request.getAttribute("template");
  response.addHeader("Cache-Control","no-cache");
  response.addHeader("Pragma","no-cache");
%>
<mm:cloud name="mmbase" method="http" jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<form action="new_site_commit.jsp" method="post">
<table>
	<tr><td align="right">naam van de website</td><td><input style="width: 100%" type="text" name="name"></td></tr>
	<tr><td align="right">beschrijving</td>
		<td>
		<textarea name="description" cols="60" rows="5"></textarea>
		</td>
	</tr>
	<tr><td>&nbsp;</td><td><input style="width : 100%" type="submit" value="Aanmaken"/></td></tr>
</table>
</form>
</head>
<body>
</body>
</html>
</mm:cloud>
