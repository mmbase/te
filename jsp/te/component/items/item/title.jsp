<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<div class="content">
	<%-- episode title --%>
	<mm:node number="<%= findParentParam(navigation,"episodes").getID() %>">
		<h2><mm:field name="title"/></h2>
                <a href="../../">terug naar de aflevering</a>
	</mm:node>
</div>
</mm:cloud>
