<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= episodes %>">
		<div class="title"><mm:field name="title"/> Nr. <mm:field name="episodenr"/></div>
	</mm:node>
</mm:cloud>
