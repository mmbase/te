<%@include file="../include.jsp"%>
<%@page import="te.edit.*"%><% 
	 ContainerDecorator decorator = (ContainerDecorator)request.getAttribute("container");
	 Container container = decorator.getContainer();
	 Components components = container.getComponents();
	 Navigation nav = wb.getCurrentNavigation();
%>
<% if (container.getLayoutManager().getName().equals("horizontal")) { %>
<div class="container">
<table>
	<tr><th class="header" colspan="<%= components.size() %>"><%= container.getName() %> -  <%= container.getLayoutManager().getName() %></th></tr>
        <tr>
<% for (int x = 0 ; x < components.size(); x++) {%>
	<td valign="top">
	<table>
		<tr>
		<th bgcolor="white"><%= x %></th>
		</tr>
		<tr>
		<td>
	 <%
	 	Component component = components.getComponent(x);
		component.render(wb,new PrintWriter(out));
	 %>
		</td>
		</tr>
	</table>
        </td>
<% } %>
	</tr>
</table>
</div>
<% } else if (container.getLayoutManager().getName().equals("vertical")){ %>
<div class="container">
<table>
	<tr><th colspan="3" class="header" colspan="<%= components.size() %>"><%= container.getName() %> -  <%= container.getLayoutManager().getName() %></th></tr>
<% for (int x = 0 ; x < components.size(); x++) {%>
        <tr>
	<td valign="top"> </td>
	<td valign="top"><%= x %> </td>
        <td>
	 <%
	 	Component component = components.getComponent(x);
		component.render(wb,new PrintWriter(out));
	 %>
	</td>
	</tr>
<% } %>
</table>
</div>
<% } else { %>
<%
	 LayoutManager layout = container.getLayoutManager();
	 StringWriter sw = new StringWriter();
	 PrintWriter pw = new PrintWriter(sw);
	 layout.render(wb,container,pw);
         out.write(sw.toString());
   } %>
