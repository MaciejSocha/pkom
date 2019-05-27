<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="text" />

	<xsl:template name="burgery" match="/burgerMenu" >
		<xsl:element name="burgerMenu">
			<xsl:call-template name="informacje" />
		</xsl:element>
	</xsl:template>

	<xsl:template name="informacje">
		<xsl:element name="info" >
			<xsl:element name="autorzy">
				<xsl:for-each select="informacje/autorzy/autor">
					<xsl:element name="autor">
						<xsl:value-of select="concat('Autor: ', ., '&#xa;')"/>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<xsl:element name="data" >
				<xsl:value-of select="informacje/dataUtworzenia/concat('Data utworzenia dokumentu: ', ., '&#xa;')" />
			</xsl:element>
			<xsl:element name="dane">
				<xsl:for-each select="informacje/dane" >
					<xsl:value-of select="." />
				</xsl:for-each>
			</xsl:element>
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>