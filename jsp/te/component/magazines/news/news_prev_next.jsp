<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:import externid="newsid"><%= navigation.getID() %></mm:import>
<mm:cloud>
	<mm:node referid="newsid">
		<mm:relatednodes type="mmevents" max="1">
		   <mm:field id="start" name="start" write="false"/>
		</mm:relatednodes>
	</mm:node>
        <%-- the current new item --%>
	<mm:node referid="mapsid">
        <%-- list the next news item via mmevents --%>
        <%-- get a list of news item with a date after the current date, sort them by date and get the first one .. thats the next item --%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr><td align="left">
	<mm:related path="magazines,news,mmevents"  fields="news.number,mmevents.start"  orderby="mmevents.start" directions="DOWN" constraints="mmevents.start > $start" max="1">
		<mm:node element="news">
			<a href="<te:url/>">Vorige</a>
		</mm:node>
        </mm:related>
  &nbsp;
</td><td align="right">

	<mm:related path="magazines,news,mmevents"  fields="news.number,mmevents.start"  orderby="mmevents.start" directions="UP" constraints="mmevents.start < $start" max="1">
		<mm:node element="news">
			<a href="<te:url/>">Volgende</a>
		</mm:node>
        </mm:related>
  &nbsp;
</td>
</table>
	</mm:node>
</mm:cloud>
