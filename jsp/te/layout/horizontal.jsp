<%@include file="../include.jsp"%><% 
	 Container container = (Container)request.getAttribute("container");
	 Components components= container.getComponents();
%>
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<% for (int x = 0 ; x < components.size(); x++) {%>
  <td valign="top">
	 <%
	 	Component component = components.getComponent(x);
		component.render(wb,new PrintWriter(out));
	 %>
  </td>
<% } %>
</tr>
</table>
