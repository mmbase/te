<%@include file="include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<% 
	 Template template = (Template)request.getAttribute("template");
	//wb.getHttpServletResponse().addHeader("Cache-Control","no-cache");
        //wb.getHttpServletResponse().addHeader("Pragma","no-cache");
	response.addHeader("Cache-Control","no-cache");
        response.addHeader("Pragma","no-cache");
%>
<mm:cloud name="mmbase" method="http" jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<h1>te registry</h1>
<p>
De regsitry bevat alle componenten die door het te systeem kunnen worde hetbruikt
(components,templates,containers en layout managers). deze componenten zijn leeg (containers bevatten geen componenten etc)
Een Template is in dit geval dan ook een lege huls.

kies en component om er meer informatie over te krijgen.
<table>
	<tr><th>templates</th><th>components</th><th>containers</th><th>layout managers</th></tr>
<% 
  Templates templates = facade.getComponentRegistry().getTemplates();
  Collections.sort(templates,templates);
  Components components = facade.getComponentRegistry().getComponents();
  Collections.sort(components,components);
  Containers  containers= facade.getComponentRegistry().getContainers();
  Collections.sort(containers,containers);
  LayoutManagers layoutManagers = facade.getComponentRegistry().getLayoutManagers();

%>
<tr>
	<td>
	<form>
		<select name="select_template" onChange="form.submit()">
			<option name="nome">----</option>
			<% for (int x =0 ; x < templates.size() ; x++){ %>
				<% Template t = templates.getTemplate(x); %>
				<option value="<%= t.getName() %>" <%= (t.getName().equals(request.getParameter("select_template")))?" selected='true'":""%> ><%= t.getName() %></option>
			<% } %>
		</select>
       </form>
	</td>
	<td>
	<form>
		<select name="select_components" onChange="form.submit()">
			<option name="nome">----</option>
			<% for (int x =0 ; x < components.size() ; x++){ %>
				<% Component t = components.getComponent(x); %>
				<option value="<%= t.getName() %>" <%= (t.getName().equals(request.getParameter("select_components")))?" selected='true'":""%> ><%= t.getName() %></option>
			<% } %>
		</select>
       </form>
	</td>
	<td>
	<form>
		<select name="select_containers" onChange="form.submit()">
			<option name="nome">----</option>
			<% for (int x =0 ; x < containers.size() ; x++){ %>
				<% Container t = containers.getContainer(x); %>
				<option value="<%= t.getName() %>" <%= (t.getName().equals(request.getParameter("select_containers")))?" selected='true'":""%> ><%= t.getName() %></option>
			<% } %>
		</select>
       </form>
	</td>
	<td>
	<form>
		<select name="select_layoutmanagers" onChange="form.submit()">
			<option name="nome">----</option>
			<% for (int x =0 ; x < layoutManagers.size() ; x++){ %>
				<% LayoutManager t = layoutManagers.getLayoutManager(x); %>
				<option value="<%= t.getName() %>" <%= (t.getName().equals(request.getParameter("select_layoutmanagers")))?" selected='true'":""%> ><%= t.getName() %></option>
			<% } %>
		</select>
       </form>
	</td>
</tr>
<tr>
	<% 
		String select_layoutmanagers = request.getParameter("select_layoutmanagers");
		String select_containers = request.getParameter("select_containers");
		String select_components = request.getParameter("select_components");
		String select_template = request.getParameter("select_template");
	%> 
	<% if (select_template != null ) { %>
		</tr>
		<tr>
		<% Template t = templates.getTemplateByName(select_template) ;%>
		<td>
		<%= t.getName() %>
		</td>
		<td colspan="3">
		<%= t.getDescription() %>
		</td>
		</tr>
	<% } %>
</tr>
</table>
</p>
<p>
De registry wordt bij het opstarten uit een xml bestand gelezen. Als er nieuwe componenten zijn toegevoegd aan de registry
kan het nodig zijn deze te herladen. Dit kan met deze knop.
<% if ("updateregistry".equals(request.getParameter("action"))) { %>
	<% facade.getComponentRegistry().updateRegistry() ;%>
	<font color="green">regsitry updated</font>
<% } %>
<form>
	<input type="hidden" name="action" value="updateregistry"/>
	<input type="submit" value="registry herladen"/>
</form>
</p>

</body>
</html>
</mm:cloud>
