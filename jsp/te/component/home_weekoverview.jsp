<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<%
   Calendar c = Calendar.getInstance();
   c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
   c.set(Calendar.HOUR_OF_DAY, 0);
   c.set(Calendar.MINUTE, 0);
   c.set(Calendar.SECOND, 0);
   int week_start =(int) (c.getTime().getTime()/1000);

   c.add(Calendar.DAY_OF_YEAR, 7);
   int week_end =(int) (c.getTime().getTime()/1000);

%>
<mm:node referid="mapsid">
<mm:related 
	path="programs,episodes,bcastrel,mmevents" 
	fields="episodes.number,mmevents.number,mmevents.start" 
	constraints="<%= "mmevents.start > "+ week_start+" and mmevents.start < "+ week_end %>" orderby="mmevents.start" max="10"> 
<div class="<%= component.getName() %>">
	<mm:node element="mmevents">
			<te:field name="weekday_start"/>
	</mm:node>
	<mm:node element="episodes">

		<te:url/>
	<mm:relatednodes type="images" max="1">
		<img src="<mm:image template="s(100x100)"/>" align="right"/>
	</mm:relatednodes>

	<a href="<te:url/>"><te:field name="title"/></a>
	<te:field name="subtitle"/>
	<te:field name="html(intro)"/>
</div>
<br>
	</mm:node>
</mm:related>

</mm:node>
</mm:cloud>
