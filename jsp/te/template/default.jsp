<%@page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@include file="../include.jsp"%><% 
	 Template template = (Template)request.getAttribute("template");
	 LayoutManager layout = template.getLayoutManager();
	 StringWriter sw = new StringWriter();
	 PrintWriter pw = new PrintWriter(sw);
	 layout.render(wb,template,pw);

	//bread crum
	StringBuffer bc = new StringBuffer();
	Navigation bcNav = navigation;
	while(bcNav != null && bcNav != mapsNavigation) {
		bc.insert(0," -> " + bcNav.getName());
		bcNav = bcNav.getParentNavigation();
	} ;
	bc.insert(0,bcNav.getName());
%><html>
<head>
<title><%= bc %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body >
	<%= sw.toString() %>
</body>
</html>
