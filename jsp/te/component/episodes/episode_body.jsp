<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
	<mm:node number="<%= episodes %>">
		<p>
		<mm:field name="html(intro)"/>
		</p>
		<p>
		 <mm:field name="html(description)"/>
		</p>
		<mm:related path="insrel,items">
			<mm:node element="items">
				<p>
				<a href="items/<mm:field name="number"/>/"><mm:field name="title"/></a><br>
				<mm:field name="subtitle"/>
				</p>
			</mm:node>
		</mm:related>
	</mm:node>
</mm:cloud>
