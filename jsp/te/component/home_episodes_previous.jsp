<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<div class="content">
<mm:node referid="mapsid">
	<mm:field id="prevmmevent" name="prevmmevent" write="false"/>
	<mm:node referid="prevmmevent">
		<mm:relatednodes type="episodes">
                        <span style="background-color:white">Vorige aflevering</span>
<table width="100%">
<tr>
<td>
			<mm:field name="number" write="false" jspvar="field">
			 <a href="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() + "/afleveringen/" + field%>/">
			</mm:field>
		        <te:url/>
			<te:field  name="title"/></a>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html(intro),150,...)"/>
</td>
<td>

	<mm:relatednodes type="images" max="1">
		<img src="<mm:image template="s(100x100)"/>" valign="top" align="right"/>
	</mm:relatednodes>
</td>
</tr>
</table>
		</mm:relatednodes>
	</mm:node>
</mm:node>
</div>
</mm:cloud>
