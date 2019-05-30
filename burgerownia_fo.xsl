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
  					<fo:block linefeed-treatment="preserve">
  						<xsl:call-template name="data" />
  						<xsl:value-of select="'&#xa;'"/>
  						<xsl:call-template name="autorzy" />
  						<xsl:value-of select="'&#xa;'"/>
  						<xsl:call-template name="statystyki" />
  						<xsl:value-of select="'&#xa;'"/>
  					</fo:block>
  					
  					<fo:block>

					<fo:table-and-caption>
  						<fo:table border-style="solid">
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
						<fo:table-column column-width="25mm"/>
  							
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-weight="bold">Nazwa:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Cena:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Kaloryczność:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Mięsność:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Składnik 1:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Składnik 2:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Składnik 3:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Składnik 4:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Składnik 5:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Składnik 6:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Składnik 7:</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Składnik 8:</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
							<fo:table-body>
								<xsl:for-each select="/burgerMenu/burger">
								<fo:table-row>
									<fo:table-cell>
										<fo:block><xsl:value-of select=".//nazwa" /></fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block><xsl:value-of select=".//cena" /></fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block><xsl:value-of select=".//kaloryczność" /></fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block><xsl:value-of select=".//mięsność" /></fo:block>
									</fo:table-cell>
									<fo:table-cell>
							
    										<fo:block><xsl:value-of select = ".//skladnik1" /></fo:block>
    							
    								</fo:table-cell>
    								<fo:table-cell>
							
    										<fo:block><xsl:value-of select = ".//skladnik2" /></fo:block>
    							
    								</fo:table-cell>
    								<fo:table-cell>
								
    										<fo:block><xsl:value-of select = ".//skladnik3" /></fo:block>
    						
    								</fo:table-cell>
    								<fo:table-cell>
								
    										<fo:block><xsl:value-of select = ".//skladnik4" /></fo:block>
    								
    								</fo:table-cell>
    								<fo:table-cell>
									
    										<fo:block><xsl:value-of select = ".//skladnik5" /></fo:block>
    								
    								</fo:table-cell>
    								<fo:table-cell>
										
    										<fo:block><xsl:value-of select = ".//skladnik6" /></fo:block>
    								
    								</fo:table-cell>
    								<fo:table-cell>
    										<fo:block><xsl:value-of select = ".//skladnik7" /></fo:block>
    								</fo:table-cell>
    								<fo:table-cell>
    										<fo:block><xsl:value-of select = ".//skladnik8" /></fo:block>
    								</fo:table-cell>
								</fo:table-row>
								</xsl:for-each>

								
							</fo:table-body>
						</fo:table>
						</fo:table-and-caption>
  					</fo:block>

  				</fo:flow>
  			</fo:page-sequence>
  		</fo:root>
  	</xsl:template>

  	<xsl:template name="autorzy">
  		Autorzy: 
		<xsl:for-each select="/burgerMenu/informacje/autorzy/autor">
			<xsl:value-of select="concat('Autor: ', ., '&#xA;')"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="data">
		Data: 
		<xsl:value-of select="/burgerMenu/informacje/dataUtworzenia" />
	</xsl:template>

		<xsl:template name="statystyki" match="/burgerMenu/informacje/dane">
			<xsl:value-of select="concat('Liczba składników:', /burgerMenu/informacje/dane/liczbaSkładników, '&#xa;')"/>
			<xsl:value-of select="concat('Liczba alergenów:', /burgerMenu/informacje/dane/liczbaAlergenów, '&#xa;')"/>
			<xsl:value-of select="concat('Liczba burgerów:', /burgerMenu/informacje/dane/liczbaBurgerów, '&#xa;')"/>
			<xsl:value-of select="concat('Liczba brgerów mięsnych:', /burgerMenu/informacje/dane/liczbaBurgerówMięsnych, '&#xa;')"/>
			<xsl:value-of select="concat('Liczba burgerów wegetariańskich:', /burgerMenu/informacje/dane/liczbaBurgerówWegetariańskich, '&#xa;')"/>
			<xsl:value-of select="concat('Liczba burgerów wegańskich:', /burgerMenu/informacje/dane/liczbaBurgerówWegańskich, '&#xa;')"/>
			<xsl:value-of select="concat('Najdroższy burger:', /burgerMenu/informacje/dane/najdroższyBurger, '&#xa;')"/>
			<xsl:value-of select="concat('Natańszy burger:', /burgerMenu/informacje/dane/natańszyBurger, '&#xa;')"/>
			<xsl:value-of select="concat('Średnia cena:', /burgerMenu/informacje/dane/średniaCena, '&#xa;')"/>
			<xsl:value-of select="concat('Najbardziej kaloryczny:', /burgerMenu/informacje/dane/najbardziejKaloryczny, '&#xa;')"/>
			<xsl:value-of select="concat('Najmniej kaloryczny:', /burgerMenu/informacje/dane/najmniejKaloryczny, '&#xa;')"/>
			<xsl:value-of select="concat('Średnia kaloryczność:', /burgerMenu/informacje/dane/średniaKaloryczność, '&#xa;')"/>
	</xsl:template>

</xsl:stylesheet>