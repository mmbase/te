<%@page language="java" %>
<%@include file="../include.jsp"%>
<% Encode htmlEscape = new Encode("ESCAPE_HTML"); %>
<mm:cloud uri="rmi://127.0.0.1:1111/templates" name="mmbase" method="http" jspvar="cloud"> 
<mm:node number="<%= mapsNavigation.getProperty("tesites") %>">
	<mm:setfield name="style"><%= request.getParameter("style") %></mm:setfield>
</mm:node>
</mm:cloud> 
<%@include file="index.jsp"%>
