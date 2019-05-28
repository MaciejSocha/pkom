<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="text" />

	<xsl:template name="burgery" match="/burgerMenu" >
		<xsl:element name="burgerMenu">
			<xsl:call-template name="informacje" />
			<xsl:call-template name="burger_list"/>
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
				<xsl:value-of select="informacje/dataUtworzenia/concat('Data utworzenia dokumentu: ', ., '&#xa;', '&#xa;')" />
			</xsl:element>
			<xsl:element name="dane">
				<xsl:value-of select="concat('Statystki burgerów: ', '&#xa;')" />
				<xsl:call-template name="statystyki"/>
				<xsl:value-of select="concat(' ', '&#xa;')" />
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="statystyki" match="/burgerMenu/informacje/dane">
		<xsl:element name="liczba_składników" >
			<xsl:value-of select="concat('Liczba składników: ', /burgerMenu/informacje/dane/liczbaSkładników, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="liczba_alergenów" >
			<xsl:value-of select="concat('Liczba alergenów: ', /burgerMenu/informacje/dane/liczbaAlergenów, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="liczba_burgerów" >
			<xsl:value-of select="concat('Liczba burgerów: ', /burgerMenu/informacje/dane/liczbaBurgerów, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="liczbaBurgerówMięsnych" >
			<xsl:value-of select="concat('Liczba brgerów mięsnych: ', /burgerMenu/informacje/dane/liczbaBurgerówMięsnych, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="liczbaBurgerówWegetariańskich" >
			<xsl:value-of select="concat('Liczba burgerów wegetariańskich: ', /burgerMenu/informacje/dane/liczbaBurgerówWegetariańskich, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="liczbaBurgerówWegańskich" >
			<xsl:value-of select="concat('Liczba burgerów wegańskich: ', /burgerMenu/informacje/dane/liczbaBurgerówWegańskich, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="najdroższyBurger" >
			<xsl:value-of select="concat('Najdroższy burger: ', /burgerMenu/informacje/dane/najdroższyBurger, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="natańszyBurger" >
			<xsl:value-of select="concat('Natańszy burger: ', /burgerMenu/informacje/dane/natańszyBurger, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="średniaCena" >
			<xsl:value-of select="concat('Średnia cena: ', /burgerMenu/informacje/dane/średniaCena, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="najbardziejKaloryczny" >
			<xsl:value-of select="concat('Najbardziej kaloryczny: ', /burgerMenu/informacje/dane/najbardziejKaloryczny, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="najmniejKaloryczny" >
			<xsl:value-of select="concat('Najmniej kaloryczny: ', /burgerMenu/informacje/dane/najmniejKaloryczny, '&#xa;')"/>
		</xsl:element>
		<xsl:element name="średniaKaloryczność" >
			<xsl:value-of select="concat('Średnia kaloryczność: ', /burgerMenu/informacje/dane/średniaKaloryczność, '&#xa;')"/>
		</xsl:element>
	</xsl:template>

	<xsl:template name="burger_list">
		<xsl:element name="burger">
			<xsl:for-each select="/burgerMenu/burger">
				<xsl:call-template name="Nazwa"/>
				<xsl:call-template name="Cena"/>
				<xsl:call-template name="Kaloryczność"/>
				<xsl:call-template name="data_wprowadzenia"/>
				<xsl:call-template name="mięsność"/>
				<xsl:call-template name="skladniki"/>
				<xsl:value-of select="concat(' ', '&#xa;')"/>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>

	<xsl:template name="Nazwa" match="nazwa">
		<xsl:value-of select="concat(.//nazwa, ': &#xa;')" />
	</xsl:template>

	<xsl:template name="Cena" match="cena">
    	<xsl:value-of select="concat('Cena: ', .//cena, '&#xa;')" />
	</xsl:template>
 
	<xsl:template name="Kaloryczność" match="kaloryczność">
    	<xsl:value-of select="concat('Kaloryczność: ', .//kaloryczność, '&#xa;')" />
	</xsl:template>

	<xsl:template name="data_wprowadzenia" match="@data_wprowadzenia">
    	<xsl:value-of select="concat('Data wprowadzeia: ', .//data_wprowadzenia, '&#xa;')" />
	</xsl:template>

	<xsl:template name="mięsność" match="@mięsność">
    	<xsl:value-of select="concat('Mięsność: ', .//mięsność, '&#xa;')" />
	</xsl:template>

	<xsl:template name="skladniki">
		<xsl:value-of select="concat('Lista składników: ', '&#xa;')"/>

		<xsl:call-template name="skladnik1"/>
		<xsl:call-template name="skladnik2"/>
		<xsl:call-template name="skladnik3"/>
		<xsl:call-template name="skladnik4"/>
		<xsl:call-template name="skladnik5"/>
		<xsl:call-template name="skladnik6"/>
		<xsl:call-template name="skladnik7"/>
		<xsl:call-template name="skladnik8"/>

	</xsl:template>

	<xsl:template name="skladnik1" match="skladnik1">    	<xsl:if test=".//skladnik1">
    		<xsl:value-of select = "concat(.//skladnik1, '&#xa;')" />
    	</xsl:if>
	</xsl:template>

	<xsl:template name="skladnik2" match="skladnik2">
    	<xsl:if test=".//skladnik2">
    		<xsl:value-of select = "concat(.//skladnik2, '&#xa;')" />
    	</xsl:if>
	</xsl:template>    

	<xsl:template name="skladnik3" match="skladnik3">
		<xsl:if test=".//skladnik3">
    		<xsl:value-of select = "concat(.//skladnik3, '&#xa;')" />
    	</xsl:if>
	</xsl:template>

	<xsl:template name="skladnik4" match="skladnik4">
		<xsl:if test=".//skladnik4">
    		<xsl:value-of select = "concat(.//skladnik4, '&#xa;')" />
    	</xsl:if>
	</xsl:template>

	<xsl:template name="skladnik5" match="skladnik5">
		<xsl:if test=".//skladnik5">
    		<xsl:value-of select = "concat(.//skladnik5, '&#xa;')" />
    	</xsl:if>
	</xsl:template>

	<xsl:template name="skladnik6" match="skladnik6">
		<xsl:if test=".//skladnik6">
  			<xsl:value-of select = "concat(.//skladnik6, '&#xa;')" />
  		</xsl:if>
	</xsl:template>

	<xsl:template name="skladnik7" match="skladnik7">
		<xsl:if test=".//skladnik7">
   			<xsl:value-of select = "concat(.//skladnik7, '&#xa;')" />
   		</xsl:if>
	</xsl:template>

	<xsl:template name="skladnik8" match="skladnik8">
		<xsl:if test=".//skladnik8">
    		<xsl:value-of select = "concat(.//skladnik8, '&#xa;')" />
    	</xsl:if>
	</xsl:template>


</xsl:stylesheet>