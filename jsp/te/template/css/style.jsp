<%@page language="java" contentType="text/css" %>
<%@include file="../../include.jsp"%>
<mm:cloud jspvar="cloud">
body{
	background-color: white;
}

div {
	background-color: #ffefef;
}

.title {
 	font-size: 16pt;
}
.intro {
 	font-weight: bold;
}

.selectednavigation{
	background-color: black;
	color: white;
}
<%

String[] nodeManagers =new String[]{ "news", "episodes", "items", "images" };

Hashtable hash =new Hashtable();
for (int x =0 ; x < nodeManagers.length ; x ++){ 
	NodeManager nm = cloud.getNodeManager(nodeManagers[x]);
	FieldIterator iter = nm.getFields(NodeManager.ORDER_CREATE).fieldIterator();
	while(iter.hasNext()){
		Field field = iter.nextField();
		hash.put(field.getName(),field.getName());
%>
.<%= nm.getName() %> .<%= field.getName() %> {
}


<% }} %>
</mm:cloud>
