<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= ((NavigationParam)findParentParam(navigation,"maps")).getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
	<mm:related path="images,categories" fields="images.number,categories.name" constraints="categories.name='logo'">
		<mm:node element="images">
		   <img src="<mm:image template="s(200x200)"/>">
		</mm:node>
	</mm:related>
</mm:node>
</mm:cloud>

