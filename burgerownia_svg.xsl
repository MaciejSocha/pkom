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

	<xsl:template match="/">			
		<svg:svg width="950" height="960" font-family="Tahoma">
			<svg:title>
				<svg:value-of select="burgerownia/metadane/nazwa_projektu"/>
			</svg:title>

			<svg:defs>
				<svg:linearGradient id="gradient">
					<svg:stop offset="0%" style="stop-color: #c4e1b5;"/>
				</svg:linearGradient>
			</svg:defs>

			<svg:rect x="0" y="0" width="950" height="50" fill="#ff7d38" stroke="white"/>
			<svg:text x="475" y="36" font-size="40" fill="white" font-weight="bold" text-anchor="middle">
				Burgerownia
			</svg:text>
			<svg:text x="810" y="20" font-size="16" fill="white" font-weight="bold" text-anchor="middle">
				Ostatnia aktualizacja: <xsl:value-of select="burgerMenu/informacje/dataUtworzenia"/>
			</svg:text>

			<image x="700" y="650" xlink:href="data:image/jpeg;base64,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PJRtJs4nD78Ypn+LRY/q0lh9ZVnh/wBIdH/MpVWdg1w9DPorWvu2D9VQK264+yopjgk0d9cC/WpH8dNw9SIU2ltXA1NKtA/zsC52puo3l6KLU3SbyTkcHbNw+HePCGHs6fkUOy6J+r6rg3boN5BfW7suGjnDs4hOfQe53X6no8j8R+C2M2ZTGk+i4duxa40q1R/7H/ittPZWIH+dV/3X/io9ib+Z3LcK0LYKYC4luzcR/wB6r/uO/FbG7JrcatT/AHHfil/Ij3O0svjqoGpA7lck3Yjzq5x7uJ+a3U93hyS36D3OiftCkNajB/MFodtqiPrg9gT8lApbAHJTKexQOCfEODF23G/Va8+QA9Vgdp1He6wDuSVYUtmNCkswrRwU0/UjgqGtrP1cR2spWH2dFyrNrAFkpoWaadEBbQF9RSQEREAREQBERAEREAREQHyEhfUQHzKkL6iA+QkL6iAxyDkvhpN5BZogNRw7fshYnCs+yFvRAR/ojPsr79FbyC3ogNIw7eS+iiOS2ogMAwclllX1EB8hfYREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREB//2Q==" height="200" width="200" >
				  <animateTransform
    attributeName="transform"
    type="rotate"
    from="0 800 750"
    to="360 800 750"
    dur="1s"
    repeatCount="1" begin="click" />
			</image>


			<svg:rect x="0" y="930" width="950" height="40" fill="#ff7d38" stroke="white"/>


			<xsl:call-template name="Przyciski" />
			<svg:text x="10" y="952" font-size="20" fill="white">
				Autorzy:
				<xsl:for-each select="burgerMenu/informacje/autorzy/autor">
					<xsl:value-of select="."/>
					<xsl:value-of select="' '"/>
				</xsl:for-each>
			</svg:text>

			<style>
			.cogSmall,
.cogBig {
  animation-name: spin;
  animation-duration: 4000ms;
  animation-iteration-count: infinite;
  animation-timing-function: linear;
  transform-origin:15.887px 29.88px;
  animation-play-state: paused;
}
.cogSmall {
  animation-duration: 3000ms;
  transform-origin: 24.691px 35.778px;
  animation-direction: reverse;
}

.cogBig:hover {
  animation-play-state: running;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
				.r
				{
					opacity: 1;
				}
				g.button:hover
				{
					opacity: 0.7;
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
				<svg:rect class="cogBig" x="25" y='{position()*35 + 30}' width="220" height="30" fill="#ff7d38" stroke="white">
					
				</svg:rect>
				<svg:text x="30" y='{position()*35 + 50}' fill="white" font-size="20" font-weight="bold"  >				
					<xsl:apply-templates select="nazwa"/>
				</svg:text>
				<svg:rect class="control" cursor="pointer" x="25" y='{position()*35 + 30}' width="220" height="30" fill="#ff7d38" stroke="white" opacity="0"/>
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
			</xsl:for-each>
		</svg:svg>  
	</xsl:template>

	<xsl:template name="Nazwa" match="nazwa"> <xsl:value-of select="."/> </xsl:template>
	<xsl:template name="Cena" match="cena"> <xsl:value-of select="."/> </xsl:template>	
	<xsl:template name="Kaloryczność" match="kaloryczność"> <xsl:value-of select="."/>	</xsl:template>
	<xsl:template name="data_wprowadzenia" match="data_wprowadzenia"> <xsl:value-of select="."/> </xsl:template>
	<xsl:template name="mięsność" match="mięsność"> <xsl:value-of select="."/>	</xsl:template>
	<xsl:template name="skladnik1" match="skladnik1"> <xsl:value-of select="."/> </xsl:template>
	<xsl:template name="skladnik2" match="skladnik2"> <xsl:value-of select="."/> </xsl:template> 
	<xsl:template name="skladnik3" match="skladnik3"> <xsl:value-of select="."/> </xsl:template>
	<xsl:template name="skladnik4" match="skladnik4"> <xsl:value-of select="."/> </xsl:template>
	<xsl:template name="skladnik5" match="skladnik5"> <xsl:value-of select="."/> </xsl:template>
	<xsl:template name="skladnik6" match="skladnik6"> <xsl:value-of select="."/> </xsl:template>
	<xsl:template name="skladnik7" match="skladnik7"> <xsl:value-of select="."/> </xsl:template>
	<xsl:template name="skladnik8" match="skladnik8"> <xsl:value-of select="."/> </xsl:template>

	<xsl:template name="Przyciski">
		<a xlink:href="raport.xhtml" target="_blank"> 
			<svg:g class="button" cursor="pointer">
				<svg:rect x="0" y="880" width="237.5" height="50" fill="#ff7d38" stroke="white"/>
				<svg:text text-anchor="middle" x="118.73" y="910" fill="white" font-size="16">XHTML</svg:text>
			</svg:g>
		</a>

		<a xlink:href="raport.pdf" target="_blank"> 
			<svg:g class="button" cursor="pointer">
				<svg:rect x="237.5" y="880" width="237.5" height="50" fill="#ff7d38" stroke="white"/>
				<svg:text text-anchor="middle" x="356.25" y="910" fill="white" font-size="16">PDF</svg:text>
			</svg:g>
		</a>

		<a xlink:href="raport.xml" target="_blank"> 
			<svg:g class="button" cursor="pointer">
				<svg:rect x="475" y="880" width="237.5" height="50" fill="#ff7d38" stroke="white"/>
				<svg:text text-anchor="middle" x="593.75" y="910" fill="white" font-size="16">XML</svg:text>
			</svg:g>
		</a>

		<a xlink:href="raport.txt" target="_blank"> 
			<svg:g class="button" cursor="pointer">
				<svg:rect x="712.5" y="880" width="237.5" height="50" fill="#ff7d38" stroke="white"/>
				<svg:text text-anchor="middle" x="831.25" y="910" fill="white" font-size="16">TXT</svg:text>
			</svg:g>
		</a>
	</xsl:template>
</xsl:stylesheet>