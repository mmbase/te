<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= ((NavigationParam)findParentParam(navigation,"maps")).getID() %></mm:import>
<mm:cloud>
<mm:import externid="programs"/>
<mm:node referid="mapsid">
<div class="<%= component.getName() %>">
	<mm:relatednodes type="archives">
		<div class="archives">
			<te:field name="title"/>
			<te:field name="subtitle"/>
			<te:field name="intro"/>
			<te:field name="body"/>
			<mm:relatednodes type="programs">
				<div class="programs">
				<mm:field name="number">
					<mm:compare value="$programs">
						--<te:field name="title"/>
					</mm:compare>
					<mm:compare value="$programs" inverse="true">
				                <a href="<%= facade.getEngineURL() + navigation.getFullURLString() +"/" %>?programs=<mm:field name="number"/>"><te:field name="title"/></a>
					</mm:compare>
				</mm:field>
				</div>
			</mm:relatednodes>
		</div>
	</mm:relatednodes>
</div>
</mm:node>
</mm:cloud>
