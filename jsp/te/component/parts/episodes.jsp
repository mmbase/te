	<mm:relatednodes type="images" max="1">
		<img src="<mm:image template="s(100x100)"/>" align="right"/>
	</mm:relatednodes>

			<te:field  name="title"/>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html_intro,150,..)"/>
	<te:field name="number" write="false" jspvar="field">
	<a href="<%= facade.getEngineURL() + navigation.getFullURLString() + "/afleveringen/" + field%>/">ga naar de aflevering</a>
	</te:field>
