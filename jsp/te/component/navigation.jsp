<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
        <div id="navigation">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<% if (navigation == mapsNavigation) {%>
		<td class="selectednavigation">Voorpagina</td>
		<% } else { %>
		<td class="navigation"><a href="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() %>/">Voorpagina</a></td>
		<% } %>
		<td>&nbsp;</td>

		<% if (component.getProperty("showArchives").equals("true")) { %>
		<td class="navigation">Archief</td>
		<td>&nbsp;</td>
		<% } %>

		<% if (component.getProperty("showBinders").equals("true")) { %>
			<% if (binders != null) {%>
			<td class="selectednavigation">Dossiers</td>
			<% } else { %>
			<td class="navigation">Dossiers</td>
			<% } %>
		<td>&nbsp;</td>
		<% } %>

		<% if (component.getProperty("showLogs").equals("true")) { %>
		<td class="naviagion">Log</td>
		<td>&nbsp;</td>
		<% } %>

		<td width="150px" height="5">&nbsp;</td>
<td class="navigation" align="right">

<mm:import externid="words"/>
<mm:present referid="words">
   <form action="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() + "/zoeken/" %>" ><input name="words" type="text" value="<mm:write referid="words"/>" length="10"></form> 
</mm:present>
<mm:notpresent referid="words">
   <form action="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() + "/zoeken/" %>" ><input name="words" type="text" value="zoeken" length="10" onFocus="if (this.value == 'zoeken') this.value='';"></form> 
</mm:notpresent>

</td>
<td>&nbsp;</td>
	</table>
	</div>
