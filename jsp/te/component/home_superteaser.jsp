<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<div class="<%= component.getName() %>">
<mm:node referid="mapsid">
	<mm:related path="kaft,posrel,teasers" fields="posrel.pos" constraints="posrel.pos =0 ">
		<mm:node element="teasers">
			<te:field name="title"/>
			<te:field name="html(body)"/>
			<mm:relatednodes type="images">
				 <img src="<mm:image template="s(140x140)+part(10,10,110,100)"/>" align="right"/>
			</mm:relatednodes>
		</mm:node>
	</mm:related>
</mm:node>
</div>
</mm:cloud>
