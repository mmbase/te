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
	String background = null;
	//hmm does not work
	//wb.getHttpServletResponse().addHeader("Cache-Control","no-cache");
        //wb.getHttpServletResponse().addHeader("Pragma","no-cache");
	response.addHeader("Cache-Control","no-cache");
        response.addHeader("Pragma","no-cache");
        response.addHeader("Test","123");

%><html>
<%-- find if there is a background image --%>
<mm:cloud>
	<mm:list nodes="<%= maps %>" path="maps,images,categories" fields="images.number,categories.name" constraints="categories.name ='background'"  jspvar="vnode">
	 <% background = vnode.getStringValue("images.number") ;%>
        </mm:list>
</mm:cloud>
<head>
<title><%= bc %></title>
<link rel="stylesheet" href="css/style.jsp" type="text/css">
<!-- nocache page -->
</head>
<% if (background == null) { %>
 <body background="/img.db?<%= background  %>">
<% } else { %>
<body>
<% } %>
	<%= sw.toString() %>
</body>
</html>
