<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<div class="content">
	<mm:node number="<%= items %>">
		<h2><mm:field name="title"/></h2>
	</mm:node>
</div>
</mm:cloud>
