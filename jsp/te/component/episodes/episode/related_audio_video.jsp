<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<div>
	<mm:node number="<%= ((NavigationParam)findParentParam(navigation,"episodes")).getID() %>">
	<%@include file="../../parts/related.jsp"%>
	</mm:node>
</div>
</mm:cloud>
