<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="mapsid"><%= mapsNavigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="mapsid">
<div class="<%= component.getName() %>">
<%@page include="episodes_previous.jsp"%>
<%@page include="episodes_next.jsp"%>
</div>
</mm:node>
</mm:cloud>

