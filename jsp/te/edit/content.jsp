<%@include file="../include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<% 
  Template template = (Template)request.getAttribute("template");
  Navigation editNav = navigation.getParentNavigation();
  wb.setCurrentNavigation(editNav);
  TemplateEditor editor = new TemplateEditor(editNav);
  Template t = editor.getTemplate();
  wb.setProperty("edit","true");
%>
<mm:cloud jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<mm:node number="<%= mapsNavigation.getID() %>">
<link rel="stylesheet" href="<te:url/>css/style.jsp" type="text/css"></link>
</mm:node>
<script>
var currentElement = null;
var path = null;
var prevColor = null;
function select(div){
	currentElement = div;
	prevColor = currentElement.style.color;
	//currentElement.style.color="green";
	var content = currentElement.className;
	var walker = div;
	while(walker.parentNode != null){
                walker = walker.parentNode;
                if(walker.className != null){
		   content += "|" + walker.className;
		}
	}
        var element = document.getElementById("monitor");
        element.innerHTML ="selected " + content;
	path = content;
}

function unselect(){
	//currentElement.style.color= prevColor;
	//currentElement = null;
}

function mouseDown(e){
 if (currentElement != null){
	parent.edit.location.href='edit.jsp?path=' + path;
 }
 return true;
}
if (document.captureEvents){
        document.captureEvents(Event.MOUSEDOWN);
}
document.onmousedown = mouseDown;

</script>
</head>
<body >
<style>
.header {
 background-color: #998877;
}
div {
 border: 3px solid;
}
</style>
<div class="<%= t.getName() %>">
<%
  LayoutManager layout = t.getLayoutManager();
  StringWriter sw = new StringWriter();
  PrintWriter pw = new PrintWriter(sw);
  layout.render(wb,t,pw);
  out.write(sw.toString());
%>
</div>
</body>
</html>
</mm:cloud>
