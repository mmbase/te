<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="magid"><%= component.getProperty("number") %></mm:import>
<mm:cloud>
<mm:node referid="magid">
<div>
	<h1><mm:field  name="title"/></h1>
	<h2><mm:field  name="subtitle"/></h2>
	<mm:field  name="body"/>
</div>
</mm:node>
</mm:cloud>

