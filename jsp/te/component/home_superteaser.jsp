<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
	<mm:related path="kaft,posrel,teasers" fields="posrel.pos" constraints="posrel.pos =0 ">
		<mm:node element="teasers">
 			<%-- this code must be moved to a more generic place --%>
			<%@include file="parts/teaser_link.jsp"%>
			<te:field name="title"/>
			<te:field name="html(body)"/>
			<mm:relatednodes type="images">
				 <img src="<mm:image template="s(140x140)+part(10,10,110,100)"/>" align="right" border="0"/>
			</mm:relatednodes>
		</mm:node>
		<mm:relatednodes type="episodes" max="1">
			</a>
		</mm:relatednodes>
	</mm:related>
</mm:node>
</mm:cloud>
