<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
	<mm:related path="magazines,news" max="20">  
<div class="news">
<table width="400">
 <tr>
		<mm:node element="news">
		<td>
			<mm:field name="number" jspvar="field">
			<a href="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() + "/artikelen/" + field%>/">
			</mm:field>
			<te:field  name="title"/></a>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html_intro,150,..)"/>
		</td><td>
			   <mm:relatednodes type="images" max="1">
			   <img src="<mm:image template="s(120x120)"/>">
			   </mm:relatednodes>
		</td>
			</mm:node>
 </tr>
</table>
</div>
	</mm:related>
</mm:node>
</mm:cloud>

