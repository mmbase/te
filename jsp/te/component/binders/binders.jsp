<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<mm:node number="<%= maps %>">
<mm:relatednodes type="binders">
<div class="content">
	<mm:field name="number" jspvar="field">
	<a href="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() + "/dossiers/" + field%>/">
	</mm:field>
	<te:field  name="title"/></a>
	<te:field  name="subtitle"/>
</div>
<br>
</mm:relatednodes>
</mm:node>
</mm:cloud>

