<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<div>
	<mm:node number="<%= binders %>">
		<mm:relatednodes type="audiofragments">
			<mm:first>audio:<br></mm:first>
			<mm:field name="number"/> <BR>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="videofragments">
			<mm:first>video:<br></mm:first>
			 <mm:field name="number"/> <BR>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="urls">
			<mm:first>urls:<br></mm:first>
			<a href="<mm:field name="url"/>"><mm:field name="description"/></a><BR>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="binders">
			<mm:first>Dossiers:</mm:first>
			<a href="../../dossiers/<mm:field name="number"/>/"><mm:field name="title"/></a>
			<mm:last><hr></mm:last>
		</mm:relatednodes>
		<mm:relatednodes type="episodes">
			<mm:first>Afleveringen:</mm:first>
			<a href="../../afleveringen/<mm:field name="number"/>/"><mm:field name="title"/></a>
			<mm:last><hr></mm:last>
		</mm:relatednodes>
	</mm:node>
</div>
</mm:cloud>
