<%@include file="include.jsp"%>
<%
  Template template = (Template)request.getAttribute("template");
  response.addHeader("Cache-Control","no-cache");
  response.addHeader("Pragma","no-cache");
%>
<mm:import externid="number" required="true" jspvar="number"/>
<mm:import externid="name" required="true" />
<mm:import externid="value" required="true" />
<mm:cloud name="mmbase" method="http" jspvar="cloud">
<mm:node referid="number" jspvar="node">
<% Properties p = new Properties(); 
   p.load(new ByteArrayInputStream(node.getStringValue("properties").getBytes()));
   p.setProperty(request.getParameter("name"),request.getParameter("value"));
   ByteArrayOutputStream baos = new ByteArrayOutputStream();
   p.store(baos,"");
   node.setStringValue("properties",baos.toString());
   node.commit();
%>
<jsp:forward page="<%= "view_site.jsp?number=" + number %>"/>
</mm:node>
</mm:cloud>
