<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
  ProgrammaSiteNavigationComponent p = (ProgrammaSiteNavigationComponent)component;
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

		<td class="navigation"><form><input type="text" length="10"> [ZOEK] M</td>
		<td>&nbsp;</td>
	</table>
	</div>
