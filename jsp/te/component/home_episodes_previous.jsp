<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<div class="<%= component.getName() %>">
<mm:cloud>
<%-- get the current map --%>
<mm:node referid="mapsid">
	<%-- get the prev/current episode from the maps builder --%>
	<mm:field id="prevepisodenumber" name="prevepisodenumber" write="false"/>
	
	<%-- if there is no prev episode  the maps builder returns 0 --%>
	<%-- so compare the prevepisode with 0 , if they are not equal display the episode --%>
	<mm:compare referid="prevepisodenumber" value="0" inverse="true">
		<mm:node referid="prevepisodenumber">
			<table width="100%">
				<tr><th colspan="2">Vorige aflevering</th><th></th></tr>
				<tr>
					<td>
						<a href="<te:url/>"><te:field  name="title"/></a>
						<te:field  name="subtitle"/>
						<te:field  name="substring(html(intro),150,...)"/>
					</td>
					<td>
					<mm:relatednodes type="images" max="1">
						<img src="<mm:image template="s(100x100)"/>" valign="top" align="right"/>
					</mm:relatednodes>
					</td>
				</tr>
			</table>
		</mm:node>
	</mm:compare>
</mm:node>
</mm:cloud>
</div>
