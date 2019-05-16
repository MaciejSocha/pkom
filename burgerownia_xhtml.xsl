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
				<div class="pure-g">
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
				</div>
				<h1>TEST</h1>
			</body>
		</html>
	</xsl:template>    

</xsl:stylesheet>