<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="newsid"><%= component.getProperty("number") %></mm:import>
<mm:cloud>
<mm:node referid="newsid">
<div>
	<h1><mm:field  name="title"/></h1>
	<h2><mm:field  name="subtitle"/></h2>
	<b><mm:field  name="intro"/></b>
	<mm:field  escape="p" name="html(body)"/>
</div>
</mm:node>
</mm:cloud>

