<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<mm:node number="<%= binders %>">
<div class="content">
	<mm:related path="images,categories" fields="images.number,categories.name" constraints="categories.name='logo'">
		<mm:node element="images">
		   <img src="<mm:image template="s(200x200)"/>">
		</mm:node>
	</mm:related>

	<te:field  name="title"/>
	<te:field  name="subtitle"/>
	<te:field  name="intro"/>
	<te:field  name="html(body)"/>
</div>
</mm:node>
</mm:cloud>

