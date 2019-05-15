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
            <xsl:apply-templates select="cena"/>
            <xsl:apply-templates select="kaloryczność"/>
            <xsl:apply-templates select="@mięsność" />
            <xsl:apply-templates select="@skladnik1" />
            <xsl:apply-templates select="@skladnik2" />
            <xsl:apply-templates select="@skladnik3" />
            <xsl:apply-templates select="@skladnik4" />
            <xsl:apply-templates select="@skladnik5" />
            <xsl:apply-templates select="@skladnik6" />
            <xsl:apply-templates select="@skladnik7" />
            <xsl:apply-templates select="@skladnik8" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="Nazwa" match="nazwa">
        <xsl:element name="nazwa">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>

    <xsl:template name="Cena" match="cena">
        <xsl:element name="cena">
            <xsl:value-of select="concat(. , ' ', ./@waluta)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="Kaloryczność" match="kaloryczność">
        <xsl:element name="kaloryczność">
            <xsl:value-of select="concat(. , ' ', ./@jednostka)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="mięsność" match="@mięsność">
        <xsl:element name="mięsność">
            <xsl:variable name="mięsność" select="." />
            <xsl:value-of select="/burgerownia/lista_burgerów/burger[@mięsność = $mięsność]/@mięsność" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik1" match="@skladnik1">
        <xsl:element name="skladnik1">
            <xsl:variable name="skladnik1" select="." />
            <xsl:value-of select="/burgerownia/lista_składników/składnik[@idSkładnika = $skladnik1]" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik2" match="@skladnik2">
        <xsl:element name="skladnik2">
            <xsl:variable name="skladnik2" select="." />
            <xsl:value-of select="/burgerownia/lista_składników/składnik[@idSkładnika = $skladnik2]" />
        </xsl:element>
    </xsl:template>    

    <xsl:template name="skladnik3" match="@skladnik3">
        <xsl:element name="skladnik3">
            <xsl:variable name="skladnik3" select="." />
            <xsl:value-of select="/burgerownia/lista_składników/składnik[@idSkładnika = $skladnik3]" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik4" match="@skladnik4">
        <xsl:element name="skladnik4">
            <xsl:variable name="skladnik4" select="." />
            <xsl:value-of select="/burgerownia/lista_składników/składnik[@idSkładnika = $skladnik4]" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik5" match="@skladnik5">
        <xsl:element name="skladnik5">
            <xsl:variable name="skladnik5" select="." />
            <xsl:value-of select="/burgerownia/lista_składników/składnik[@idSkładnika = $skladnik5]" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik6" match="@skladnik6">
        <xsl:element name="skladnik6">
            <xsl:variable name="skladnik6" select="." />
            <xsl:value-of select="/burgerownia/lista_składników/składnik[@idSkładnika = $skladnik6]" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik7" match="@skladnik7">
        <xsl:element name="skladnik7">
            <xsl:variable name="skladnik7" select="." />
            <xsl:value-of select="/burgerownia/lista_składników/składnik[@idSkładnika = $skladnik7]" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik8" match="@skladnik8">
        <xsl:element name="skladnik8">
            <xsl:variable name="skladnik8" select="." />
            <xsl:value-of select="/burgerownia/lista_składników/składnik[@idSkładnika = $skladnik8]" />
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>