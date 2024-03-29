<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<mm:node number="<%= findParentParam(navigation,"binders").getID() %>">
<table border="0">
<% int width = 2; %>
<% int counter =1; %>
<%-- episodes --%>
<mm:relatednodes type="episodes">
	<% if ( (counter  +width -1) % width == 0) { out.write("<tr>"); } %>
	<td>
		<div class="episodes">
	<mm:related path="bcastrel,mmevents" fields="bcastrel.number,bcastrel.rerun" constraints="bcastrel.rerun == 0" >
		<mm:node element="mmevents">
			<mm:field name="weekday_start"/>
			<mm:field name="day_start"/>
			<mm:field name="longmonth_start"/>
			<mm:field name="year_start"/>
			<mm:field name="time_start"/>
		</mm:node>
		<%-- get the medium of the maps (program), bcastrel only contains a number (1,2,3 if 4) showing the channel --%>
		<%-- the medium is stored in the maps object so first select the maps object , then display the channel --%>
		<mm:node number="<%= findParentParam(navigation,"maps").getID()  %>">
			<mm:field name="medium">
				<mm:compare value="1"><%-- TV? --%>Nederland</mm:compare>
				<mm:compare value="2"><%-- RADIO --%>Radio</mm:compare>
			</mm:field>
		</mm:node>
		<mm:node element="bcastrel">
			<mm:field name="channel"/>
		</mm:node>
	</mm:related>
			<a href="<te:url/>">
			<mm:relatednodes type="images" max="1">
				 <img src="<mm:image template="s(200)+part(10,60,110,140)"/>" />
			</mm:relatednodes>
			<te:field  name="title"/>
			<te:field  name="subtitle"/>
                        <te:field  name="substring(html(intro),150,...)"/>
			</a>

		</div>
	</td>
	<% if (counter % width == 0) { out.write("</tr>"); }%>
	<% counter ++ ;%>
</mm:relatednodes>
<%-- items --%>
<mm:relatednodes type="items">
<mm:context>
	<mm:node id="item">
	<% if ( (counter  +width -1) % width == 0) { out.write("<tr>"); } %>
	<td>
		<div class="items">
                        <%-- the episode that belongs to the item --%>
			<mm:relatednodes type="episodes"><mm:node id="itemepi"><mm:field name="number"/></mm:node></mm:relatednodes>

			
                        <%-- related images .. --%>
         		<a href="<te:url referids="itemepi"/>">
			<mm:relatednodes type="images" max="1"><img src="<mm:image template="s(200)+part(10,60,110,140)"/>" /></mm:relatednodes>
			<te:field  name="title"/>
			<te:field  name="intro"/>
			</a>

		</div>
	</td>
	<% if (counter % width == 0) { out.write("</tr>"); }%>
	<% counter ++ ;%>
	</mm:node>
</mm:context>
</mm:relatednodes>
<%-- news --%>
<mm:relatednodes type="news">
	<% if ( (counter  +width -1) % width == 0) { out.write("<tr>"); } %>
	<td>
		<div class="news">
			<mm:relatednodes type="images" max="1">
				 <img src="<mm:image template="s(200)+part(10,60,110,140)"/>" />
			</mm:relatednodes>
			<a href="<te:url/>"><te:field  name="title"/></a>
			<te:field  name="subtitle"/>
                        <te:field  name="substring(html(intro),150,...)"/>

		</div>
	</td>
	<% if (counter % width == 0) { out.write("</tr>"); }%>
	<% counter ++ ;%>
</mm:relatednodes>
<%-- close td nicely --%>
<% counter -- ;%>
<%  if (counter % width != 0) {
	while(counter % width != 0) { 
		out.write("<td></td>"); 
		counter ++ ;
        };
	out.write("</tr>");
   } 
%>
</table>
</mm:node>
</mm:cloud>
