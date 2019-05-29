<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
  	<fo:root>
  		<fo:layout-master-set>
  			<fo:simple-page-master master-name="Strona">
  				<fo:region-body/>
  			</fo:simple-page-master>
  		</fo:layout-master-set>

  		<fo:page-sequence master-reference="Strona">
  			<fo:flow flow-name="xsl-region-body">
  				<fo:block>
  					Date: <xsl:value-of select="/burgerMenu/informacje/dataUtworzenia"/>
  				</fo:block>
  			</fo:flow>
  		</fo:page-sequence>
  	</fo:root>
  </xsl:template>

</xsl:stylesheet>