<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= episodes %>">
		<mm:field name="title"/> <mm:field name="episodenr"/>
	</mm:node>
</mm:cloud>
