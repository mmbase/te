<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
  //bread crum
  StringBuffer bc = new StringBuffer();
  Stack stack = new Stack();
  Navigation bcNav = navigation;
  while(bcNav != null && bcNav != mapsNavigation) {
       if (bcNav.getProperty("type") != null){
          stack.push(bcNav);
       }
       bcNav = bcNav.getParentNavigation();
   } ;
%>
<div class="<%= component.getName() %>">
<mm:cloud>
<% Navigation n = null;
   while( ! stack.isEmpty() &&  (n = (Navigation)stack.pop()) != null) { %>
	    <a href="<%= facade.getEngineURL() + n.getFullURLString() %>"><%= n.getGUIName()  %></a>
	    <% if (! stack.isEmpty() ) {%> &gt; <% } %>
<% } %>
</mm:cloud>

</div>
