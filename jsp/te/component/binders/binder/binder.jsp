<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:cloud>
<mm:node number="<%= findParentParam(navigation,"binders").getID() %>">

	<te:field  name="title"/>
	<mm:related path="images,categories" fields="images.number,categories.name" constraints="categories.name <>'logo'" max="1">
		<mm:node element="images">
		   <div class="images">
		   <img src="<mm:image template="s(200x200)"/>">
		   <te:field name="description"/>
		   </div>
		</mm:node>
	</mm:related>
	<te:field  name="subtitle"/>
	<te:field  name="intro"/>
	<te:field  name="html(body)"/>
</mm:node>
</mm:cloud>
