<table width="100%">
<tr>
<td>
			<te:field  name="title"/>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html(intro),150,...)"/>
	<te:field name="number" write="false" jspvar="field">
	<a href="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() + "/afleveringen/" + field%>/">&gt;&gt;&gt;&gt;&gt;&gt;</a>
	</te:field>
</td>
<td>

	<mm:relatednodes type="images" max="1">
		<img src="<mm:image template="s(100x100)"/>" valign="top" align="right" border="0"/>
	</mm:relatednodes>
</td>
</tr>
</table>
