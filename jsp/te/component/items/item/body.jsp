<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<div class="<%= component.getName() %>">
<mm:cloud>
	<mm:node number="<%= navigation.getID() %>">
		<p>
		<te:field name="html(intro)"/>
		</p>
		<p>
		 <te:field name="html(description)"/>
		</p>
		<mm:related path="insrel,items">
			<mm:node element="items">
				<p>
				<te:field name="title"/><br>
				<te:field name="subtitle"/>
				</p>
			</mm:node>
		</mm:related>
	</mm:node>
</mm:cloud>
</div>
