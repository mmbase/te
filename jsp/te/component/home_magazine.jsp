<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<div class="<%= component.getName() %>">
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
	<mm:related path="magazines,news" max="3"> 
<div class="news">
<table width="400">
 <tr>
		<mm:node element="news">
		<td>
			<te:field  name="title"/>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html_intro,150,..)"/>
		</td><td>
			   <mm:relatednodes type="images" max="1">
			      <img src="<mm:image template="s(120x120)"/>">
			   </mm:relatednodes>
			   <a href="<te:url/>">[meer icoon]</a>
		</td>
			</mm:node>
 </tr>
</table>
	</mm:related>
</div>
</mm:node>
</mm:cloud>
</div>
