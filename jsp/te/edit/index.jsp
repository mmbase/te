<%@include file="../include.jsp"%>
<%@page import="te.edit.*"%>
<%@page import="te.util.*"%>
<%@page import="minixml.*"%>
<% 
	 Template template = (Template)request.getAttribute("template");
	 Navigation editNav = navigation.getParentNavigation();
         String map = editNav.getID();
	 Template t = editNav.getTemplate();
	 XMLStorage xmlStorage = new XMLStorage();
	 String test = xmlStorage.componentToString(t);
%>
<mm:cloud jspvar="cloud">
<html>
<head>
<title><%= navigation.getName() %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<% Node node= cloud.getNode(map);
   NodeManager nm = node.getNodeManager();
   QueryBuilder qb = new QueryBuilder(node);
   RelationManagerList possibleRelationManagerList = qb.getAllowedRelations();
   RelationManagerList relationManagerList = qb.getUsedRelations();
%>
<TABLE>
    <tr>
        <td><%= nm.getGUIName() %></td>
        <td>
           <% for (int x =0 ;x < relationManagerList.size() ; x++){
                 RelationManager relman = relationManagerList.getRelationManager(x);
                 NodeManager otherNodeManager = relman.getSourceManager();
                 if ( otherNodeManager.getName().equals(nm.getName())){
                         otherNodeManager = relman.getDestinationManager();
                 }
                 out.println(relman.getForwardRole());
                 out.println(otherNodeManager.getGUIName() + "<BR>");
            } %>
        </td>
</tr>
</TABLE>
<pre>
<%= test %>
</pre>

<body >
</body>
</html>
</mm:cloud>
