<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" version="5" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <style>
                    table, th, td {
                    border: 1px solid black;
                    border-collapse: collapse;
                    }
                </style>
                <title>Test</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="recordList/record">
        <h1>
            <xsl:value-of select="Title/title" />
        </h1>
        <p>
            <xsl:value-of select="object_number" />
        </p>

        <h2>Distribution</h2>
        <table>
            <tr>
                <th>Nom</th>
                <th>Fonction</th>
                <th>Précision</th>
            </tr>
            <xsl:apply-templates select="Cast">
                <xsl:sort select="cast.name"/>
            </xsl:apply-templates>
        </table>

        <h2>Générique</h2>
        <table>
            <tr>
                <th>Nom</th>
                <th>Fonction</th>
                <th>Sur l'écran</th>
                <th>Précision</th>
            </tr>
            <xsl:apply-templates select="Credits">
                <xsl:sort select="credit.name"/>
            </xsl:apply-templates>
        </table>

    </xsl:template>

    <xsl:template match="Cast">
        <tr>
            <td>
                <xsl:value-of select="cast.name"/>
            </td>
            <td>
                <xsl:value-of select="cast.credit_type"/>
            </td>
            <td>
                <xsl:value-of select="cast.notes"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="Credits">
        <tr>
            <td>
                <xsl:value-of select="credit.name"/>
            </td>
            <td>
                <xsl:value-of select="credit.type"/>
            </td>
            <td>
                <xsl:value-of select="credit.on_screen"/>
            </td>
            <td>
                <xsl:value-of select="credit.notes"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
