<%@include file="../include.jsp"%><% 
	 Container container = (Container)request.getAttribute("container");
	 LayoutManager layout = container.getLayoutManager();
	 StringWriter sw = new StringWriter();
	 PrintWriter pw = new PrintWriter(sw);
%>
<mm:import externid="mapsid"><%= navigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid" jspvar="map">
		<mm:field id="prevmmevent" name="prevmmevent" write="false"/>
		<mm:node referid="prevmmevent">
			<mm:relatednodes type="episodes" jspvar="episodes">
			<%  Component comp = new JSPComponent("/te/component/episodes.jsp") ;
			    comp.setProperty("number","" + episodes.getNumber() );
			    container.addComponent(comp);
			%>
			</mm:relatednodes>
		</mm:node>
		<mm:field name="nextmmevent">
		<mm:node number="$_">
			<mm:relatednodes type="episodes" jspvar="episodes">
			<%  Component comp = new JSPComponent("/te/component/episodes.jsp") ;
			    comp.setProperty("number","" + episodes.getNumber() );
			    container.addComponent(comp);
			%>
			</mm:relatednodes>
		</mm:node>
		</mm:field>
			
</mm:node>
</mm:cloud>
<% layout.render(wb,container,pw); %>
<%= sw.toString() %>
