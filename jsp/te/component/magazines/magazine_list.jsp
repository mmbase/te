<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<%
	int max =20;
	String offsetString = request.getParameter("offset");
	int offset =0;
	try {
		offset=Integer.parseInt(offsetString);
	} catch (Exception e){};
%>
<table width="400">
	<mm:related path="magazines,news,mmevents"  offset="<%= "" + offset %>" max="<%= "" + (max +1) %>" fields="mmevents.start"  orderby="mmevents.start" directions="DOWN" >
	<mm:last inverse="true">
 <tr>
		<td>
		        <mm:node element="news">
				<div class="news">
                                <a href="<te:url/>">
				<te:field  name="title"/>
				<te:field  name="subtitle"/>
				<te:field  name="substring(html_intro,150,..)"/>
				</a>
				</div>
			</mm:node>
		</td><td>
			<mm:node element="mmevents">
				<mm:field name="weekday_start"/>
				<mm:field name="day_start"/>
				<mm:field name="longmonth_start"/>
				<mm:field name="year_start"/>
				<mm:field name="time_start"/>
			</mm:node>
		        <mm:node element="news">
			   <mm:relatednodes type="images" max="1">
			   <div class="images">
			   <img src="<mm:image template="s(120x120)"/>">
			   </div>
			   </mm:relatednodes>
			</mm:node>
		</td>
 </tr>
	</mm:last>
	<mm:last>
	<tr><td colspan="2">
		<mm:size jspvar="size">
			<% if (size.intValue() == max +1){ %>
			<a href="<%= facade.getEngineURL() + navigation.getFullURLString() +"/" %>?offset=<%= (offset + max) %>">verder terug in de tijd</a>
			<% } %>
		</mm:size>
	</tr></td>
	</mm:last>
	</mm:related>
</table>
</mm:node>
</mm:cloud>
