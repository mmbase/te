<%@include file="include.jsp"%>
<%
  Template template = (Template)request.getAttribute("template");
  response.addHeader("Cache-Control","no-cache");
  response.addHeader("Pragma","no-cache");
%>
<mm:import externid="number" required="true" jspvar="number"/>
<mm:import externid="maps" required="true" jspvar="maps"/>
<mm:cloud name="mmbase" method="http" jspvar="cloud">
<mm:node referid="number" jspvar="node">
   <mm:setfield name="maps" ><mm:write referid="maps"/></mm:setfield>
</mm:node>
</mm:cloud>
<jsp:forward page="<%= "view_site.jsp?number=" + number %>"/>
