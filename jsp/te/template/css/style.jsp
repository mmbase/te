<%@page language="java" contentType="text/css" %>
<%@include file="../../include.jsp"%>
<mm:cloud jspvar="cloud">
body{
	background-color: white;
}
.episodestitle{
	background-color: green;
}

.episodepage .episodestitle{
	background-color: red;
}

div {
	background-color: #dedede;
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
td {
	vertical-align: top;
}

<%

String[] nodeManagers =new String[]{"maps","programs", "news", "episodes", "items", "images" ,"magazines","binders","archives","audiofragments","videofragments","urls", "attachments","email","serviceinfo","people","public","groups" ,"mmevents","teasers"};

for (int x =0 ; x < nodeManagers.length ; x ++){ 
	NodeManager nm = cloud.getNodeManager(nodeManagers[x]);
	FieldIterator iter = nm.getFields(NodeManager.ORDER_CREATE).fieldIterator();
	while(iter.hasNext()){
		Field field = iter.nextField();
		if (
		field.getState() != Field.STATE_SYSTEM &&  
		!field.getName().equals("number")
		&& !field.getName().equals("otype")
		&& !field.getName().equals("owner")
){
%>
.<%= nm.getName() %><%= field.getName() %> {
	<% if (field.getName().indexOf("title") != -1) { %>
		font-size: 20px;
	<%  }%>
}
<%} }} %>
</mm:cloud>
