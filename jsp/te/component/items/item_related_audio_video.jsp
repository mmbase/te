<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= items %>">
		<mm:relatednodes type="audiofragments">
			
			audio : <mm:field name="number"/> <BR>
		</mm:relatednodes>

		<mm:relatednodes type="videofragments">
			video : <mm:field name="number"/> <BR>
			
		</mm:relatednodes>

		<mm:relatednodes type="urls">
			URLS <mm:field name="number"/> <BR>
		</mm:relatednodes>

		<mm:relatednodes type="binders">
			binders <mm:field name="number"/> <BR>
		</mm:relatednodes>
	</mm:node>
</mm:cloud>
