<%@include file="../include.jsp"%>
<% Properties p = new Properties() ;%>
<mm:cloud uri="rmi://127.0.0.1:1111/templates">
<mm:node number="<%= mapsNavigation.getProperty("tesites") %>" jspvar="myNode">
	<% p.load(new ByteArrayInputStream(myNode.getStringValue("properties").getBytes())); %>
</mm:node>
</mm:cloud>
<% 
  Component component = (Component)request.getAttribute("component");
  //create a hash of selected navigations
  Hashtable hash = new Hashtable();
  Navigation tempNav = navigation;
  do { 
	hash.put(tempNav,"true");
  } while( (tempNav = tempNav.getParentNavigation()) != null);
%>
	<div class="navigationbar">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
		<% if (navigation == mapsNavigation) {%>
		    <td class="selectednavigation" background="http://images.vpro.nl/img.db?kaft_kader_wit_v_gif+f(gif)+flipx+part(292x0x400x50)+colorizehex(ffff00)">Voorpagina</td>
		<% } else { %>
		    <td class="navigation"  background="http://images.vpro.nl/img.db?kaft_kader_wit_v_gif+f(gif)+flipx+part(292x0x400x50)+colorizehex(ffff00)"><a href="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() %>/">Voorpagina</a></td>
		<% } %>
		<% 
			Navigations mavs = mapsNavigation.getChildNavigations();
			for (int z =0 ;z < mavs.size() ; z++ ) {
				Navigation nav = mavs.getNavigation(z);
		%>
			<% if ( nav.getProperty("visible") == null && p.getProperty("navigation." + nav.getID() + ".visible","true").equals("true")  ) { %>
				<% if (hash.get(nav) != null  ) { %>
				  <% if (nav == navigation) { %>
				     <td class="selectednavigation" background="http://images.vpro.nl/img.db?kaft_kader_wit_v_gif+f(gif)+flipx+part(292x0x400x50)+colorizehex(ffff00)"><%= nav.getName() %></td>
				 <% } else { %>
				    <td class="navigation"  background="http://images.vpro.nl/img.db?kaft_kader_wit_v_gif+f(gif)+flipx+part(292x0x400x50)+colorizehex(ffff00)"><a href="<%= facade.getEngineURL() + nav.getFullURLString() %>/"><%= nav.getName() %></a></td>
				 <% } %>
				<% } else { %>
				<td class="navigation"  background="http://images.vpro.nl/img.db?kaft_kader_wit_v_gif+f(gif)+flipx+part(292x0x400x50)+colorizehex(ffff00)"><a href="<%= facade.getEngineURL() + nav.getFullURLString() %>/"><%= nav.getName() %></a></td>
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
	</tr>
	<tr>
		<% if (navigation == mapsNavigation) {%>
		    <td class="selectednavigationbridge" background="http://images.vpro.nl/img.db?kaft_kader_wit_v_gif+f(gif)+flipx+part(292x26x400x50)+colorizehex(ffff00)">
		<% } else { %>
		    <td></td>
		<% } %>
		<% for (int z =0 ;z < mavs.size() ; z++ ) {
			Navigation nav = mavs.getNavigation(z);
		%>
			<% if ( nav.getProperty("visible") == null && p.getProperty("navigation." + nav.getID() + ".visible","true").equals("true")  ) { %>
				<% if (hash.get(nav) != null  ) { %>
				  <% if (nav == navigation) { %>
		    <td class="selectednavigationbridge" background="http://images.vpro.nl/img.db?kaft_kader_wit_v_gif+f(gif)+flipx+part(292x26x400x50)+colorizehex(ffff00)">
				 <% } else { %>
		    <td class="selectednavigationbridge" background="http://images.vpro.nl/img.db?kaft_kader_wit_v_gif+f(gif)+flipx+part(292x26x400x50)+colorizehex(ffff00)">
				 <% } %>
				<% } else { %>
					<td></td>
				<% } %>
			<% } %>
		<%  }%>
		<td></td>
		<td></td>
	</tr>
	</table>
</div>
