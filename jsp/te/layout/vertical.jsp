<%@include file="../include.jsp"%><% 
	 Container container = (Container)request.getAttribute("container");
	 Components components= container.getComponents();
	 //StringWriter sw = new StringWriter();
	 //PrintWriter pw = new PrintWriter(sw);
%>
<table>
<% for (int x = 0 ; x < components.size(); x++) {%>
<tr>
  <td valign="top">
	 <%
	 	Component component = components.getComponent(x);
		component.render(wb,new PrintWriter(out));
	 %>
	</td>
</tr>
<% } %>
</table>