<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:list nodes="<%= episodes %>" path="episodes,insrel,items" fields="episodes.number,insrel.number,items.number">
			<mm:node element="items">
				<a href="../<mm:field name="number"/>/"><mm:field name="title"/></a><br>
			</mm:node>
	</mm:list>
</mm:cloud>
