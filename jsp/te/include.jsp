<%@page language="java" contentType="text/html; charset=ISO-8859-1" %><%@
taglib uri="http://www.mmbase.org/mmbase-taglib-1.0" prefix="mm" %><%@
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
  while (mapsNavigation.getProperty("maps") == null){
	mapsNavigation = mapsNavigation.getParentNavigation();
        if (mapsNavigation == null){
		throw new Exception("can not find the maps navigation");
	}
  }
  String maps= (String)request.getAttribute("maps");
  String episodes= (String)request.getAttribute("episodes");
%>
