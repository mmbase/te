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
<mm:import externid="name" required="true" jspvar="name"/>
<mm:cloud uri="<%= cloudUri %>" name="mmbase" method="http" jspvar="cloud">
<%
	String message ="";
	name = name.trim();
	NodeList list = cloud.getNodeManager("tesites").getList("name ='"+ sqlEscape.encode(name)  +"'",null,null);
	if (list.size() ==1){
                if (list.getNode(0).getStringValue("number").equals(number)){ 
                    message="naam niet veranderd omdat deze hetzelfde was als de originele";
                } else {
                    message="naam niet veranderd omdat er al een andere tesites is metdezelfde naam";
                }
	} else {
	  Node node = cloud.getNode(number);
	  node.setStringValue("name",name);
	  node.commit();
          %><jsp:forward page="<%= "view_site.jsp?number=" + number %>"/><%
	}
%>
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<%= message %> <a href="view_site.jsp?number=<%=  number %>">terug naar het site overzicht</a>
</body>
</html>
</mm:cloud>
