<%@include file="../include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<% 
  Template template = (Template)request.getAttribute("template");
  Navigation editNav = navigation.getParentNavigation();
  wb.setCurrentNavigation(editNav);
  TemplateEditor editor = new TemplateEditor(editNav);
  Template t = editor.getTemplate();
%>
<mm:cloud jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body >
<style>
.header {
 background-color: #998877;
}
div {
 border: 3px solid;
}
</style>
<%
  LayoutManager layout = t.getLayoutManager();
  StringWriter sw = new StringWriter();
  PrintWriter pw = new PrintWriter(sw);
  layout.render(wb,t,pw);
  out.write(sw.toString());
%>
</body>
</html>
</mm:cloud>
