<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="newsid"><%= component.getProperty("number") %></mm:import>
<mm:cloud>
<mm:node referid="newsid">
<div class="news">
	<te:field  name="title"/>
	<te:field  name="subtitle"/>
	<te:field  name="intro"/>
	<te:field  escape="p" name="html(body)"/>
</div>
</mm:node>
</mm:cloud>

