<%@include file="../include.jsp"%><% 
	 Container container = (Container)request.getAttribute("container");
	 Components components= container.getComponents();
	 //StringWriter sw = new StringWriter();
	 //PrintWriter pw = new PrintWriter(sw);
%>
<% if (container instanceof Template) { %>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<% } else { %>
<table cellpadding="0" cellspacing="0" border="0">
<% } %>
<% for (int x = 0 ; x < components.size(); x++) {%>
<tr>
  <td>
	 <%
	 	Component component = components.getComponent(x);
		component.render(wb,new PrintWriter(out));
	 %>
	</td>
</tr>
<% } %>
</table>
