<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<mm:node number="<%= component.getProperty("number") %>">
<div class="content">
	<mm:field name="title"/>
	<mm:field name="subtitle"/>
	<mm:field name="html(intro)"/>
	<mm:field name="html(description)"/>
</div>
</mm:node>
</mm:cloud>

