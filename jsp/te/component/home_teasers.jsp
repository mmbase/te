<%@include file="../include.jsp"%><% 
  Component component = (Component)request.getAttribute("component");
%>
<mm:import externid="curnav"><%= navigation.getID() %></mm:import>
<mm:cloud>
<mm:node referid="curnav">
	<%-- list of theasers pos 1 till 9 --%>
	<div class="teasers1to9">
	<mm:related path="kaft,posrel,teasers" fields="posrel.pos" constraints="posrel.pos >0 and posrel.pos < 10 " orderby="posrel.pos">
		<div class="teasers">
		<mm:node element="teasers">
			<te:field name="title"/>
			<%-- no subtitle in teasers ... <te:field name="subtitle"/> --%>
			<te:field name="html(body)"/>
			<mm:relatednodes type="images">
				 <img src="<mm:image template="s(140x140)+part(10,10,110,100)"/>" align="right"/>
			</mm:relatednodes>
		</mm:node>
		</div>
	</mm:related>
	</div>
	<%-- list of theasers pos 10 till 19 --%>
	<div class="teasers10to19">
	<mm:related path="kaft,posrel,teasers" fields="posrel.pos" constraints="posrel.pos >9 and posrel.pos < 20 " orderby="posrel.pos">
		<div class="teasers">
		<mm:node element="teasers">
			<te:field name="title"/>
			<te:field name="html(body)"/>
		</mm:node>
		</div>
	</mm:related>
	</div>
	<%-- list of theasers pos 10 till 19 --%>
	<div class="teasers20to29">
	<mm:related path="kaft,posrel,teasers" fields="posrel.pos" constraints="posrel.pos >19 and posrel.pos < 30 " orderby="posrel.pos">
		<div class="teasers">
		<mm:node element="teasers">
			<te:field name="title"/>
		</mm:node>
		</div>
	</mm:related>
	</div>
</mm:node>
</mm:cloud>
