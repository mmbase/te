<mm:context>
<%-- 
Teaser can link to very different kinds of objects
(urls/binders/episodes/maps)
urls are listed first if there is an url skip the rest 
items are more complicated since they also need a episode
--%>
<mm:relatednodes type="urls" max="1">
	<mm:field id="teaser_link" name="url"/>
</mm:relatednodes>

<mm:notpresent referid="teaser_link">
  <mm:relatednodes type="binders" max="1">
    <mm:import id="teaser_link"><te:url/></mm:import>
  </mm:relatednodes>
</mm:notpresent>

<mm:notpresent referid="teaser_link">
  <mm:relatednodes type="episodes" max="1">
    <mm:import id="teaser_link"><te:url/></mm:import>
  </mm:relatednodes>
</mm:notpresent>

<mm:notpresent referid="teaser_link">
  <mm:relatednodes type="items" max="1">
	<mm:node id="item">
	<mm:relatednodes type="episodes" max="1">
		<mm:import id="teaser_link"><te:url referids="item"/></mm:import>
	</mm:relatednodes>
	</mm:node>
  </mm:relatednodes>
</mm:notpresent>

<mm:notpresent referid="teaser_link">
  <mm:relatednodes type="maps" max="1">
    <mm:import id="teaser_link"><te:url/></mm:import>
  </mm:relatednodes>
</mm:notpresent>

<mm:present referid="teaser_link">
  <a href="<mm:write referid="teaser_link"/>">
</mm:present>
<mm:notpresent referid="teaser_link">
  <a href="lost_in_space">
</mm:notpresent>
</mm:context>
