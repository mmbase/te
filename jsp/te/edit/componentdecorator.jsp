<%@include file="../include.jsp"%>
<%@page import="te.edit.*"%>
<%
  ComponentDecorator decorator = (ComponentDecorator)request.getAttribute("component");
  Component component = decorator.getDecoratedComponent();
  StringBuffer path = new StringBuffer();
  Component parent = component;
  while(parent != null) {
        if (parent.getParentComponent() != null && parent.getParentComponent()  instanceof Container){
		Container temp = (Container)parent.getParentComponent();
		Components wrapped = temp.getComponents();
		for (int x =0 ; x < wrapped.size() ; x++){
			Component d = wrapped.getComponent(x);
			if (d instanceof ComponentDecorator){
				if ( ((ComponentDecorator)d).getDecoratedComponent() == parent){
		                     path.insert(0,"/"+ x );
				}
			} else if (d instanceof ContainerDecorator){
				if ( ((ContainerDecorator)d).getDecoratedContainer() == parent){
		                     path.insert(0,"/"+ x );
				}
			}
		}
		//path.insert(0," ["  + temp.getComponents().indexOf(parent) + "]");
		//path.insert(0,"{"  + temp.getComponents() + "}");
		//path.insert(0," ["  + temp.getClass().getName() + "]");
		
	}
	parent = parent.getParentComponent();
  }
%>
<div class="content">
<table>
	<tr><td>
		<table> <tr> 
		<td>
	<form>
		<input type="hidden" name="component" value="<%= path.toString() %>">
		<% Components comps = Engine.getFacade().getComponentRegistry().getComponents() ;
		%>
		<select name="component">
		<% for (int x =0 ; x < comps.size() ; x++){ %>
			<% Component option = comps.getComponent(x); %>

			<option value="<%= option.getName() %>" <%= (option.getName() == component.getName())?" selected='true'":""%> ><%= option.getName() %></a>
		<% } %>
		</select>
	</form>
		</td>
		<td><a href="remove?path=<%= path.toString() %>">X</a>
		</td>

             </td></tr>
		</table>
	</td></tr>
        <tr>
		<td>
        <% 
	 StringWriter sw = new StringWriter();
	 PrintWriter pw = new PrintWriter(sw);
	 component.render(wb,pw);
	 out.write(sw.toString());
        %>
               </td>
	</tr>
</table>
</div>
