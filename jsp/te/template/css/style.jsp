<%@page language="java" contentType="text/css" %>
<%@include file="../../include.jsp"%>
<mm:cloud jspvar="cloud">
<mm:cloud uri="rmi://127.0.0.1:1111/templates">
<mm:node number="<%= mapsNavigation.getProperty("tesites") %>">
	<mm:field name="style"/>
</mm:node>
</mm:cloud>
<%@include file="jerry.css"%>
</mm:cloud>
