<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:key name = "skladnik_klucz" match = "składnik" use = "@idSkładnika" />

    <xsl:template name="BurgerMenu" match="/burgerownia">
    	<xsl:element name="burgerMenu">
            
    		<xsl:apply-templates select="lista_burgerów" />
            <xsl:call-template name="Raport" />
    	</xsl:element>
    </xsl:template>

    <xsl:template name="Burgerownia" match="lista_burgerów">
        <xsl:apply-templates select="burger">
            <xsl:sort select="nazwa" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template name="Raport">
        <xsl:element name="informacje">
            <xsl:element name="dane">
                <xsl:element name="liczbaSkładników">
                    <xsl:value-of select="count(lista_składników/składnik)"/>
                </xsl:element>
                <xsl:element name="liczbaAlergenów">
                    <xsl:value-of select="count(lista_alergenów/alergen)"/>
                </xsl:element>
                <xsl:element name="liczbaBurgerów">
                    <xsl:value-of select="count(lista_burgerów/burger)"/>
                </xsl:element>
                <xsl:element name="liczbaBurgerówMięsnych">
                    <xsl:value-of select="count(lista_burgerów/burger[@mięsność = 'mięsny'])"/>
                </xsl:element>
                <xsl:element name="liczbaBurgerówWegetariańskich">
                    <xsl:value-of select="count(lista_burgerów/burger[@mięsność = 'wegetariański'])"/>
                </xsl:element>
                <xsl:element name="liczbaBurgerówWegańskich">
                    <xsl:value-of select="count(lista_burgerów/burger[@mięsność = 'wegański'])"/>
                </xsl:element>

                <xsl:element name="najdroższyBurger">
                    <xsl:variable name="najwyższaCena" select="max(lista_burgerów/burger/cena)" />
                    <xsl:value-of select="concat($najwyższaCena, ' ', lista_burgerów/burger[cena=$najwyższaCena]/cena/@waluta)" />
                </xsl:element>
        
                <xsl:element name="natańszyBurger">
                    <xsl:variable name="najniższaCena" select="min(lista_burgerów/burger/cena)" />
                    <xsl:value-of select="concat($najniższaCena, ' ', lista_burgerów/burger[cena=$najniższaCena]/cena/@waluta)" />
                </xsl:element>

                <xsl:element name="średniaCena">
                    <xsl:if test="lista_burgerów/burger/cena/@waluta = 'zł'">
                        <xsl:variable name="średniaCena" select="avg(lista_burgerów/burger/cena)" />
                        <xsl:value-of select="concat(round($średniaCena*100) div 100, ' zł')" />
                    </xsl:if>
                </xsl:element>

                <xsl:element name="najbardziejKaloryczny">
                    <xsl:variable name="najwięcejKalori" select="max(lista_burgerów/burger/kaloryczność)" />
                    <xsl:value-of select="concat($najwięcejKalori, ' ', lista_burgerów/burger[kaloryczność=$najwięcejKalori]/kaloryczność/@jednostka)" />
                </xsl:element>
        
                <xsl:element name="najmniejKaloryczny">
                    <xsl:variable name="najmniejKalori" select="min(lista_burgerów/burger/kaloryczność)" />
                    <xsl:value-of select="concat($najmniejKalori, ' ', lista_burgerów/burger[kaloryczność=$najmniejKalori]/kaloryczność/@jednostka)" />
                </xsl:element>

                <xsl:element name="średniaKaloryczność">
                    <xsl:if test="lista_burgerów/burger/kaloryczność/@jednostka = 'kcal'">
                        <xsl:variable name="średnioKalori" select="avg(lista_burgerów/burger/kaloryczność)" />
                        <xsl:value-of select="concat(round($średnioKalori*100) div 100, ' kcal')" />
                    </xsl:if>
                </xsl:element>
            
 
            </xsl:element>
            <xsl:element name="autorzy">
                <xsl:for-each select="metadane/autor">
                    <xsl:element name="autor">
                        <xsl:value-of select="concat(imie, ' ', nazwisko)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
            <xsl:element name="dataUtworzenia">
                    <xsl:value-of select="format-dateTime(current-dateTime(), '[D01].[M01].[Y0001] [H01]:[m01]')" />
            </xsl:element>
        </xsl:element>
    </xsl:template>


    <xsl:template name="Burger" match="burger">
        <xsl:element name="burger">
            <xsl:apply-templates select="nazwa"/>
            <xsl:apply-templates select="cena"/>
            <xsl:apply-templates select="kaloryczność"/>
            <xsl:apply-templates select="@data_wprowadzenia" />
            <xsl:apply-templates select="@mięsność" />
            <xsl:apply-templates select="@skladnik1" />
            <xsl:apply-templates select="@skladnik2" />
            <xsl:apply-templates select="@skladnik3" />
            <xsl:apply-templates select="@skladnik4" />
            <xsl:apply-templates select="@skladnik5" />
            <xsl:apply-templates select="@skladnik6" />
            <xsl:apply-templates select="@skladnik7" />
            <xsl:apply-templates select="@skladnik8" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="Nazwa" match="nazwa">
        <xsl:element name="nazwa">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>

    <xsl:template name="Cena" match="cena">
        <xsl:element name="cena">
            <xsl:value-of select="concat(. , ' ', ./@waluta)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="Kaloryczność" match="kaloryczność">
        <xsl:element name="kaloryczność">
            <xsl:value-of select="concat(. , ' ', ./@jednostka)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="data_wprowadzenia" match="@data_wprowadzenia">
        <xsl:element name="data_wprowadzenia">
            <xsl:variable name="data_wprowadzenia" select="." />
            <xsl:value-of select="/burgerownia/lista_burgerów/burger[@data_wprowadzenia = $data_wprowadzenia]/@data_wprowadzenia" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="mięsność" match="@mięsność">
        <xsl:element name="mięsność">
            <xsl:variable name="mięsność" select="." />
            <xsl:value-of select="/burgerownia/lista_burgerów/burger[@mięsność = $mięsność]/@mięsność" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik1" match="@skladnik1">
        <xsl:element name="skladnik1">            
            <xsl:variable name="skladnik1" select="." />       
            <xsl:value-of select = "key('skladnik_klucz', $skladnik1)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik2" match="@skladnik2">
        <xsl:element name="skladnik2">
            <xsl:variable name="skladnik2" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik2)" />
        </xsl:element>
    </xsl:template>    

    <xsl:template name="skladnik3" match="@skladnik3">
        <xsl:element name="skladnik3">
            <xsl:variable name="skladnik3" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik3)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik4" match="@skladnik4">
        <xsl:element name="skladnik4">
            <xsl:variable name="skladnik4" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik4)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik5" match="@skladnik5">
        <xsl:element name="skladnik5">
            <xsl:variable name="skladnik5" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik5)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik6" match="@skladnik6">
        <xsl:element name="skladnik6">
            <xsl:variable name="skladnik6" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik6)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik7" match="@skladnik7">
        <xsl:element name="skladnik7">
            <xsl:variable name="skladnik7" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik7)" />
        </xsl:element>
    </xsl:template>

    <xsl:template name="skladnik8" match="@skladnik8">
        <xsl:element name="skladnik8">
            <xsl:variable name="skladnik8" select="." />
            <xsl:value-of select = "key('skladnik_klucz', $skladnik8)" />
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>