<%@page language="java" session="false" contentType="text/html; charset=ISO-8859-1" %><%@
taglib uri="http://www.mmbase.org/mmbase-taglib-1.0" prefix="mm" %><%@
taglib uri="http://www.mmbase.org/te-taglib-1.0" prefix="te" %><%@
page import="org.mmbase.applications.te.*"%><%@
page import="org.mmbase.applications.te.jsp.*"%><%@
page import="java.util.*"%><%@
page import="org.mmbase.bridge.*"%><%@
page import="org.mmbase.util.*"%><%@
page import="org.mmbase.applications.te.edit.*"%><%@
page import="org.mmbase.applications.te.util.*"%><%@
page import="org.mmbase.applications.te.*"%><%@
page import="org.mmbase.applications.te.minixml.*"%><%@
page import="java.io.*"%><% 
  WhiteBoard wb = (WhiteBoard)request.getAttribute("wb") ;
  Facade facade = wb.getFacade();
  Navigation navigation = navigation = wb.getCurrentNavigation();
 // response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
 // response.addHeader("WWW-Authenticate", "Basic realm=\"" + "test" + "\"");
 Encode sqlEscape = new Encode("ESCAPE_SINGLE_QUOTE");
 Encode htmlAttributeEscape = new Encode("ESCAPE_HTML_ATTRIBUTE");
 Encode htmlEscape = new Encode("ESCAPE_HTML");
%>
