<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= navigation.getID() %>">
		<mm:related path="posrel,images" fields="posrel.pos" orderby="posrel.pos">
			<mm:node element="images">
				<img src="<mm:image template="s(100x100)"/>"><br>
				<te:field name="description"/>
			<br>
			</mm:node>
		</mm:related>
	</mm:node>
</mm:cloud>
