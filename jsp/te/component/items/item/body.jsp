<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<div class="content">
<mm:cloud>
	<mm:node number="<%= findParentParam(navigation,"items").getID() %>">
		<p>
		<mm:field name="html(intro)"/>
		</p>
		<p>
		 <mm:field name="html(description)"/>
		</p>
		<mm:related path="insrel,items">
			<mm:node element="items">
				<p>
				<mm:field name="title"/><br>
				<mm:field name="subtitle"/>
				</p>
			</mm:node>
		</mm:related>
	</mm:node>
</mm:cloud>
</div>
