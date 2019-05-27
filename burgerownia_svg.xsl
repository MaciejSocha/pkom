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
				</g>
        
			<svg:text x="30" y='{position()*35 + 60}' fill="black" font-size="20" >				
				<xsl:apply-templates select="nazwa"/>
			</svg:text>
		</xsl:for-each>
		
		<!-->
        <script type="text/javascript"> 
            <![CDATA[
            function onClickAutorzyPliku(evt) {
                var element = document.getElementById("podpis");
                var atrybut = element.getAttribute("visibility");
                if(atrybut === "visible"){
                    element.setAttribute("visibility", "hidden");
                }else{
                    element.setAttribute("visibility", "visible");
                }
            }]]>
        </script>
        <script type="text/javascript"> 
            <![CDATA[
            function onMouseOverWykres(evt) {
                document.getElementById("figure").setAttribute("visibility", "visible");
            }]]>
        </script>

        <script type="text/javascript">
            <![CDATA[
            function onMouseOutWykres(evt) {
                document.getElementById("figure").setAttribute("visibility", "hidden");
            }]]>
        </script>

		<-->
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
<!--> 
    <xsl:template name="skladnik1" match="@skladnik1">
        <xsl:element name="skladnik1">            
            <xsl:variable name="skladnik1" select="." />       
            <xsl:value-of select = "key('skladnik_klucz', $skladnik1)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik2" match="@skladnik2">
        <xsl:element name="skladnik2">
            <xsl:variable name="skladnik2" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik2)" />
        </xsl:element>
    </xsl:template>    

    <xsl:template name="skladnik3" match="@skladnik3">
        <xsl:element name="skladnik3">
            <xsl:variable name="skladnik3" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik3)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik4" match="@skladnik4">
        <xsl:element name="skladnik4">
            <xsl:variable name="skladnik4" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik4)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik5" match="@skladnik5">
        <xsl:element name="skladnik5">
            <xsl:variable name="skladnik5" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik5)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik6" match="@skladnik6">
        <xsl:element name="skladnik6">
            <xsl:variable name="skladnik6" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik6)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik7" match="@skladnik7">
        <xsl:element name="skladnik7">
            <xsl:variable name="skladnik7" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik7)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik8" match="@skladnik8">
        <xsl:element name="skladnik8">
            <xsl:variable name="skladnik8" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik8)" />
        </xsl:element>
    </xsl:template>

<xsl:template match="autor">
    <xsl:variable name="autor" select="concat('(', ./imie, ') ', ./nazwisko)"/>
    <xsl:value-of select="$autor"/>
</xsl:template>

<xsl:template match="informacje">
    <svg:g id="autorzy_pliku" class="button" width="90" height="45" onclick="onClickAutorzyPliku(evt)" cursor="pointer">
        <svg:rect rx="20" ry="20" x="15" y="190" width="90" height="45" fill="#184f0b" stroke="white"/>
        <svg:text x="30" y="215" fill="white" font-size="16" >Autorzy</svg:text>
    </svg:g>
    
    <svg:g id="podpis" visibility="hidden">
        <svg:rect rx="20" ry="20" x="125" y="400" width="690" height="30" fill="#184f0b" stroke="white"/>
        <svg:text x="470" y="420" font-size="16" fill="white" text-anchor="middle" >
            <xsl:apply-templates/>
        </svg:text>
    </svg:g>
</xsl:template>




    


<xsl:template match="Kluby_w_miastach">
    <svg:g id="rect"  onmouseover="onMouseOverWykres(evt)" onmouseout="onMouseOutWykres(evt)">
        <svg:rect class="wykres_tlo" x="130" y="90" height="250" width="600" fill="#FFFFFF" stroke="black"/>
        <svg:text x="425" y="130" font-size="16" fill="green" font-weight="bold" text-anchor="middle">
            Liczba klubów w danym mieście
        </svg:text>
    </svg:g>

    <svg:text x="140" y="320" font-size="11" fill="#003366" font-weight="bold">Manchester</svg:text>
    <svg:text x="230" y="320" font-size="11" fill="#003366" font-weight="bold">Londyn</svg:text>
    <svg:text x="305" y="320" font-size="11" fill="#003366" font-weight="bold">Liverpool</svg:text>
    <svg:text x="385" y="320" font-size="11" fill="#003366" font-weight="bold">Leicester</svg:text>
    <svg:text x="465" y="320" font-size="11" fill="#003366" font-weight="bold">Swansea</svg:text>
    <svg:text x="550" y="320" font-size="11" fill="#003366" font-weight="bold">Burnley</svg:text>
    <svg:text x="613" y="320" font-size="11" fill="#003366" font-weight="bold">Liczba miast</svg:text>


    <svg:g id="figure" visibility="hidden">
        
        <xsl:for-each select="*">
            <xsl:variable name="x_pozycja" select="170 + (79 * (position() - 1))"/>
            <xsl:variable name="y_pozycja" select="290 - (. * 7.5)"/>
            
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:value-of select="$x_pozycja"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="$y_pozycja"/>
                </xsl:attribute>
                <xsl:attribute name="fill">#003366</xsl:attribute>
                <xsl:attribute name="font-size">11</xsl:attribute>
                <xsl:attribute name="font-weight">bold</xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
            
            <svg:g visibility="visible">
                <xsl:element name="svg:rect">
                    <xsl:attribute name="fill">#4d004d</xsl:attribute>
                    <xsl:attribute name="x">
                        <xsl:value-of select="$x_pozycja - 5"/>
                    </xsl:attribute>
                    <xsl:attribute name="width">25</xsl:attribute>

                    <svg:animate attributeName="y" from="300" to="{300 - . * 7.5}" dur="3s" fill="freeze"/>
                    <svg:animate attributeName="height" from="1" to="{. * 7.5}" dur="3s" fill="freeze"/>
                </xsl:element>
            </svg:g>
            
        </xsl:for-each>
        
    </svg:g>
</xsl:template>

<-->


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