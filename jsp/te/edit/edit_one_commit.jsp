<%@page language="java" %>
<%@include file="../include.jsp"%>
<%
	String path = request.getParameter("path");
	Enumeration enum = request.getParameterNames();
	
   StringBuffer sb = new StringBuffer();
   StringTokenizer st = new StringTokenizer(path,"|");
   boolean ok = false;
   while(st.hasMoreTokens()) { 
	String name = st.nextToken();
	if (request.getParameter("path_" + name) != null){
	   sb.insert(0," ." + name);
	   ok = true;
	}
   }
   sb.toString();
   sb.append("{\n");
   if (! ok) { %>
geen path geselecteerd
   <% return ; } 

	while(enum.hasMoreElements()){
		String key = (String)enum.nextElement();
		if (key.indexOf("-") != -1 &&  ! request.getParameter(key).equals("--") && ! request.getParameter(key).equals("")){
			if (key.startsWith("dummy-")) {//hack .. 
			  sb.append("\t" + key.substring(6) + ":" +  request.getParameter(key) + ";\n");
			} else {
			  sb.append("\t" + key + ":" +  request.getParameter(key) + ";\n");
			}
		}
		
	}
   String fgcolor =   request.getParameter("fgcolor");
   String bgcolor =   request.getParameter("bgcolor");
   if (fgcolor != null && fgcolor.length() >0){
			sb.append("\tcolor:" +  fgcolor + ";\n");
   }
   if (bgcolor != null && bgcolor.length() >0){
			sb.append("\tbackground-color:" +  bgcolor + ";\n");
   }
   sb.append("}\n\n");

	
%>
<mm:cloud uri="rmi://127.0.0.1:1111/templates" name="mmbase" method="http" jspvar="cloud"> 
<mm:node number="<%= mapsNavigation.getProperty("programmasites") %>" jspvar="node">
	<mm:setfield name="style"><%= node.getStringValue("style")  + sb.toString()  %></mm:setfield>
</mm:node>
</mm:cloud> 
<%@include file="index.jsp"%>
