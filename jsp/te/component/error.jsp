<%@include file="../include.jsp"%><% 
  Throwable t = (Throwable)request.getAttribute("throwable");
%>
<table border="100">
<tr><th align="left"><%= t.getMessage()  %></th></tr>
<%
	StringWriter wr = new StringWriter();
	PrintWriter pw = new PrintWriter(wr);
	t.printStackTrace(pw);
%>
<tr><td><pre><%= wr  %></pre></div></td></tr>
</table>
