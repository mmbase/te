<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= ((NavigationParam)findParentParam(navigation,"maps")).getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
	<mm:relatednodes type="serviceinfo">
		<a href="<te:url/>"><te:field name="title"/></a>
		<mm:relatednodes type="images" max="1">
			<br> <img src="<mm:image template="s(100x100)"/>"><br>
		</mm:relatednodes>
		<te:field name="subtitle"/>
	        <br>
	</mm:relatednodes>
</mm:node>
</mm:cloud>
