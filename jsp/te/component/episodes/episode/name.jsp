<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= navigation.getID() %>">
		<div class="content"><nobr>Aflevering Nr. <mm:field name="episodenr"/></nobr>&nbsp;</div>
	</mm:node>
</mm:cloud>
