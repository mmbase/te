<%@page language="java" contentType="text/html; charset=ISO-8859-1" %><%@
taglib uri="http://www.mmbase.org/mmbase-taglib-1.0" prefix="mm" %><%@
taglib uri="http://www.mmbase.org/te-taglib-1.0" prefix="te" %><%@
page import="te.*"%><%@
page import="te.jsp.*"%><%@
page import="nl.vpro.*"%><%@
page import="java.util.*"%><%@
page import="org.mmbase.bridge.*"%><%@
page import="java.io.*"%><% 
  WhiteBoard wb = (WhiteBoard)request.getAttribute("wb") ;
  Facade facade = wb.getFacade();
  Navigation navigation = wb.getCurrentNavigation();
  Navigation mapsNavigation = navigation;
  String maps ="";
  String episodes ="";
  String items ="";
  String binders ="";
  Navigation finder = navigation;
  while (finder != null){
        System.err.println(finder.getName() + " "+ finder.getProperties());
	if (finder.getProperty("nodemanager") != null){
		String nodemanager = finder.getProperty("nodemanager");
		if (nodemanager.equals("maps")){
			maps = finder.getProperty("number");
	                mapsNavigation = finder;	
		}
		if (nodemanager.equals("episodes")){
			episodes = finder.getProperty("number");
		        System.err.println("episodes  = " + episodes);
		}
		if (nodemanager.equals("items")){
			items = finder.getProperty("number");
		}
		if (nodemanager.equals("binders")){
			binders = finder.getProperty("number");
		}
	}
	finder=finder.getParentNavigation();
  }
%>
