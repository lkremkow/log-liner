<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:strip-space elements="*"/>

  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="text()"/>

  <xsl:template match="HOST_LIST_VM_DETECTION_OUTPUT/RESPONSE/HOST_LIST">

    <xsl:for-each select="HOST">

      <xsl:for-each select="DETECTION_LIST/DETECTION">
        <xsl:value-of select="../../IP"/><xsl:text>,</xsl:text>
        <xsl:value-of select="QID"/><xsl:text>,</xsl:text>
        <xsl:value-of select="TYPE"/><xsl:text>,</xsl:text>
        <xsl:value-of select="SEVERITY"/><xsl:text>,</xsl:text>
        <xsl:value-of select="STATUS"/><xsl:text>,</xsl:text>
        <xsl:value-of select="../../../../DATETIME"/>
        <xsl:text>&#xA;</xsl:text>
      </xsl:for-each>

    </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>
