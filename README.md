# pkom
Programowanie Komunikacji Człowiek-Komputer (XML)

---
XML --(xslt)--> pomocniczy XML

    java -jar saxon9he.jar -s:burgerownia.xml -xsl:burgerownia_raport.xsl -o:raport.xml

pomocniczy XML --(xslt)--> TXT

    java -jar saxon9he.jar -s:raport.xml -xsl:burgerownia_txt.xsl -o:raport.txt

pomocniczy XML --(xslt)--> svg

    xsltproc burgerownia_svg.xsl raport.xml > raport.svg

pomocniczy XML --(xslt)--(xsl-fo)--> pdf

    java -jar fop.jar -xml raport.xml -xsl burgerownia_fo.xsl -pdf raport.pdf
