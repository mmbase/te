<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= episodes %>">
		<te:field name="title"/>
		<te:field name="subtitle"/>
	</mm:node>
</mm:cloud>
