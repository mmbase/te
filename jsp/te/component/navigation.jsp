<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
  ProgrammaSiteNavigationComponent p = (ProgrammaSiteNavigationComponent)component;
%>
        <div id="navigation">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<td style="background-color: #E4B7A2"><b>VoorPagina</b></td>
		<td><img src="pics/left.png" height="26" width="11" border="0"/></td>
		<td>&nbsp;</td>

		<% if (p.isShowArchives()) { %>
		<td style="background-color: #E4B7A2">Archief</td>
		<td><img src="pics/left.png" height="26" width="11" border="0"/></td>
		<td>&nbsp;</td>
		<% } %>

		<% if (p.isShowBinders()) { %>
		<td style="background-color: #E4B7A2">Dossiers</td>
		<td><img src="pics/left.png" height="26" width="11" border="0"/></td>
		<td>&nbsp;</td>
		<% } %>

		<% if (p.isShowLogs()) { %>
		<td style="background-color: #E4B7A2">Log</td>
		<td><img src="pics/left.png" height="26" width="11" border="0"/></td>
		<td>&nbsp;</td>
		<% } %>

		<td width="150px" height="5">&nbsp;</td>

		<td align="right"><img src="pics/right.png" height="26" width="11" border="0"/></td>
		<td style="background-color: #E4B7A2"><form><input type="text" length="10"> [ZOEK] M</td>
		<td>&nbsp;</td>
	</table>
	</div>
