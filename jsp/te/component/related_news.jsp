<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<div class="content">
	<%-- <mm:related path="magazines,news"> --%>
	<mm:related path="posrel,news"> 
		<mm:first>maps-&gt;posrel-&gt;news<br></mm:first>
		<mm:node element="news">
			<div class="news">
			<te:field  name="title"/>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html_intro,150,..)"/>
			   <mm:relatednodes type="images">
			   <img src="<mm:image template="s(200x200)"/>">
			   </mm:relatednodes>
			</div>
			</mm:node>
	</mm:related>
	<mm:related path="magazines,news"> 
		<mm:first>maps-&gt;magazines-&gt;news<br></mm:first>
		<mm:node element="news">
			<div class="news">
			<te:field  name="title"/>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html_intro,150,..)"/>
			   <mm:relatednodes type="images">
			   <img src="<mm:image template="s(50x50)"/>">
			   </mm:relatednodes>
			</div>
			</mm:node>
	</mm:related>

</div>
</mm:node>
</mm:cloud>

