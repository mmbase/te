<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
			<xsl:call-template name="Header">
			</xsl:call-template>
			<xsl:call-template name="Body">
			</xsl:call-template>
	</xsl:template>

	<xsl:template name="Header">
	    <div class="search_title">Zoekresultaten </div>
	</xsl:template>

	<xsl:template name="Body">
		<div class="content">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="searchresults">
		<table cellspacing="0" cellpadding="0">
	<tr><td colspan="2">
			<xsl:value-of select="//child::header/firstdisplayed"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			of	
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="//child::header/lastdisplayed"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		       	total 
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="//child::header/matches"/>
	</td></tr>
	<tr><td>
		woorden </td><td> <xsl:value-of select="//child::header/words"/>
	</td></tr>
	<tr><td>
		page </td><td> <xsl:value-of select="//child::header/page"/>
	</td></tr>
	</table>
	<br/>

	<xsl:for-each select="entry">
		<table cellspacing="0" cellpadding="0">
	<tr><td>
		url </td><td><a><xsl:attribute name="href">
				<xsl:value-of select="url"/>
				</xsl:attribute>
				<xsl:value-of select="url"/></a>
	</td></tr>
	<tr><td>
		title </td><td> <xsl:value-of select="title"/>
	</td></tr>
	<tr><td>
 		modified </td><td> <xsl:value-of select="modified"/>
	</td></tr>
	<tr><td>
 		percent </td><td> <xsl:value-of select="percent"/>%
	</td></tr>
	<tr><td valign="top">
 		meta </td><td> <xsl:copy-of select="meta"/>
	</td></tr>
	<tr><td valign="top">
 		descriptions </td><td> <xsl:copy-of select="descriptions"/>
	</td></tr>
	<tr><td valign="top">
 		excerpt </td><td> <xsl:copy-of select="excerpt"/>
	</td></tr>
	</table>
 		<br/>
	</xsl:for-each>

	<br/>
	<br/>
		<xsl:value-of select="//child::footer/pages"/> pagina's<br/>
	<xsl:for-each select="//child::footer/prevpage/page">
		<xsl:choose>
		<xsl:when test="link">
			<a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
	 		<xsl:value-of select="name"/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="name"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	</xsl:for-each> 
	
	<xsl:for-each select="//child::footer/pagelist/page">
		<xsl:choose>
		<xsl:when test="link">
			<a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
	 		<xsl:value-of select="name"/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="name"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	</xsl:for-each> 
	
	<xsl:for-each select="//child::footer/nextpage/page">
		<xsl:choose>
		<xsl:when test="link">
			<a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
	 		<xsl:value-of select="name"/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="name"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	</xsl:for-each> 		 
	</xsl:template>

	<xsl:template match="nomatch">
		Geen resultaten<br/>
		<br/>
		words	<xsl:value-of select="words"/><br/>
	</xsl:template>

	<xsl:template match="syntax">
		Syntax error<br/>
		<br/>
		words	<xsl:value-of select="words"/><br/>
		error	<xsl:value-of select="error"/><br/>
	</xsl:template>
	
</xsl:stylesheet>
