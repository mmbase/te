<%@include file="include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<%
  Template template = (Template)request.getAttribute("template");
  response.addHeader("Cache-Control","no-cache");
  response.addHeader("Pragma","no-cache");
%>
<mm:import externid="name" required="true" jspvar="name"/>
<mm:import externid="description" required="true" jspvar="description"/>
<mm:cloud uri="<%= cloudUri %>" name="mmbase" method="http" jspvar="cloud">
<%
	NodeManager nm = cloud.getNodeManager("programmasites");
	Encode sqle = new Encode("ESCAPE_SINGLE_QUOTE");
	name = name.trim();
	NodeList list = nm.getList("name = '"+ sqle.encode(name) +" '",null,null);
%>
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<% if (list.size() == 0) { %>
<%
	Node node = nm.createNode();
	node.setStringValue("name",name);
	node.setStringValue("description",description);
	node.setIntValue("state",0);
	node.commit();
%>
   een site met naam {<a href="view_site.jsp?number=<%= node.getNumber() %>"><mm:write referid="name"/></a>} is aangemaakt
<% } else { %>
   een site met naam {<a href="view_site.jsp?number=<%= list.getNode(0).getNumber() %>"><mm:write referid="name"/></a>} bestaat al en is dus niet aangemaakt
<% } %>
</body>
</html>
</mm:cloud>
