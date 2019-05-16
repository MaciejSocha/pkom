<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xhtml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes"/>

    <xsl:template name="burgerMenu" match="/">

		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
			<head>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css"/>
				<title>Burgerownia</title>
			</head>

			<body>
				<div class="pure-g" align="center">

					<div class="pure-u-3-5">
						<h2>Autorzy</h2>
						<xsl:for-each select="burgerMenu/informacje/autorzy/autor">
							<p>
								<xsl:value-of select="." />
							</p>
						</xsl:for-each>
						<h2>Data utworzenia</h2>
						<p>
								<xsl:value-of select="burgerMenu/informacje/dataUtworzenia" />
						</p>
					</div>

					<div class="pure-u-3-5">
						<h2>Burgery</h2>
						<xsl:for-each select="burgerMenu/burger">
							<table class="pure-table">
  								<tr>
    								<th colspan="2"  align="center" style="font-weight:bold">
    									<xsl:value-of select="nazwa"/>
    								</th>
  								</tr>

  								<tr>
    								<td>Cena:</td>
    								<td>
    									<xsl:value-of select="cena"/>
    								</td>
  								</tr>

  								<tr>
    								<td>Kaloryczność:</td>
    								<td>
    									<xsl:value-of select="kaloryczność"/>
    								</td>
  								</tr>

  								<tr>
    								<td>Mięsność:</td>
    								<td>
    									<xsl:value-of select="mięsność"/>
    								</td>
  								</tr>

  								<tr>
    								<td colspan="2"  align="center" style="font-weight:bold">Składniki:</td>
  								</tr>

  								<xsl:if test="skladnik1">
  								<tr>
    								<td colspan="2" align="center">
    									<xsl:value-of select="skladnik1"/>
    								</td>
  								</tr>
  								</xsl:if>

  								<xsl:if test="skladnik2">
  									<tr>
    									<td colspan="2" align="center">
    										<xsl:value-of select="skladnik2"/>
    									</td>
  									</tr>
  								</xsl:if>

  								<xsl:if test="skladnik3">
  									<tr>
    									<td colspan="2" align="center">
    										<xsl:value-of select="skladnik3"/>
    									</td>
  									</tr>
  								</xsl:if>

  								<xsl:if test="skladnik4">
  									<tr>
    									<td colspan="2" align="center">
    										<xsl:value-of select="skladnik4"/>
    									</td>
  									</tr>
  								</xsl:if>

  								<xsl:if test="skladnik5">
  									<tr>
    									<td colspan="2" align="center">
    										<xsl:value-of select="skladnik5"/>
    									</td>
  									</tr>
  								</xsl:if>

  								<xsl:if test="skladnik6">
  									<tr>
    									<td colspan="2" align="center">
    										<xsl:value-of select="skladnik6"/>
    									</td>
  									</tr>
  								</xsl:if>

  								<xsl:if test="skladnik7">
  									<tr>
    									<td colspan="2" align="center">
    										<xsl:value-of select="skladnik7"/>
    									</td>
  									</tr>
  								</xsl:if>

  								<xsl:if test="skladnik8">
		  							<tr>
    									<td colspan="2" align="center">
    										<xsl:value-of select="skladnik8"/>
    									</td>
  								</tr>
  								</xsl:if>
							</table>
						</xsl:for-each>
					</div>

					<div class="pure-u-3-5">
						<h1>Statystyki</h1>
						<p>	Łączna liczba składników: <xsl:value-of select="burgerMenu/informacje/dane/liczbaSkładników"/>
						</p>

						<p> Łączna liczba alergenów: <xsl:value-of select="burgerMenu/informacje/dane/liczbaAlergenów"/>
						</p>

						<p>	Łączna liczba burgerów: <xsl:value-of select="burgerMenu/informacje/dane/liczbaBurgerów"/>
						</p>

						<p>	Łączna liczba burgerów mięsnych: <xsl:value-of select="burgerMenu/informacje/dane/liczbaBurgerówMięsnych"/>
						</p>

						<p>	Łączna liczba burgerów wegetariańskich: <xsl:value-of select="burgerMenu/informacje/dane/liczbaBurgerówWegetariańskich"/>
						</p>

						<p>	Łączna liczba burgerów wegańskich: <xsl:value-of select="burgerMenu/informacje/dane/liczbaBurgerówWegańskich"/>
						</p>

						<p>	Najdroższy burger: <xsl:value-of select="burgerMenu/informacje/dane/najdroższyBurger"/>
						</p>

						<p>	Natańszy burger: <xsl:value-of select="burgerMenu/informacje/dane/natańszyBurger"/>
						</p>

						<p>	Średnia cena burgera: <xsl:value-of select="burgerMenu/informacje/dane/średniaCena"/>
						</p>

						<p>	Bomba kaloryczna burger: <xsl:value-of select="burgerMenu/informacje/dane/najbardziejKaloryczny"/>
						</p>

						<p>	Najbardziej fit burger: <xsl:value-of select="burgerMenu/informacje/dane/najmniejKaloryczny"/>
						</p>

						<p>	Średnia kaloryczność burgera: <xsl:value-of select="burgerMenu/informacje/dane/średniaKaloryczność"/>
						</p>
					</div>

				</div>
			</body>
		</html>
	</xsl:template>    

</xsl:stylesheet>