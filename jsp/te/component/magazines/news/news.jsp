<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="newsid"><%= findParentParam(navigation,"news").getID() %></mm:import>
<mm:cloud>
<mm:node referid="newsid">
<div class="news">
      			<%-- only shown if type != 5 == mededeling --%>
			<mm:field name="type">
        		   <%-- see nl.vpro.mmbase.module.builders.News --%>
			   <mm:compare value="5" inverse="true">
 			       <mm:field name="text_type")/>
				<mm:relatednodes type="mmevents">
							<mm:field name="weekday_start"/>
							<mm:field name="day_start"/>
							<mm:field name="longmonth_start"/>
							<mm:field name="year_start"/>
							<mm:field name="time_start"/>
				</mm:relatednodes>
			   </mm:compare>
			</mm:field>
	<te:field  name="title"/>
	<te:field  name="subtitle"/>
	<te:field  name="intro"/>
	<te:field  name="html(body)"/>
</div>
</mm:node>
</mm:cloud>

