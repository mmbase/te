<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<div class="content">
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
				<a href="items/<mm:field name="number"/>/"><mm:field name="title"/></a><br>
				<te:field name="subtitle"/>
				</p>
			</mm:node>
		</mm:related>
	</td>
	</tr>
	</table>
	</mm:node>
</div>
</mm:cloud>