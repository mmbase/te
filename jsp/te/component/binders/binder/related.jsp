<%@include file="../../../include.jsp"%><%
  Component component = (Component)request.getAttribute("component");
%>
<div class="content">
<mm:cloud>
        <mm:node number="<%= binders %>">
                <%@include file="../../parts/related.jsp"%>
        </mm:node>
</mm:cloud>
</div>

