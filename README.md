# pkom
Programowanie Komunikacji Człowiek-Komputer (XML)

---
XML --(xslt)--> pomocniczy XML

    xsltproc burgerownia_raport.xsl burgerownia.xml > raport.xml

pomocniczy XML --(xslt)--> XHTML

    java -jar saxon9he.jar -s:raport.xml -xsl:burgerownia_xhtml.xsl -o:raport.xhtml
