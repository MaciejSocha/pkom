<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				Hello
				<h1>metadane</h1>
				<xsl:for-each select="burgerownia/metadane/autor">
					<h2>autor</h2>
					<h3> Imie: 
						<xsl:value-of select="imie"/>
					</h3>
					<h3> Nazwisko: 
						<xsl:value-of select="nazwisko"/>
					</h3>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>