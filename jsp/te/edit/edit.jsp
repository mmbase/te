<%@page language="java" %>
<%@include file="../include.jsp"%>
<% Encode htmlEscape = new Encode("ESCAPE_HTML"); %>
<html>
<head>
<SCRIPT LANGUAGE="Javascript">
<jsp:include page="ColorPicker2.js" />
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
var cp = new ColorPicker('window'); // Popup window
var cp2 = new ColorPicker('window'); // Popup window
</SCRIPT>
</head>
<body>
<mm:cloud jspvar="cloud">

<%-- list of fields --%>
<%
String[] nodeManagers =new String[]{"maps","programs", "news", "episodes", "items", "images" ,"magazines","binders","archives","audiofragments","videofragments","urls", "attachments","email","serviceinfo","people","public","groups" ,"mmevents","teasers"};

Set fields = new HashSet();
for (int x =0 ; x < nodeManagers.length ; x ++){ 
	NodeManager nm = cloud.getNodeManager(nodeManagers[x]);
	FieldIterator iter = nm.getFields(NodeManager.ORDER_CREATE).fieldIterator();
	while(iter.hasNext()){
		Field field = iter.nextField();
		if (
		field.getState() != Field.STATE_SYSTEM &&  
		!field.getName().equals("number")
		&& !field.getName().equals("otype")
		&& !field.getName().equals("owner")){ 
			fields.add(field.getName());
                } 
        }
} %>

<% String path =request.getParameter("path"); %>
<% if (path != null){ %>
<form name=""styleform" id="styleform" action="edit_one_commit.jsp" target="_top" method="POST">
   <input type="hidden" name="path" value="<%= path %>"/>
   toe te passen op
<%   StringTokenizer st = new StringTokenizer(path,"|");
   while(st.hasMoreTokens()) { String name = st.nextToken() ;%>
	<input type="radio" name="path_<%= name %>"><%= name %></input> 
        <% if (st.hasMoreTokens()){ %>
		in
	<% } %>
   <%} %>
<hr>
font:
<select name="font-family">
	<option value="--">family</option>
	<option value="serif">Time</option>
	<option value="sans-serif">Arial or Helvetica</option>
	<option value="cursive">Zapf-Chancery</option>
	<option value="fantasy">Western</option>
	<option value="monospace">Courier</option>
</select>
<select name="font-style">
	<option value="--">style</option>
	<option value="normal">normal</option>
	<option value="italic">italic</option>
	<option value="oblique">oblique</option>
</select>
<select name="font-variant">
	<option value="--">variant</option>
	<option value="normal">normal</option>
	<option value="small-caps">small-caps</option>
</select>
<select name="font-weight">
	<option value="--">weight</option>
	<option value="normal">normal</option>
	<option value="bold">bold</option>
	<option value="bolder">bolder</option>
	<option value="lighter">lighter</option>
</select>
<select name="font-size">
	<option value="--">size</option>
	<option value="100%">100%</option>
	<option value="120%">120%</option>
	<option value="140%">140%</option>
	<option value="160%">160%</option>
	<option value="180%">180%</option>
	<option value="200%">200%</option>
</select>
<select name="text-transform">
	<option value="--">transform</option>
	<option value="capitalize">capitalize</option>
	<option value="uppercase">uppercase</option>
	<option value="lowercase">lowercase</option>
</select>
<select name="dummy-display">
	<option value="--">display</option>
	<option value="inline">inline</option>
</select>
<br>
fg:<INPUT TYPE="text" NAME="fgcolor" SIZE="6" VALUE=""> <A HREF="#" onClick="cp.select(document.forms['styleform'].fgcolor,'pick');return false;" NAME="pick" ID="pick">Pick</A><br>

bg:<INPUT TYPE="text" NAME="bgcolor" SIZE="6" VALUE=""> <A HREF="#" onClick="cp2.select(document.forms['styleform'].bgcolor,'pick2');return false;" NAME="pick2" ID="pick2">Pick</A>

<input type="submit" name="toepassen"/>
</form>
<% } %>
<mm:cloud uri="rmi://127.0.0.1:1111/templates">
<mm:node number="<%= mapsNavigation.getProperty("programmasites") %>">
<form method="post" action="edit_commit.jsp" target="_top">
	<textarea style="width: 100%" name="style" rows="10"><mm:field name="style"/></textarea>
	<input type="submit"/>
</form>
</mm:node>
</mm:cloud> 
</mm:cloud>
</body>
