<%@page language="java" contentType="text/html; charset=ISO-8859-1" session="false"%><%@
taglib uri="http://www.mmbase.org/mmbase-taglib-1.0" prefix="mm" %><%@
taglib uri="http://www.mmbase.org/te-taglib-1.0" prefix="te" %><%@
page import="te.*"%><%@
page import="te.util.*"%><%@
page import="te.jsp.*"%><%@
page import="nl.vpro.*"%><%@
page import="java.util.*"%><%@
page import="org.mmbase.bridge.*"%><%@
page import="org.mmbase.util.*"%><%@
page import="java.io.*"%><% 
  WhiteBoard wb = (WhiteBoard)request.getAttribute("wb") ;
  Facade facade = wb.getFacade();
  Navigation navigation = wb.getCurrentNavigation();
  Navigation mapsNavigation = findParentParam(navigation,"maps");
%>
<%!
	Navigation findParentParam(Navigation current ,String type){
		Navigation e = current;
		do {
			if (e instanceof NavigationParam){
				NavigationParam p = (NavigationParam)e;
				if (p.getType().equals(type)){
					return e;
				}
			}
		} while(  (e = e.getParentNavigation()) != null);
		return null;
        }
%>
