<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:strip-space elements="*"/>

  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="text()"/>

  <xsl:template match="ServiceResponse/data">

    <xsl:for-each select="WasScan">
        <xsl:value-of select="id"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>
