<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<%-- episode title --%>
	<mm:node number="<%= findParentParam(navigation,"episodes").getID() %>">
		<div class="episodes">
		<te:field name="title"/>
		</div>
                <a href="../../">terug naar de aflevering</a><br>
	</mm:node>
</mm:cloud>
