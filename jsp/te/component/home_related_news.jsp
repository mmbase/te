<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<div class="content">
	<mm:related path="magazines,news" fields="news.number" orderby="news.number"> 
		<mm:node element="news">
			<div class="news">
			<a href="<te:url/>">
			<te:field  name="title"/></a>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html_intro,150,..)"/>
			   <mm:relatednodes type="images">
			   <img src="<mm:image template="s(200x200)+crop(50,50,200,20)"/>">
			   </mm:relatednodes>
			</div>
			</mm:node>
	</mm:related>

</div>
</mm:node>
</mm:cloud>

