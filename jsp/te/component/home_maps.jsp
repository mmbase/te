<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<div class="content" >
	<te:field  name="subtitle"/>
	<te:field  name="intro"/>
	<div class="body"><te:field  name="html(body)"/></div>
	<div class="description"><te:field  name="html(description)"/></div>
</div>
</mm:node>
</mm:cloud>
