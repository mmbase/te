<%@include file="../include.jsp"%><% 
	 Container container = (Container)request.getAttribute("container");
	 Navigation nav = wb.getCurrentNavigation();
	 LayoutManager layout = container.getLayoutManager();
	 StringWriter sw = new StringWriter();
	 PrintWriter pw = new PrintWriter(sw);
	 layout.render(wb,container,pw);
%>
<%= sw.toString() %>
