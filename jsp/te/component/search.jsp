<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
  String site = "programmas";
  String words= "vpro";
  String ppage= "1";
  String restrict= mapsNavigation.getURLString();
%>
<mm:import externid="site">programmas</mm:import>
<mm:import externid="restrict"><%= restrict %></mm:import>
<mm:import externid="scriptname"><%= facade.getEngineURL() + navigation.getFullURLString() %></mm:import>
<mm:import externid="words"/>

restrict <mm:write referid="restrict"/>
<mm:present referid="words">
<mm:include page="/SearchServlet" referids="site,words,scriptname,restrict" />
</mm:present>
<mm:notpresent referid="words">
U kunt hier zoeken
</mm:notpresent>
