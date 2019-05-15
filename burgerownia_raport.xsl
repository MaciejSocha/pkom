<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template name="BurgerMenu" match="/burgerownia">
    	<xsl:element name="burgerMenu">
    		<xsl:apply-templates select="lista_burgerów" />
    	</xsl:element>
    </xsl:template>


 	<xsl:template name="Burgerownia" match="lista_burgerów">
        <xsl:apply-templates select="burger">
            <xsl:sort select="nazwa" />
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template name="Burger" match="burger">
        <xsl:element name="burger">
            <xsl:apply-templates select="nazwa"/>
            <xsl:apply-templates select="@mięsność" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="Nazwa" match="nazwa">
        <xsl:element name="nazwa">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>

    <xsl:template name="mięsność" match="@mięsność">
        <xsl:element name="mięsność">
            <xsl:variable name="mięsność" select="." />
            <xsl:value-of select="/burgerownia/lista_burgerów/burger[@mięsność = $mięsność]/@mięsność" />
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>