<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<div class="<%= component.getName() %>">
<jsp:include page="home_episodes_next.jsp"/>
<jsp:include page="home_episodes_previous.jsp"/>
</div>
