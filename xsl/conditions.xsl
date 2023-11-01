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

        <xsl:if test="Condition[condition.part/value='IMAGE']">
            <h2>Image</h2>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Évaluation</th>
                    <th>Précision</th>
                </tr>
                <xsl:apply-templates select="Condition[condition.part/value='IMAGE']">
                    <xsl:sort select="condition.date"/>
                </xsl:apply-templates>
            </table>
        </xsl:if>

        <xsl:if test="Condition[condition.part/value='SOUND']">
            <h2>Son</h2>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Évaluation</th>
                    <th>Précision</th>
                </tr>
                <xsl:apply-templates select="Condition[condition.part/value='SOUND']">
                    <xsl:sort select="condition.date"/>
                </xsl:apply-templates>
            </table>
        </xsl:if>

        <xsl:if test="Condition[condition.part/value='SPLICE']">
            <h2>Collures</h2>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Évaluation</th>
                </tr>
                <xsl:apply-templates select="Condition[condition.part/value='SPLICE']">
                    <xsl:sort select="condition.date"/>
                </xsl:apply-templates>
            </table>
        </xsl:if>

        <xsl:if test="Condition[condition.part/value='SCRATCH']">
            <h2>Rayures</h2>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Évaluation</th>
                </tr>
                <xsl:apply-templates select="Condition[condition.part/value='SCRATCH']">
                    <xsl:sort select="condition.date"/>
                </xsl:apply-templates>
            </table>
        </xsl:if>

        <xsl:if test="Condition[condition.part/value='SHRINKAGE']">
            <h2>Retrait</h2>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Évaluation</th>
                </tr>
                <xsl:apply-templates select="Condition[condition.part/value='SHRINKAGE']">
                    <xsl:sort select="condition.date"/>
                </xsl:apply-templates>
            </table>
        </xsl:if>

        <xsl:if test="Condition[condition.part/value='TEST']">
            <h2>Tests</h2>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Type</th>
                    <th>Résultat</th>
                </tr>
                <xsl:apply-templates select="Condition[condition.part/value='TEST']">
                    <xsl:sort select="condition.date"/>
                </xsl:apply-templates>
            </table>
        </xsl:if>

        <xsl:if test="Condition[condition.part/value='STATE']">
            <h2>États additionnels</h2>
            <ul>
                <xsl:for-each select="Condition[condition.part/value='STATE']">
                    <li>
                        <xsl:value-of select="condition.notes"/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>

        <xsl:if test="Condition[condition.part/value='TECHNOTES']">
            <h2>Technique remarques</h2>
            <ul>
                <xsl:for-each select="Condition[condition.part/value='TECHNOTES']">
                    <li>
                        <xsl:value-of select="condition.notes"/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Condition[condition.part/value='IMAGE']">
        <tr>
            <td>
                <xsl:value-of select="condition.date"/>
            </td>
            <td>
                <xsl:value-of select="condition"/>
            </td>
            <td>
                <xsl:value-of select="condition.notes"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="Condition[condition.part/value='SOUND']">
        <tr>
            <td>
                <xsl:value-of select="condition.date"/>
            </td>
            <td>
                <xsl:value-of select="condition"/>
            </td>
            <td>
                <xsl:value-of select="condition.notes"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="Condition[condition.part/value='SPLICE']">
        <tr>
            <td>
                <xsl:value-of select="condition.date"/>
            </td>
            <td>
                <xsl:value-of select="condition.notes"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="Condition[condition.part/value='SCRATCH']">
        <tr>
            <td>
                <xsl:value-of select="condition.date"/>
            </td>
            <td>
                <xsl:value-of select="condition.notes"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="Condition[condition.part/value='SHRINKAGE']">
        <tr>
            <td>
                <xsl:value-of select="condition.date"/>
            </td>
            <td>
                <xsl:value-of select="condition.notes"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="Condition[condition.part/value='TEST']">
        <tr>
            <td>
                <xsl:value-of select="condition.date"/>
            </td>
            <td>
                <xsl:value-of select="condition"/>
            </td>
            <td>
                <xsl:value-of select="condition.notes"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
