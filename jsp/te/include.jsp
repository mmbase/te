<%@page language="java" contentType="text/html;charset=utf-8" %><%@
taglib uri="http://www.mmbase.org/mmbase-taglib-1.0" prefix="mm" %><%@
page import="te.*"%><%@
page import="java.io.*"%><% 
  WhiteBoard wb = (WhiteBoard)request.getAttribute("wb") ;
  Facade facade = wb.getFacade();
  Navigation navigation = wb.getCurrentNavigation();
%>
