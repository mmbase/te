<%@include file="../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<mm:node number="<%= navigation.getID() %>">
<te:field name="title"/>
<te:field name="subtitle"/>
<table border="0">
<tr>
  <td>
	<te:field name="intro"/>
	<te:field name="body"/>
  </td>
</tr>
<tr>
  <td>
		<mm:related path="posrel,images" fields="posrel.pos" orderby="posrel.pos">
			<mm:node element="images">
				<img src="<mm:image template="s(100x100)"/>"><br>
				<te:field name="description"/>
			<br>
			</mm:node>
		</mm:related>
  </td>
</tr>
</table>
</mm:node>
</mm:cloud>
