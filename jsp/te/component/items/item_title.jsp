<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= items %>">
		<h2><mm:field name="title"/></h2>
	</mm:node>
</mm:cloud>
