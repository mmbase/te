<%@include file="include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="te.*"%>
<%@page import="minixml.*"%>
<%@page import="nl.vpro.*"%>
<%
  Template template = (Template)request.getAttribute("template");
  response.addHeader("Cache-Control","no-cache");
  response.addHeader("Pragma","no-cache");
%>
<mm:import externid="number" required="true" jspvar="number"/>
<mm:cloud name="mmbase" method="http" jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<mm:node referid="number" jspvar="node">
<div class="tesites">
<table>
	<tr><td align="right">naam van de website</td><td><a href="change_name.jsp?number=<mm:field name="number"/>"><te:field name="name"/></a></td></tr>
	<tr><td align="right">beschrijving</td> <td><te:field name="description"/></td> </tr>
	<%-- front page --%>
	<tr><td align="right">voorpagina</td> <td> 
	<a href="change_frontpage.jsp?number=<mm:field name="number"/>">
		<mm:field name="frontpage">
			<mm:isempty>nog niet aangemaakt</mm:isempty>	
			<mm:isnotempty><mm:field name="frontpage"/></mm:isnotempty>
		</mm:field></a></td> </tr>

	<%-- maps --%>
	<tr><td align="right">maps object</td> <td> 
	<a href="change_maps.jsp?number=<mm:field name="number"/>">
		<mm:field name="maps">
			<mm:compare value="-1" inverse="true"><mm:cloud><mm:node number="$_"><mm:field name="title"/></mm:node></mm:cloud></mm:compare>	
			<mm:compare value="-1">nog niet aangemaakt</mm:compare>	
		</mm:field></a></td> </tr>
	<%-- status --%>
	<tr><td align="right">status</td> <td> 
		<mm:field name="state">
			<mm:compare value="0" inverse="true">
				de site is geactiveerd en te 
				<mm:cloud><%-- VPRO cloud --%>
				<mm:node number="<%= node.getStringValue("maps") %>" jspvar="navNode">
<%
            List list = new Vector();
            list.add(navNode);
            String content  = facade.getNavigationControl().resoveURL(wb.getCurrentNavigation(),list);
	    Path path = new Path(content);
	    path.next();
	    Navigation nav = facade.getNavigationControl().resolveNavigation(path);
	    if (nav != null && nav.getParentNavigation() != null){
		nav.getParentNavigation().removeChild(nav);
	    }
%>
				 <a href="<te:url/>">zien</a>
				</mm:node>
				</mm:cloud>
			</mm:compare>
			<mm:compare value="0">niet actief <a href="activate_site.jsp?number=<mm:field name="number"/>">activeren</a></mm:compare>	
		</mm:field></a></td> </tr>
    	<%-- navigation --%>
	<tr><td align="right">Navigatie</td> <td> 
		<mm:field name="state">
			<mm:compare value="0" inverse="true">
				<mm:cloud><%-- VPRO cloud --%>
				<mm:node number="<%= node.getStringValue("maps") %>" jspvar="navNode">
<%
            List list = new Vector();
            list.add(navNode);
            String content  = facade.getNavigationControl().resoveURL(wb.getCurrentNavigation(),list);
	    Path path = new Path(content);
	    path.next();
	    Navigation navi = facade.getNavigationControl().resolveNavigation(path);
%>
           <% if (navi != null) {
                Navigations mavs = navi.getChildNavigations();
                for (int z =0 ;z < mavs.size() ; z++ ) {
                                Navigation nav = mavs.getNavigation(z);
                %>
		<% Properties p = new Properties(); 
		   p.load(new ByteArrayInputStream(node.getStringValue("properties").getBytes()));
                %>
		 <% if (nav.getProperty("visible") == null) { %>
			<% if ( p.getProperty("navigation." + nav.getID() + ".visible","true").equals("true")        ) { %>
			   <a href="change_property.jsp?number=<%= node.getNumber() %>&name=navigation.<%=nav.getID() + ".visible&value=false" %>"><%= nav.getName() %></a>
			<% } else { %>
			   <strike>
			   <a href="change_property.jsp?number=<%= node.getNumber() %>&name=navigation.<%=nav.getID() + ".visible&value=true" %>"><%= nav.getName() %></a>
			   </strike>
			<% } %>
		<% } %>
                <% } %>
	   <% } %>	
				</mm:node>
				</mm:cloud>
			</mm:compare>
		</mm:field></a></td> </tr>
</table>
</div>
</mm:node>
</head>
<body>
</body>
</html>
</mm:cloud>
