<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="magid"><%= component.getProperty("number") %></mm:import>
<mm:cloud>
<mm:node referid="magid">
<div class="mags">
	<te:field  name="title"/>
	<te:field  name="subtitle"/>
	<te:field  name="body"/>
</div>
</mm:node>
</mm:cloud>

