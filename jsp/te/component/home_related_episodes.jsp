<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<jsp:include page="home_episodes_previous.jsp"/>
<jsp:include page="home_episodes_next.jsp"/>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
	<mm:related path="kaft,news" fields="news.number" orderby="news.number" max="2"> 
		<mm:node element="news">
			<div class="news">
				<a href="<te:url/>">
				<te:field  name="title"/></a>
				<te:field  name="subtitle"/>
				<te:field  name="substring(html_intro,150,..)"/>
				   <mm:relatednodes type="images" max="1">
				      <img src="<mm:image template="s(200x200)+part(0,85,200,115)"/>">
				   </mm:relatednodes>
				</div>
			</mm:node>
	</mm:related>
	<mm:related path="kaft,posrel,teasers" fields="posrel.pos" constraints="posrel.pos <>0 " orderby="posrel.pos">
		<div class="teasers">
		<mm:node element="teasers">
			<%@include file="parts/teaser_link.jsp"%>
			<te:field name="title"/>
			<%-- no subtitle in teasers ... <te:field name="subtitle"/> --%>
			<te:field name="substring(html_body,100,..)"/>
			<mm:relatednodes type="images">
				 <img src="<mm:image template="s(80x80)+part(10,10,110,100)"/>" align="right"/>
			</mm:relatednodes>
			</a>
		</mm:node>
		</div>
	</mm:related>
</mm:node>
</mm:cloud>
