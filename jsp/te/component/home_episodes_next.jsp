<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<div class="<%= component.getName() %>">
<mm:cloud>
<%-- get the current map --%>
<mm:node referid="mapsid">
	<%-- get the next episode from the maps builder --%>
	<mm:field id="nextepisodenumber" name="nextepisodenumber" write="false"/>
	
	<%-- if there is no next episode  the maps builder returns 0 --%>
	<%-- so compare the nextepisode with 0 , if they are not equal display the episode --%>
	<mm:compare referid="nextepisodenumber" value="0" inverse="true">
		<mm:node referid="nextepisodenumber">
			<div class="episodes">
			<table width="100%">
				<tr><th colspan="2">Volgende aflevering</th><th></th></tr>
				<%@include file="parts/home_episodes.jsp"%>
			</table>
			</div>
		</mm:node>
	</mm:compare>
</mm:node>
</mm:cloud>
</div>
