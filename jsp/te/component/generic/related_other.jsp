<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= navigation.getID() %>">
		<mm:relatednodes type="persons">
			<mm:first>Persoon<br></mm:first>
			 <mm:field name="title"/><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="public">
			<mm:first>Publicaties<br></mm:first>
			 <mm:field name="title"/><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="public">
			<mm:first>Publicaties<br></mm:first>
			 <mm:field name="title"/><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="groups">
			<mm:first>Groep<br></mm:first>
			 <mm:field name="title"/><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>
	</mm:node>
</mm:cloud>
