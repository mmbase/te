<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
	while(component.getParentComponent() != null){
		component = component.getParentComponent();
	}
%>
<div>
 <%= component.getClass().getName() %><BR>	
</div>

