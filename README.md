# pkom
Programowanie Komunikacji Człowiek-Komputer (XML)

---
XML --(xslt)--> pomocniczy XML

    java -jar saxon9he.jar -s:burgerownia.xml -xsl:burgerownia_raport.xsl -o:raport.xml

pomocniczy XML --(xslt)--> XHTML

    java -jar saxon9he.jar -s:raport.xml -xsl:burgerownia_xhtml.xsl -o:raport.xhtml
