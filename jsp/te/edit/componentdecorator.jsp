<%@include file="../include.jsp"%><%
  ComponentDecorator decorator = (ComponentDecorator)request.getAttribute("component");
  Component component = decorator.getDecoratedCompoment();
%>
<table width="100%">	
        <tr>
		<td>
        <% component.render(wb,out); %>
     </td>
	</tr>
</table>
