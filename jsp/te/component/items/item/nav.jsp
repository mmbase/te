<%@include file="../../../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<% 
  String episodeNumber = findParentParam(navigation,"episodes").getID();
  String itemNumber = navigation.getID();
%>

<mm:cloud>
<mm:import externid="episodeNumber"><%= episodeNumber %></mm:import>
<mm:import externid="itemNumber"><%= itemNumber %></mm:import>
  <mm:list nodes="$episodeNumber" path="episodes,insrel,items" fields="episodes.number,items.number" jspvar="list">
     <%-- selecte the item --%>
    <mm:node element="items">
      <mm:field name="number">
        <%-- if the item number equals the current item --%>
        <mm:compare value="$itemNumber">
          <mm:import id="index"><mm:index/></mm:import>
        </mm:compare>
      </mm:field>
    </mm:node>
  </mm:list>
<table>
<tr><td align="left">
  <mm:list nodes="$episodeNumber" path="episodes,insrel,items" fields="episodes.number,items.number" jspvar="list" offset="${+$index -2}" max="1">
    	<mm:node element="items">
		<a href="<te:url/>">Vorig item(<mm:field name="title"/>)</a>
        </mm:node>
  </mm:list>
</td><td align="right">
  <mm:list nodes="$episodeNumber" path="episodes,insrel,items" fields="episodes.number,items.number" jspvar="list" offset="$index" max="1">
    	<mm:node element="items">
		<a href="<te:url/>">Volgend item(<mm:field name="title"/>)</a>
	     </mm:node>
  </mm:list>
</td>
</table>
</mm:cloud>
