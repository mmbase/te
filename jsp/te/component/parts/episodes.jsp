<div class="content">
	<mm:relatednodes type="images" max="1">
		<img src="<mm:image template="s(100x100)"/>" align="right"/>
	</mm:relatednodes>

	<mm:field name="title"/>
	<mm:field name="subtitle"/>
	<mm:field name="html(intro)"/>
	<mm:field name="number" write="false" jspvar="field">
	<a href="<%= facade.getEngineURL() + navigation.getFullURLString() + "/afleveringen/" + field%>/">&gt;</a>
	</mm:field>
</div>
