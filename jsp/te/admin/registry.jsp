<%@include file="include.jsp"%>
<% 
	 Template template = (Template)request.getAttribute("template");
	//wb.getHttpServletResponse().addHeader("Cache-Control","no-cache");
        //wb.getHttpServletResponse().addHeader("Pragma","no-cache");
	response.addHeader("Cache-Control","no-cache");
        response.addHeader("Pragma","no-cache");
%>
<mm:cloud name="mmbase" method="http" jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<h1>te registry</h1>
<p>
De regsitry bevat alle componenten die door het te systeem kunnen worde hetbruikt
(components,templates,containers en layout managers). deze componenten zijn leeg (containers bevatten geen componenten etc)
Een Template is in dit geval dan ook een lege huls.

</p>
<p>
De registry wordt bij het opstarten uit een xml bestand gelezen. Als er nieuwe componenten zijn toegevoegd aan de registry
kan het nodig zijn deze te herladen. Dit kan met deze knop.

<% if ("updateregistry".equals(request.getParameter("action"))) { %>
	<% facade.getComponentRegistry().updateRegistry() ;%>
	<font color="green">regsitry updated</font>
<% } %>
<form>
	<input type="hidden" name="action" value="updateregistry"/>
	<input type="submit" value="registry herladen"/>
</form>
</p>

</body>
</html>
</mm:cloud>
