<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
  NavigationControl navcomp = facade.getNavigationControl();

  String style = component.getProperty("style");
	if (style == null) style = "default";

	if (style.equals("breadcrum")){
  Navigation nav = wb.getCurrentNavigation();

	//generate a breadcrum
  StringBuffer sb = new StringBuffer(); 
  while(! nav.isRootNavigation()){ 
		sb.insert(0,"<a href=\"" + facade.getEngineURL() + navcomp.getURLString(nav) + "/\">" + nav.getName() + "</a>");
		nav = nav.getParentNavigation();
		if (! nav.isRootNavigation()){
		  sb.insert(0,">");
		}
  }
%>
<div>
<%= sb.toString() %>
</div>
<% } else if (style.equals("sitenavigation")){ 
	Navigations navs = wb.getCurrentNavigation().getChildNavigations();
	for (int x = 0 ; x < navs.size() ;x++){
			Navigation child = navs.getNavigation(x);
			%>
			<A HREF="<%= facade.getEngineURL() %><%= navcomp.getURLString(child) %>/"><%= child.getName() %></a>
			 <% if (x < navs.size() -1) { %>&nbsp;|&nbsp;<% } %>
			<%
	}
 } %>
