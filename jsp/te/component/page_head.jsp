<%@include file="../include.jsp"%><%  Component component = (Component)request.getAttribute("component");%>
<div class="<%= component.getName() %>">
<table width="100%">	
  <tr>
    <td><img src="http://images.vpro.nl/img.db?vpro_logo_bitmap_wit_giff(gif)+colorizehex(744B23)" border="0"/></td>
    <td>&nbsp;<h2><%= findParentParam(navigation,"maps").getGUIName() %></h2></td>
    <td align="right"><img src="pics/vpro_top_right.png" border="0"/></td>
  </tr>
</table>
</div>
