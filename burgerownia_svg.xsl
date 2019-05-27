<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:svg="http://www.w3.org/2000/svg" 
                xmlns="http://www.w3.org/2000/svg" 
                xmlns:xlink="http://www.w3.org/1999/xlink">
    
    <xsl:output method="xml" 
                media-type="image/svg" 
                encoding="utf-8" 
                indent="yes"
                doctype-public="-//W3C//DTD SVG 1.1//EN"
                doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>

<xsl:variable name="test" select="200" as="xs:integer"/>

<xsl:template match="/">
        
    <svg:svg width="950" height="960" font-family="Tahoma">
        <svg:desc>Raport stworzony na potrzeby <svg:value-of select="burgerownia/metadane/nazwa_projektu"/></svg:desc>
        <svg:title>
			<svg:value-of select="burgerownia/metadane/nazwa_projektu"/>
		</svg:title>

        <svg:defs>
            <svg:linearGradient id="gradient">
                <svg:stop offset="0%" style="stop-color: #c4e1b5;"/>
            </svg:linearGradient>
        </svg:defs>

		<svg:rect x="0" y="0" width="950" height="50" fill="#ff7d38" stroke="white"/>
        <svg:text x="475" y="40" font-size="40" fill="white" font-weight="bold" text-anchor="middle"><svg:value-of select="burgerMenu/informacje/dataUtworzenia"/></svg:text>

        <xsl:call-template name="Przyciski" />

        <style>
            g.button:hover
            {
                opacity: 0.7;
            }

            rect.wykres_tlo:hover
            {
                fill: #f2f2f2;
            }		
			.info{
				display: none;
			}
			.control:hover + .info
			{
				display: block;				
			}
        </style>
		
		<xsl:for-each select="burgerMenu/burger">

            	<svg:rect class="control" cursor="pointer" x="30" y='{position()*35 + 40}' width="200" height="30" fill="#ff7d38" stroke="white"/>
				<g class="info">
            		<svg:text text-anchor="middle" x="550" y="80" fill="black" font-size="30">
						Cena: <xsl:apply-templates select="cena"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="120" fill="black" font-size="30">
						Kaloryczność: <xsl:apply-templates select="kaloryczność"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="160" fill="black" font-size="30">
						Data wprowadzenia: <xsl:apply-templates select="data_wprowadzenia"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="200" fill="black" font-size="30">
						Mięsność: <xsl:apply-templates select="mięsność"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="240" fill="black" font-size="30">
						Składniki:
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="280" fill="black" font-size="20">
						<xsl:apply-templates select="skladnik1"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="310" fill="black" font-size="20">
						<xsl:apply-templates select="skladnik2"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="340" fill="black" font-size="20">
						<xsl:apply-templates select="skladnik3"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="370" fill="black" font-size="20">
						<xsl:apply-templates select="skladnik4"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="400" fill="black" font-size="20">
						<xsl:apply-templates select="skladnik5"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="430" fill="black" font-size="20">
						<xsl:apply-templates select="skladnik6"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="460" fill="black" font-size="20">
						<xsl:apply-templates select="skladnik7"/>
					</svg:text>
					<svg:text text-anchor="middle" x="550" y="490" fill="black" font-size="20">
						<xsl:apply-templates select="skladnik8"/>
					</svg:text>
				</g>
        
			<svg:text x="30" y='{position()*35 + 60}' fill="black" font-size="20" >				
				<xsl:apply-templates select="nazwa"/>
			</svg:text>
		</xsl:for-each>
    </svg:svg>  
</xsl:template>

<xsl:template name="Nazwa" match="nazwa">
	<xsl:value-of select="." />
</xsl:template>

<xsl:template name="Cena" match="cena">
    <xsl:value-of select="." />
</xsl:template>
 
<xsl:template name="Kaloryczność" match="kaloryczność">
    <xsl:value-of select="." />
</xsl:template>

<xsl:template name="data_wprowadzenia" match="@data_wprowadzenia">
    <xsl:value-of select="." />
</xsl:template>

<xsl:template name="mięsność" match="@mięsność">
    <xsl:value-of select="." />
</xsl:template>

<xsl:template name="skladnik1" match="skladnik1">     
    <xsl:value-of select = "." />
</xsl:template>

<xsl:template name="skladnik2" match="skladnik2">
    <xsl:value-of select = "." />
</xsl:template>    

<xsl:template name="skladnik3" match="skladnik3">
    <xsl:value-of select = "." />
</xsl:template>

<xsl:template name="skladnik4" match="skladnik4">
    <xsl:value-of select = "." />
</xsl:template>

<xsl:template name="skladnik5" match="skladnik5">
    <xsl:value-of select = "." />
</xsl:template>

<xsl:template name="skladnik6" match="skladnik6">
    <xsl:value-of select = "." />
</xsl:template>

<xsl:template name="skladnik7" match="skladnik7">
    <xsl:value-of select = "." />
</xsl:template>

<xsl:template name="skladnik8" match="skladnik8">
    <xsl:value-of select = "." />
</xsl:template>

<xsl:template name="Przyciski">
    <a xlink:href="raport.xhtml" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect x="0" y="900" width="237.5" height="50" fill="#ff7d38" stroke="white"/>
            <svg:text text-anchor="middle" x="118.73" y="930" fill="white" font-size="16">XHTML</svg:text>
        </svg:g>
    </a>

    <a xlink:href="raport.pdf" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect x="237.5" y="900" width="237.5" height="50" fill="#ff7d38" stroke="white"/>
            <svg:text text-anchor="middle" x="356.25" y="930" fill="white" font-size="16">PDF</svg:text>
        </svg:g>
    </a>

    <a xlink:href="raport.xml" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect x="475" y="900" width="237.5" height="50" fill="#ff7d38" stroke="white"/>
            <svg:text text-anchor="middle" x="593.75" y="930" fill="white" font-size="16">XML</svg:text>
        </svg:g>
    </a>

    <a xlink:href="raport.txt" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect x="712.5" y="900" width="237.5" height="50" fill="#ff7d38" stroke="white"/>
            <svg:text text-anchor="middle" x="831.25" y="930" fill="white" font-size="16">TXT</svg:text>
        </svg:g>
    </a>
</xsl:template> 

</xsl:stylesheet>