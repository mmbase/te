<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>

	<mm:node number="<%= episodes %>">
<div>
<table width="100%">
<tr>
	<td align="left">
		<mm:field name="prev" jspvar="prev">
			<% if (! prev.equals("0")){ %>
		            <a href="../<mm:field name="prev"/>/">vorige aflevering</a>
			<% }  else { %>
				geen vorige aflevering
			<% } %>
			&nbsp;
		</mm:field>
	</td>
	<td align="right">
		<mm:field name="next" jspvar="next">
			<% if (! next.equals("0")){ %>
		            <a href="../<mm:field name="next"/>/">volgende aflevering</a>
			<% }  else { %>
				geen volgende aflevering
			<% } %>
		</mm:field>
	</td>
</tr>
</table>
</div>
	</mm:node>
</mm:cloud>
