<%@include file="../../../include.jsp"%><%
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
        <mm:node number="<%= findParentParam(navigation,"news").getID() %>">
		<mm:relatednodes type="images">
<div class="content">
			<img src="<mm:image template="s(200x200)"/>">
			<mm:field name="description"/>
</div>
<br>
		</mm:relatednodes>
        </mm:node>
</mm:cloud>

