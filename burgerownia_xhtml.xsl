<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xhtml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes"/>

    <xsl:template name="burgerMenu" match="/">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
			<head>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous"/>
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
						</div>
					</div>
				<h1>TEST</h1>
			</body>
		</html>
	</xsl:template>    

</xsl:stylesheet>