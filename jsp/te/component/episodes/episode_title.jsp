<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= episodes %>">
		<h2><mm:field name="title"/></h2>
		<b><mm:field name="subtitle"/></b>
	</mm:node>
</mm:cloud>
