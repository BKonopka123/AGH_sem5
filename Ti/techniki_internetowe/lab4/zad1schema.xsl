<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="html" version="1.0"  />
<xsl:template match="/">

    <html>
        <head>
            <title>
                    Library
            </title>
        </head>

            <link rel="stylesheet" type="text/css" href="data.css" media="screen" />

        <body>
            <div class="main">
                <div class="biblioteka">
                    <h1> BIBLIOTEKA </h1>
                </div>

            <xsl:for-each select="/biblioteka/dzial" >
                <xsl:sort select="./nazwa/text()" order="descending" />
                <xsl:call-template name="dzial" />
            </xsl:for-each>
            </div>
        </body>
    </html>

</xsl:template>

<xsl:template name="dzial">
    <div class="dzial">
        <h2>
            <xsl:value-of select="nazwa/text()" />
        </h2>
    </div>

    <table border="1" cellpadding="5">
        <tr>
            <th>Numer</th>       
            <th>Imie</th>
            <th>Nazwisko</th>
            <th>Tytul</th>
        </tr>
        
        <xsl:for-each select="elementt/ksiazka" >
            <xsl:sort select="autor1/nazwisko/text()" />
            <xsl:call-template name="ksiazka" />
        </xsl:for-each>
    </table>
</xsl:template>

<xsl:template name="ksiazka">
    <tr>
        <th><xsl:number value="position()" format="1" /></th>
        <th> <xsl:value-of select="autor1/imie/text()" /> </th>
        <th> <xsl:value-of select="autor1/nazwisko/text()" /> </th>
        <th> <xsl:value-of select="tytul/text()" /></th>
    </tr>
</xsl:template>

</xsl:stylesheet>