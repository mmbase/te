<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= navigation.getID() %>">
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

		<mm:relatednodes type="attachments">
			<mm:first>Bijlagen:<br></mm:first>
			<a href="/attachment.db/<mm:field name="filename"/>?<mm:field name="number"/>"><mm:field name="title"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>
		<mm:relatednodes type="email">
			<mm:first><br>emails:<BR></mm:first>
			<a href="mailto:<mm:field name="emailaddress"/>"><te:field name="description"/></a>
		</mm:relatednodes>
	</mm:node>
</mm:cloud>
