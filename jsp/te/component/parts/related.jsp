		<mm:relatednodes type="audiofragments">
			<mm:first>audio<br></mm:first>
			 <a href="/rastreams.db?<mm:field name="number"/>"><mm:field name="title"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="videofragments">
			<mm:first>video:<br></mm:first>
			 <a href="/rmstreams.db?<mm:field name="number"/>"><mm:field name="title"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="urls">
			<mm:first>urls:<br></mm:first>
			<a href="<mm:field name="url"/>"><mm:field name="description"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>

		<mm:relatednodes type="binders">
			<mm:first>Dossiers:<br></mm:first>
			<a href="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() %>/dossiers/<mm:field name="number"/>/"><mm:field name="title"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>
		<mm:relatednodes type="episodes">
			<mm:first>Afleveringen:<br></mm:first>
			<a href="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() %>/afleveringen/<mm:field name="number"/>/"><mm:field name="title"/></a><br>
			<mm:last><hr></mm:last>
		</mm:relatednodes>
