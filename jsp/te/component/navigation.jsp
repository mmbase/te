<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
  //create a hash of selected navigations
  Hashtable hash = new Hashtable();
  Navigation tempNav = navigation;
  do { 
	hash.put(tempNav,"true");
  } while( (tempNav = tempNav.getParentNavigation()) != null);
%>
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<% if (navigation == mapsNavigation) {%>
		<td class="selectednavigation">Voorpagina</td>
		<% } else { %>
		<td class="navigation"><a href="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() %>/">Voorpagina</a></td>
		<% } %>
		<td>&nbsp;</td>
		<% 
			Navigations mavs = mapsNavigation.getChildNavigations();
			for (int z =0 ;z < mavs.size() ; z++ ) {
				Navigation nav = mavs.getNavigation(z);
		%>
			<% if ( nav.getProperty("visible") == null) { %>
				<% if (hash.get(nav) != null  ) { %>
				  <% if (nav == navigation) { %>
				     <td class="selectednavigation">[<%= nav.getName() %>]</td>
				 <% } else { %>
				    <td class="navigation"><a href="<%= facade.getEngineURL() + nav.getFullURLString() %>/">[<%= nav.getName() %> ..]</a></td>
				 <% } %>
				<% } else { %>
				<td class="navigation"><a href="<%= facade.getEngineURL() + nav.getFullURLString() %>/"><%= nav.getName() %></a></td>
				<% } %>
			<% } %>
		<%  }%>

		

		<td width="150px" height="5">&nbsp;</td>
<td class="navigation" align="right">

<mm:import externid="words"/>
<mm:present referid="words">
   <form action="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() + "/zoeken/" %>" ><input name="words" type="text" value="<mm:write referid="words"/>" length="10"/></form> 
</mm:present>
<mm:notpresent referid="words">
   <form action="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() + "/zoeken/" %>" ><input name="words" type="text" value="zoeken" length="10" onFocus="if (this.value == 'zoeken') this.value='';"></form> 
</mm:notpresent>

</td>
<td>&nbsp;</td>
	</table>
