<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<div class="<%= component.getName() %>">
<mm:node number="<%= findParentParam(navigation,"maps").getID() %>">
<table border="0">
<% int counter =1; %>
<mm:relatednodes type="binders">

	<% if ( (counter  +2) % 3 == 0) { out.write("<tr>"); } %>
	<td>
		<div class="binders">
			<a href="<te:url/>"><te:field  name="title"/></a>
			<te:field  name="subtitle"/>
			<te:field  name="intro"/>
			<mm:relatednodes type="images" max="1">
				 <img src="<mm:image template="s(140x140)+part(10,10,110,100)"/>" />
			</mm:relatednodes>
		</div>
	</td>
	<% if (counter % 3 == 0) { out.write("</tr>"); }%>
	<% counter ++ ;%>
</mm:relatednodes>
<%-- close td nicely --%>
<% counter -- ;%>
<%  if (counter % 3 != 0) {
	while(counter % 3 != 0) { 
		out.write("<td></td>"); 
		counter ++ ;
        };
	out.write("</tr>");
   } 
%>
</table>
</div>
</mm:node>
</mm:cloud>

