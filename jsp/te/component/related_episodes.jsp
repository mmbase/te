<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<%@page include="episodes_previous.jsp"%>
<%@page include="episodes_next.jsp"%>
</mm:node>
</mm:cloud>

