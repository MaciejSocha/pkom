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
				<xsl:value-of select="informacje/dataUtworzenia/concat('Data utworzenia dokumentu: ', ., '&#xa;', '&#xa;')" />
			</xsl:element>
			<xsl:element name="dane">
				<xsl:value-of select="concat('Statystki burgerów: ', '&#xa;')" />
				<xsl:call-template name="statystyki"/>
				<xsl:value-of select="concat('&#xa;', ' ')" />
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

</xsl:stylesheet>