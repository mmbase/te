<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
	<mm:field id="nextmmevent" name="nextmmevent" write="false"/>
	<mm:node referid="nextmmevent">
		<mm:relatednodes type="episodes" jspvar="episodes">
			<%@include file="parts/episodes.jsp" %>
		</mm:relatednodes>
	</mm:node>
</mm:node>
</mm:cloud>