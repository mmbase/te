<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<div class="episodes">
	<mm:node number="<%= navigation.getID() %>">
	<mm:related path="bcastrel,mmevents" fields="bcastrel.number,bcastrel.rerun" constraints="bcastrel.rerun != 0" >
		<mm:node element="mmevents">
			<mm:field name="weekday_start"/>
			<mm:field name="day_start"/>
			<mm:field name="longmonth_start"/>
			<mm:field name="year_start"/>
			<mm:field name="time_start"/>
		</mm:node>
		<%-- get the medium of the maps (program), bcastrel only contains a number (1,2,3 if 4) showing the channel --%>
		<%-- the medium is stored in the maps object so first select the maps object , then display the channel --%>
		<mm:node referid="mapsid">
			<mm:field name="medium" id="medium" write="false">
				<mm:compare referid="medium" value="1"><%-- TV? --%>Nederland</mm:compare>
				<mm:compare referid="medium" value="2"><%-- RADIO --%>Radio</mm:compare>
			</mm:field>
		</mm:node>
		<mm:node element="bcastrel">
			<mm:field name="channel"/>
		</mm:node>
	</mm:related>
	<table>
	<tr><td colspan="2">
		<te:field name="html(intro)"/>
	</td></tr>
	<tr><td >
		 <te:field name="html(description)"/>
		&nbsp;
	</td><td valign="top">
		<mm:related path="insrel,items">
			<mm:node element="items">
				<p>
				<mm:field name="title"/>
				<te:field name="subtitle"/>
				<a href="<te:url/>">[meer icoon]</a><br>
				   <mm:relatednodes type="images" max="1">
				      <img src="<mm:image template="s(200x200)+part(0,85,200,115)"/>">
				   </mm:relatednodes>
				</p>
			</mm:node>
		</mm:related>
	</td>
	</tr>
	</table>
	</mm:node>
</div>
</mm:cloud>
