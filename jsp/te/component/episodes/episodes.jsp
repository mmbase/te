<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<div class="content">
<%-- list related episodes to a maps (program) order them by episode number
 skip episodes that are in the future (maybe we first need to make a query for only the next episode)
--%>
<%
	StringBuffer constraintsBuffer  = new StringBuffer();
	constraintsBuffer.append("bcastrel.rerun != 1");
	constraintsBuffer.append(" ");
	constraintsBuffer.append("AND");
	constraintsBuffer.append(" ");
	constraintsBuffer.append("mmevents.start < ");
	constraintsBuffer.append( (System.currentTimeMillis() / 1000));
	String constraints = constraintsBuffer.toString();
	int max =20;
	String offsetString = request.getParameter("offset");
	int offset =0;
	try {
		offset=Integer.parseInt(offsetString);
	} catch (Exception e){};
%>
<mm:related 
	path="programs,episodes,bcastrel,mmevents"
	fields="episodes.episodenr,episodes.number,bcastrel.rerun,mmevents.start" 
	constraints="<%= constraints  %>" orderby="episodes.episodenr" directions="DOWN" offset="<%= "" + offset %>" max="<%= "" + (max +1) %>">
	<mm:last inverse="true">
		<mm:node element="episodes">
<table width="100%">
<tr>
<td>
	<te:field name="number" write="false" jspvar="field">
           <a href="<%= facade.getEngineURL() + mapsNavigation.getFullURLString() + "/afleveringen/" + field%>/">
	</te:field>
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
		</mm:node>
	</mm:last>
	<mm:last>
		<mm:size jspvar="size">
			<% if (size.intValue() == max +1){ %>
			<a href="<%= facade.getEngineURL() + navigation.getFullURLString() +"/" %>?offset=<%= (offset + max) %>">verder terug in de tijd</a>
			<% } %>
		</mm:size>
	</mm:last>
</mm:related>
</div>
</mm:node>
</mm:cloud>
