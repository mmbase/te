<%@include file="../include.jsp"%><% 
	 Template template = (Template)request.getAttribute("template");
	 LayoutManager layout = template.getLayoutManager();
	 StringWriter sw = new StringWriter();
	 PrintWriter pw = new PrintWriter(sw);
	 layout.render(wb,template,pw);
%><html>
<head>
<title><%= mapsNavigation.getName() %> -> <%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body >
	<%= sw.toString() %>
</body>
</html>
