<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= ((NavigationParam)findParentParam(navigation,"maps")).getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<%-- list related episodes to a maps (program) order them by episode number
 skip episodes that are in the future (maybe we first need to make a query for only the next episode)
--%>
<%
	StringBuffer constraintsBuffer  = new StringBuffer();
	constraintsBuffer.append("bcastrel.rerun != 1");
	constraintsBuffer.append(" ");
	constraintsBuffer.append("AND");
	constraintsBuffer.append(" ");
	constraintsBuffer.append("mmevents.start < ");
	constraintsBuffer.append( (System.currentTimeMillis() / 1000));
	int max =20;
	String offsetString = request.getParameter("offset");
	int offset =0;
	try {
		offset=Integer.parseInt(offsetString);
	} catch (Exception e){};
	String programs =  request.getParameter("programs");
	if (programs != null && programs.trim().length() > 0){
		try {   //parse.. for invalid data
			Integer.parseInt(programs);
			constraintsBuffer.append(" AND programs.number = " + Integer.parseInt(programs) + " ");
		} catch (Exception e){};
	}
	String constraints = constraintsBuffer.toString();
%>
<%-- just do a list to determine the size :( not very impresive --%>
<mm:related 
	path="programs,episodes,bcastrel,mmevents"
	fields="programs.number,episodes.episodenr,episodes.number,bcastrel.rerun,mmevents.start" 
	constraints="<%= constraints  %>" orderby="episodes.episodenr" directions="DOWN" >
<mm:first><mm:import id="listSize" vartype="Integer"><mm:size/></mm:import></mm:first>
</mm:related>
<mm:present referid="listSize">
	<mm:write referid="listSize" jspvar="listSize">
	<div class="pagelist">
	<% for (int x = 0 ; x < ((Integer)listSize).intValue() ;  x += max) { %>
	   <% if (x == offset) { %>
	     &gt;<a href="<%= facade.getEngineURL() + navigation.getFullURLString() +"/" %>?offset=<%= (x ) %>&programs=<%= programs%>"><%=  (x / max ) + 1 %></a>&lt;
	   <% } else { %>
	     <a href="<%= facade.getEngineURL() + navigation.getFullURLString() +"/" %>?offset=<%= (x ) %>&programs=<%= programs%>"><%=  (x / max ) + 1 %></a>
	   <% } %>
	<% } %>
	</div>
	</mm:write>
</mm:present>
<mm:related 
	path="programs,episodes,bcastrel,mmevents"
	fields="programs.number,episodes.episodenr,episodes.number,bcastrel.rerun,mmevents.start" 
	constraints="<%= constraints  %>" orderby="episodes.episodenr" directions="DOWN" offset="<%= "" + offset %>" max="<%= "" + (max +1) %>">
		<mm:node element="episodes">
		<div class="episodes">
<table width="100%">
<tr>
<td>
			<a href="<te:url/>"><te:field  name="title"/></a>
			<te:field  name="subtitle"/>
			<te:field  name="substring(html(intro),150,...)"/>
</td>
<td>

	<mm:relatednodes type="images" max="1">
		<img src="<mm:image template="s(100x100)"/>" valign="top" align="right"/>
	</mm:relatednodes>
        <%@include file="../parts/has_audio_video.jsp" %>
</td>
</tr>
</table>
		</div>
		</mm:node>
	<mm:last>
		<mm:size jspvar="size">
			<% if (size.intValue() == max +1){ %>
				<% if (programs != null) { %>
				    <a href="<%= facade.getEngineURL() + navigation.getFullURLString() +"/" %>?offset=<%= (offset + max) %>">verder terug in de tijd</a>
			<% }  else { %>
				   <a href="<%= facade.getEngineURL() + navigation.getFullURLString() +"/" %>?offset=<%= (offset + max) %>?programs=<%= programs %>">verder terug in de tijd</a>
				<% } %>
			
			<% } %>
		</mm:size>
	</mm:last>
</mm:related>
</mm:node>
</mm:cloud>
