<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<div class="<%= component.getName() %>">
<mm:cloud>
	<mm:node number="<%= navigation.getID() %>">
		<te:field name="title"/>
		<te:field name="html(intro)"/>
		<te:field name="html(description)"/>
	</mm:node>
</mm:cloud>
</div>
