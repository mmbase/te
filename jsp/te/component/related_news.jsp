<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<div class="content">
	<%-- <mm:related path="magazines,news"> --%>
	<mm:related path="posrel,news"> 
		<mm:node element="news">
			<div class="news">
			<te:field  name="title"/>
			<te:field  name="subtitle"/>
			<te:field  name="intro"/>
			<te:field  name="html(body)"/>
			   <mm:relatednodes type="images">
			   <img src="<mm:image template="s(200x200)"/>">
			   </mm:relatednodes>
			</div>
			</mm:node>
	</mm:related>

</div>
</mm:node>
</mm:cloud>

