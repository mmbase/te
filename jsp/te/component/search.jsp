<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
  String site = "programmas";
  String words= "vpro";
  String ppage= "1";
  String restrict="";
%>
<mm:import externid="site">programmas</mm:import>
<mm:import externid="words">vpro</mm:import>

<mm:include page="/SearchServlet" referids="site,words" />

