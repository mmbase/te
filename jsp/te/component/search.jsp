<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
  String site = "programmas";
  String words= "vpro";
  String ppage= "1";
  String restrict=""; // facade.getEngineURL() + mapsNavigation.getFullURLString() +  "/";
%>
<mm:import externid="site">programmas</mm:import>
<mm:import externid="words"/>

<mm:present referid="words">
<mm:include page="/SearchServlet" referids="site,words" />
</mm:present>
<mm:notpresent referid="words">
U kunt hier zoeken
</mm:notpresent>
