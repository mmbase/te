<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<div class="content">
	<mm:related path="images,categories" fields="images.number,categories.name" constraints="categories.name='logo'">
		<mm:node element="images">
		   <img src="<mm:image template="s(200x200)"/>">
		</mm:node>
	</mm:related>

	<h1><mm:field  name="title"/></h1>
	<h2><mm:field  name="subtitle"/></h2>
	<b><mm:field  name="intro"/></b>
	<mm:field  name="html(body)"/>
</div>
</mm:node>
</mm:cloud>

