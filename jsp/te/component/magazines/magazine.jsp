<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<mm:relatednodes type="magazines" max="1">
	<div class="magazines">
	<%-- <te:field name="title"/> --%>
	<te:field name="subtitle"/>
	<te:field name="intro"/>
	<te:field name="body"/>
	<hr>
	</div>
		<mm:relatednodes type="audiofragments">
			<mm:first>audio<br></mm:first>
			 <a href="/rastreams.db?<mm:field name="number"/>"><mm:field name="title"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="videofragments">
			<mm:first>video:<br></mm:first>
			 <a href="/rmstreams.db?<mm:field name="number"/>"><mm:field name="title"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="urls">
			<mm:first>urls:<br></mm:first>
			<a href="<mm:field name="url"/>"><mm:field name="description"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="binders">
			<mm:first>Dossiers:<br></mm:first>
			<a href="<te:url/>"><mm:field name="title"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>
		<mm:relatednodes type="episodes">
			<mm:first>Afleveringen:<br></mm:first>
			<a href="<te:url/>"><mm:field name="title"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>
</mm:relatednodes>
</mm:node>
</mm:cloud>

