<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= navigation.getID() %>">
		<mm:relatednodes type="images">
				<img src="<mm:image template="s(100x100)"/>"><br>
				<te:field name="description"/>
			<br>
		</mm:relatednodes>
	</mm:node>
</mm:cloud>
