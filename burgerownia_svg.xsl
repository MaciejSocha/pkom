<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes" encoding="UTF-8"/>

<xsl:template match="/">
<html>
<body>
	<xsl:for-each select="tracks/track">
		<b><xsl:value-of select="@id"/></b><br/>
		<xsl:for-each select="points/point">
			<xsl:value-of select="@x"/>,<xsl:value-of select="@y"/><br/>
		</xsl:for-each>
		<br/>
	</xsl:for-each>
</body>
</html>
</xsl:template>

</xsl:stylesheet>