<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<div class="<%= component.getName() %>">
<mm:node referid="mapsid">
	<mm:related path="posrel,teasers" fields="posrel.pos" constraints="posrel.pos !=0 ">
		<mm:node element="teasers">
			<h1>SUPER TEASER</h1>
			<te:field name="title"/>
		</mm:node>
	</mm:related>
</mm:node>
</div>
</mm:cloud>
