<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<div>
	<mm:node number="<%= episodes %>">
		<mm:relatednodes type="images">
				<img src="<mm:image template="s(100x100)"/>"><br>
				<te:field name="description"/>
			<br>
		</mm:relatednodes>
	</mm:node>
</div>
</mm:cloud>
