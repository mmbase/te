<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- application -->
<xsl:template match="project">
<html>
<head><title><xsl:value-of select="@name"/></title></head>
<body bgcolor="#FFFFFF">
<table border="2">
  <tr>
    <td><font size="+1"><b><xsl:value-of select="@name"/></b></font></td>
  </tr>
	<tr>
		<td>
      <xsl:apply-templates select="tasks"/>
		</td>
	</tr>
</table>
</body>
</html>
</xsl:template>

<!-- builders -->
<xsl:template match="tasks">
	<ul>
      <xsl:apply-templates select="task"/>
	</ul>
</xsl:template>
<!-- builders -->
<xsl:template match="task">
	<li>
		  <xsl:value-of select="@name"/>
			<xsl:if test="task">
				 <ul>
         <xsl:apply-templates select="task"/>
				 </ul>
			</xsl:if>
	</li>
</xsl:template>

</xsl:stylesheet>


