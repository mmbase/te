<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
	<mm:field id="prevmmevent" name="prevmmevent" write="false"/>
	<mm:node referid="prevmmevent">
		<mm:relatednodes type="episodes">
			<%@include file="parts/episodes.jsp" %>
		</mm:relatednodes>
	</mm:node>
</mm:node>
</mm:cloud>
