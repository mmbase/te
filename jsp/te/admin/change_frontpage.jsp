<%@include file="include.jsp"%>
<%
  Template template = (Template)request.getAttribute("template");
  response.addHeader("Cache-Control","no-cache");
  response.addHeader("Pragma","no-cache");
%>
<mm:import externid="number" required="true" jspvar="number"/>
<mm:cloud name="mmbase" method="http" jspvar="cloud">
<% Vector v = new Vector();
  v.add("episodeshomepage");
  v.add("magazinehomepage");
  v.add("teasershomepage");
  v.add("weekhomepage");
%>
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<mm:node referid="number" jspvar="node">
<div class="tesites">
<form action="change_frontpage_commit.jsp" method="POST">
	<input type="hidden" name="number" value="<mm:field name="number"/>">
<table>
	<tr><td align="right">voorpagina</td><td>
	 <select name="frontpage" onChange="form.submit()">
	<option value="">--</option>
         <% Iterator iter = v.iterator(); %>
         <% while(iter.hasNext()) { %>
                <% String name = (String)iter.next(); %>
      		<option value="<%= name %>" <%= (name.equals(node.getStringValue("frontpage")))?"selected=\"true\"":""%>><%= name %></option>
         <% } %>
	</select>
</td></tr>
</table>
</form>
</div>
</mm:node>
</head>
<body>
</body>
</html>
</mm:cloud>
