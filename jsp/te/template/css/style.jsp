<%@page language="java" contentType="text/css" %>
<%@include file="../../include.jsp"%>
<% Properties p = new Properties() ;%>
<% 
  p.setProperty("text.style","#99660"); 
  p.setProperty("hover.style","#FF3366"); 
  p.setProperty("background.style","#FFFFFF"); 
  p.setProperty("td.background.style","#FFFF00"); 
  p.setProperty("td.background2.style","#EEEE00"); 
  p.setProperty("bonus.style","#FFFF44"); 
%>
<mm:cloud jspvar="cloud">
<mm:cloud >
<mm:node number="<%= mapsNavigation.getProperty("tesites") %>" jspvar="myNode">
	 <% p.load(new ByteArrayInputStream(myNode.getStringValue("properties").getBytes())); %>
	<mm:field name="style"/>
</mm:node>
</mm:cloud>
img {
	border-width: 0px;
}
<%
  File file = new File("/home/keesj/mmsite/te/template/css/style.css");
  InputStream in = new FileInputStream(file);
  Reader r = new InputStreamReader(in);
  DollarReplacer.replace(p,r,out);
%>
</mm:cloud>
