<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<div class="content" >
	<%--not used because title is in logo --%>
	<%-- <te:field  name="subtitle"/> --%>
	<te:field  name="subtitle"/>
	<te:field  name="intro"/>

	<mm:related path="images,categories" fields="images.number,categories.name" constraints="categories.name ='afbeelding'">
		<mm:node element="images">
		   <img src="<mm:image template="s(200x200)"/>" align="right">
		</mm:node>
	</mm:related>

	<te:field name="html(description)"/>

	<mm:relatednodes type="serviceinfo">
		<mm:first><br>service info:<BR></mm:first>
		<te:field name="title"/>
		<te:field name="subtitle"/>
	</mm:relatednodes>
	<mm:relatednodes type="urls">
		<mm:first><br>urls:<BR></mm:first>
		<a href="<mm:field name="url"/>"><te:field name="description"/></a>
	</mm:relatednodes>
	<mm:relatednodes type="email">
		<mm:first><br>emails:<BR></mm:first>
		<a href="mailto:<mm:field name="emailaddress"/>"><te:field name="description"/></a>
	</mm:relatednodes>
</div>
</mm:node>
</mm:cloud>
