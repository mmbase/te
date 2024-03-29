<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= ((NavigationParam)findParentParam(navigation,"maps")).getID() %></mm:import>
<mm:cloud>
<mm:import externid="programs"/>
<mm:node referid="mapsid">
	<mm:relatednodes type="archives">
		<div class="archives">
			<te:field name="title"/>
			<te:field name="subtitle"/>
			<te:field name="intro"/>
			<te:field name="body"/>
			
			<mm:relatednodes type="programs">
				<mm:first><br>Afleveringen selecteren:<br>
					<mm:isempty referid="programs">Alle programmas[huidige selectie]</mm:isempty>
					<mm:isnotempty referid="programs">
				                <a href="<%= facade.getEngineURL() + navigation.getFullURLString() +"/" %>">Alle afleveringen zien</a>
</mm:isnotempty>
                                </mm:first>
				<div class="programs">
				<mm:field name="number">
					<mm:compare value="$programs">
						<div class="title"><mm:field name="title"/>[huidige selectie]</div>
					</mm:compare>
					<mm:compare value="$programs" inverse="true">
				                <a href="<%= facade.getEngineURL() + navigation.getFullURLString() +"/" %>?programs=<mm:field name="number"/>"><te:field name="title"/></a>
					</mm:compare>
				</mm:field>
				</div>
			</mm:relatednodes>
                
                <br>
                 urls:<br>
                <mm:relatednodes type="urls">
                     <a href="<mm:field name="url"/>"><mm:field name="description"/></a><br>
                </mm:relatednodes>
		</div>

	</mm:relatednodes>
</mm:node>
</mm:cloud>
