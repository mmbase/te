<%@include file="../include.jsp"%>
<%@page import="te.edit.*"%><% 
	 ContainerDecorator decorator = (ContainerDecorator)request.getAttribute("container");
	 Container container = decorator.getDecoratedContainer();
	 Components components = container.getComponents();
	 Navigation nav = wb.getCurrentNavigation();
%>
<% if (container.getLayoutManager().getName().equals("horizontal")) { %>
<table>
	<tr><th colspan="<%= components.size() %>"><%= container.getName() %> -  <%= container.getLayoutManager().getName() %></th></tr>
        <tr>
<% for (int x = 0 ; x < components.size(); x++) {%>
	<td valign="top">
	<table>
		<tr>
		<th bgcolor="white"><%= x %></th>
		</tr>
		<tr>
	 <%
	 	Component component = components.getComponent(x);
         %>
        <td class="<%= component.getName()  %><%= (components instanceof Container)? "" + x:""%>">
         <%
		component.render(wb,new PrintWriter(out));
	 %>
		</td>
		</tr>
	</table>
        </td>
<% } %>
	</tr>
</table>
<% } else if (container.getLayoutManager().getName().equals("vertical")){ %>
<table>
	<tr><th colspan="3" class="header" colspan="<%= components.size() %>"><%= container.getName() %> -  <%= container.getLayoutManager().getName() %></th></tr>
<% for (int x = 0 ; x < components.size(); x++) {%>
        <tr>
	<td valign="top"> </td>
	<td valign="top"><%= x %> </td>
	 <%
	 	Component component = components.getComponent(x);
         %>
        <td class="<%= component.getName()  %><%= (components instanceof Container)? "" + x:""%>">
	<%	component.render(wb,new PrintWriter(out));
	 %>
	</td>
	</tr>
<% } %>
</table>
<% } else { %>
<%
	 LayoutManager layout = container.getLayoutManager();
	 StringWriter sw = new StringWriter();
	 PrintWriter pw = new PrintWriter(sw);
	 layout.render(wb,container,pw);
         out.write(sw.toString());
   } %>
