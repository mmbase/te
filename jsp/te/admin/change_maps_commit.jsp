<%@include file="include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<%@page import="nl.vpro.*"%>
<%
  Template template = (Template)request.getAttribute("template");
  response.addHeader("Cache-Control","no-cache");
  response.addHeader("Pragma","no-cache");
%>
<mm:import externid="number" required="true" jspvar="number"/>
<mm:import externid="maps" required="true" jspvar="maps"/>
<mm:cloud uri="<%= cloudUri %>" name="mmbase" method="http" jspvar="cloud">
<mm:node referid="number" jspvar="node">
   <mm:setfield name="maps" ><mm:write referid="maps"/></mm:setfield>
</mm:node>
</mm:cloud>
<jsp:forward page="<%= "view_site.jsp?number=" + number %>"/>
