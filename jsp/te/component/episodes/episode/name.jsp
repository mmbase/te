<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= episodes %>">
		<div class="content"><nobr>Aflevering Nr. <mm:field name="episodenr"/></nobr></div>
	</mm:node>
</mm:cloud>
