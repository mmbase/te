<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>

	<mm:node number="<%= navigation.getID() %>">
<div>
<table width="100%">
<tr>
	<td align="left">
		<mm:field name="prev" jspvar="prev">
			<% if (! prev.equals("0")){ %>
				<mm:node number="$_">
					<a href="<te:url/>">vorige aflevering</a>
				</mm:node>
			<% }  else { %>
				&nbsp;
			<% } %>
			&nbsp;
		</mm:field>
	</td>
	<td align="right">
		<mm:field name="next" jspvar="next">
			<% if (! next.equals("0")){ %>
				<mm:node number="$_">
					<a href="<te:url/>">volgende aflevering</a>
				</mm:node>
			<% }  else { %>
				&nbsp;
			<% } %>
		</mm:field>
	</td>
</tr>
</table>
</div>
	</mm:node>
</mm:cloud>
