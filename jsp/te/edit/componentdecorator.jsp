<%@include file="../include.jsp"%>
<%@page import="te.edit.*"%>
<%
  ComponentDecorator decorator = (ComponentDecorator)request.getAttribute("component");
  Component component = decorator.getDecoratedCompoment();
  StringBuffer path = new StringBuffer();
  Component parent = component;
  while(parent != null) {
	path.insert(0,parent.getName());
	path.insert(0,"/");
        if (parent.getParentComponent() != null && parent.getParentComponent()  instanceof Container){
		Container temp = (Container)parent.getParentComponent();
		path.insert(0," ["  + temp.getComponents().indexOf(parent) + "]");
		//path.insert(0,"{"  + temp.getComponents() + "}");
		path.insert(0," ["  + temp.getClass().getName() + "]");
		
	}
	parent = parent.getParentComponent();
  }
%>
<div class="content">
<table>
	<tr><th class="header"><%= component.getName() %>  <%= path.toString() %>
	<form>
		<input type="hidden" name="compoment" value="<%= path.toString() %>">
	</form>
        </th></tr>
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
