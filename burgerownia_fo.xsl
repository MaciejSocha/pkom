<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:fo="http://www.w3.org/1999/XSL/Format">
  	<xsl:output method="xml" indent="yes" encoding="utf-8"/>

  	<xsl:template match="/">
  		<fo:root font-family="Times">
  			<fo:layout-master-set>
  				<fo:simple-page-master master-name="Strona" page-width="210mm" page-height="297mm" margin-top="1cm" margin-bottom="1cm" margin-left="1cm" margin-right="1cm">
  					<fo:region-body margin="3cm" />
  				</fo:simple-page-master>
  			</fo:layout-master-set>

  			<fo:page-sequence master-reference="Strona">
  				<fo:flow flow-name="xsl-region-body">
				  	<fo:block text-align="right">
  						<xsl:call-template name="data" />
					</fo:block>
  					<fo:block linefeed-treatment="preserve">
  						<xsl:value-of select="'&#xa;'"/>
  						<xsl:call-template name="autorzy" />
  						<xsl:value-of select="'&#xa;'"/>
  						<xsl:call-template name="statystyki" />
  						<xsl:value-of select="'&#xa;'"/>
  					</fo:block>

					<fo:table>
					<fo:table-column column-width="50mm"/>
					<fo:table-column column-width="20mm"/>
					<fo:table-column column-width="30mm"/>
					<fo:table-column column-width="30mm"/>
					<fo:table-column column-width="60mm"/>
						
					<fo:table-header>
						<fo:table-row> 
							<fo:table-cell border-bottom-style="solid" border-top-style="solid" border-left-style="solid">
								<fo:block padding-start="10px" font-weight="bold">Nazwa:</fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid" border-top-style="solid" border-left-style="solid">
								<fo:block padding-start="10px" font-weight="bold">Cena:</fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid" border-top-style="solid" border-left-style="solid">
								<fo:block padding-start="10px" font-weight="bold">Kaloryczność:</fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid" border-top-style="solid" border-left-style="solid">
								<fo:block padding-start="10px" font-weight="bold">Mięsność:</fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid" border-top-style="solid" border-left-style="solid" border-right-style="solid">
								<fo:block padding-start="10px" font-weight="bold">Składniki:</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>

					<fo:table-body border-width="4px" border-style="solid">
						<xsl:for-each select="/burgerMenu/burger">
						<fo:table-row>
							<fo:table-cell background-color="#d3d3d3" border-bottom-style="solid" border-left-style="solid">
								<fo:block padding-start="10px"><xsl:value-of select=".//nazwa" /></fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid">
								<fo:block padding-start="10px"><xsl:value-of select=".//cena" /></fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#d3d3d3" border-bottom-style="solid">
								<fo:block padding-start="10px"><xsl:value-of select=".//kaloryczność" /></fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid">
								<fo:block padding-start="10px"><xsl:value-of select=".//mięsność" /></fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#d3d3d3" border-bottom-style="solid" border-right-style="solid">							
								<fo:block padding-start="10px">
									<xsl:value-of select = ".//skladnik1" />									
									<xsl:if test=".//skladnik2">
										<xsl:value-of select = "concat(', ', .//skladnik2)" />
									</xsl:if>
									<xsl:if test=".//skladnik3">
										<xsl:value-of select = "concat(', ', .//skladnik3)" />
									</xsl:if>
									<xsl:if test=".//skladnik4">
										<xsl:value-of select = "concat(', ', .//skladnik4)" />
									</xsl:if>
									<xsl:if test=".//skladnik5">
										<xsl:value-of select = "concat(', ', .//skladnik5)" />
									</xsl:if>
									<xsl:if test=".//skladnik6">
										<xsl:value-of select = "concat(', ', .//skladnik6)" />	
									</xsl:if>								
									<xsl:if test=".//skladnik7">
										<xsl:value-of select = "concat(', ', .//skladnik7)" />	
									</xsl:if>
									<xsl:if test=".//skladnik8">
										<xsl:value-of select = "concat(', ', .//skladnik8)" />
									</xsl:if>
								</fo:block>   							
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>								
					</fo:table-body>
					</fo:table>
  				</fo:flow>
  			</fo:page-sequence>
  		</fo:root>
  	</xsl:template>

	<xsl:variable name='newline'><xsl:text></xsl:text></xsl:variable>

  	<xsl:template name="autorzy">
  		Autorzy: 
		<xsl:for-each select="/burgerMenu/informacje/autorzy/autor">
			<xsl:value-of select="concat(' * ', ., '&#xA;')"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="data">
		<xsl:value-of select="/burgerMenu/informacje/dataUtworzenia" />
	</xsl:template>

	<xsl:template name="statystyki" match="/burgerMenu/informacje/dane">
		<xsl:value-of select="concat('Liczba składników: ', /burgerMenu/informacje/dane/liczbaSkładników, '&#xa;')"/>
		<xsl:value-of select="concat('Liczba alergenów: ', /burgerMenu/informacje/dane/liczbaAlergenów, '&#xa;')"/>
		<xsl:value-of select="concat('Liczba burgerów: ', /burgerMenu/informacje/dane/liczbaBurgerów, '&#xa;')"/>
		<xsl:value-of select="concat('Liczba brgerów mięsnych: ', /burgerMenu/informacje/dane/liczbaBurgerówMięsnych, '&#xa;')"/>
		<xsl:value-of select="concat('Liczba burgerów wegetariańskich: ', /burgerMenu/informacje/dane/liczbaBurgerówWegetariańskich, '&#xa;')"/>
		<xsl:value-of select="concat('Liczba burgerów wegańskich: ', /burgerMenu/informacje/dane/liczbaBurgerówWegańskich, '&#xa;')"/>
		<xsl:value-of select="concat('Najdroższy burger: ', /burgerMenu/informacje/dane/najdroższyBurger, '&#xa;')"/>
		<xsl:value-of select="concat('Natańszy burger: ', /burgerMenu/informacje/dane/natańszyBurger, '&#xa;')"/>
		<xsl:value-of select="concat('Średnia cena: ', /burgerMenu/informacje/dane/średniaCena, '&#xa;')"/>
		<xsl:value-of select="concat('Najbardziej kaloryczny: ', /burgerMenu/informacje/dane/najbardziejKaloryczny, '&#xa;')"/>
		<xsl:value-of select="concat('Najmniej kaloryczny: ', /burgerMenu/informacje/dane/najmniejKaloryczny, '&#xa;')"/>
		<xsl:value-of select="concat('Średnia kaloryczność: ', /burgerMenu/informacje/dane/średniaKaloryczność, '&#xa;')"/>
	</xsl:template>

</xsl:stylesheet>