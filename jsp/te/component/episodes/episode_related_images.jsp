<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= episodes %>">
		<mm:related path="posrel,images">
			<mm:node element="images">
				<img src="<mm:image template="s(100x100)"/>">
			</mm:node>
		</mm:related>
		<mm:related path="insrel,images">
			<mm:node element="images">
				<img src="<mm:image template="s(100x100)"/>"><br>
				<mm:field name="description"/>
			</mm:node>
			<br>
		</mm:related>
	</mm:node>
</mm:cloud>
