<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<table width="400">
	<mm:related path="magazines,news" max="3"> 
<div class="news">
 <tr>
		<mm:node element="news">
		<td>
			<a href="<te:url/>">
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
			<te:field  name="substring(html_intro,150,..)"/>
<img src="http://images.vpro.nl/img.db?pijl_zwart_wit_gif+dia+colorizehex(996600)+f(gif)" border="0"/></a>
		</td><td>
			   <mm:relatednodes type="images" max="1">
			      <img src="<mm:image template="s(120x120)"/>">
			   </mm:relatednodes>
			   <%@include file="parts/has_audio_video.jsp" %>
		          </a>
					
		</td>
			</mm:node>
 </tr>
	</mm:related>
</table>
</div>
</mm:node>
</mm:cloud>
