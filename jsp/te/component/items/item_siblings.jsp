<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<div width="200">
	<mm:list nodes="<%= episodes %>" path="episodes,insrel,items" fields="episodes.number,insrel.number,items.number">
			<mm:node element="items" jspvar="thisItem">
				<% if (thisItem.getStringValue("number").equals(items)){ %>
				<nobr>-&gt;<mm:field name="title"/><br></nobr>
				<% } else { %>
				<nobr><a href="../<mm:field name="number"/>/"><mm:field name="title"/></a><br></nobr>
				<% } %>
			</mm:node>
	</mm:list>
</div>
</mm:cloud>
