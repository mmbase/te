<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<mm:node number="<%= component.getProperty("number") %>">
<div class="content">
<table>
<tr> <td>
	<mm:relatednodes type="images">
		<img src="<mm:image template="s(100x100)"/>" align="right"/>
	</mm:relatednodes>

	<mm:field name="title"/>
	<mm:field name="subtitle"/>
	<mm:field name="html(intro)"/>
	<mm:field name="html(description)"/>
</td></tr>
</table>
</div>
</mm:node>
</mm:cloud>

