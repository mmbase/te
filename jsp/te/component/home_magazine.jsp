<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<div class="<%= component.getName() %>">
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
	<mm:related path="magazines,news"> 
<table width="400">
 <tr>
		<mm:node element="news">
		<td>
			<a hred="<te:url/>"<te:field  name="title"/></a>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html_intro,150,..)"/>
		</td><td>
			   <mm:relatednodes type="images">
			   <img src="<mm:image template="s(120x120)"/>">
			   </mm:relatednodes>
		</td>
			</mm:node>
 </tr>
</table>
	</mm:related>
</mm:node>
</mm:cloud>
</div>
