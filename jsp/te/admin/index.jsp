<%@include file="include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<% 
   Template template = (Template)request.getAttribute("template");
%>
<mm:cloud uri="<%= cloudUri %>" name="mmbase" method="http" jspvar="cloud"> 
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<h1>admin pagina's voor de template engine</h1>
<p>
<ul>
 <li><a href="sites_list.jsp">sites beheren</a></li>
 <li><a href="registry.jsp">componenten beheren</a></li>
</ul>
</table>
</p>
</body>
</html>
</mm:cloud> 
