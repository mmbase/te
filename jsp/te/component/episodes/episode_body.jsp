<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<div>
	<mm:node number="<%= episodes %>">
	<mm:related path="bcastrel,mmevents" fields="bcastrel.number,bcastrel.rerun" constraints="bcastrel.rerun != 0" >
		<mm:node element="mmevents">
			<mm:field name="weekday_start"/>
			<mm:field name="day_start"/>
			<mm:field name="longmonth_start"/>
			<mm:field name="year_start"/>
			<mm:field name="time_start"/>
		</mm:node>

	</mm:related>
		<p>
		<te:field name="html(intro)"/>
		</p>
		<p>
		 <te:field name="html(description)"/>
		</p>
		<mm:related path="insrel,items">
			<mm:node element="items">
				<p>
				<a href="items/<mm:field name="number"/>/"><mm:field name="title"/></a><br>
				<te:field name="subtitle"/>
				</p>
			</mm:node>
		</mm:related>
	</mm:node>
</div>
</mm:cloud>
