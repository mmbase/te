<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<div class="content">
<mm:node referid="mapsid">
	<mm:field id="nextmmevent" name="nextmmevent" write="false"/>
	<mm:node referid="nextmmevent">
		<mm:relatednodes type="episodes">
                        <span style="background-color:white">Volgende aflevering</span>
<table width="100%">
<tr>
<td>
			<te:field  name="title"/>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html(intro),150,...)"/>
	<te:field name="number" write="false" jspvar="field">
	<a href="<te:url/>">lees meer</a>
	</te:field>
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
