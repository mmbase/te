<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<div class="content" width="200">
	<mm:list nodes="<%= findParentParam(navigation,"episodes").getID() %>" path="episodes,items" fields="episodes.number,items.number">
			<mm:node element="items" jspvar="thisItem">
				<% if (thisItem.getStringValue("number").equals(findParentParam(navigation,"items").getID())){ %>
				<nobr>-&gt;<mm:field name="title"/><br></nobr>
				<% } else { %>
				<nobr><a href="../<mm:field name="number"/>/"><mm:field name="title"/></a><br></nobr>
				<% } %>
			</mm:node>
	</mm:list>
</div>
</mm:cloud>
