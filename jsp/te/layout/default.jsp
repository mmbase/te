<%@include file="../include.jsp"%><% 
	 Container container = (Container)request.getAttribute("container");
	 Components components= container.getComponents();
%>
<% if (container instanceof Template) { %>
<%-- make an exeption if the container is a template --%>
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
