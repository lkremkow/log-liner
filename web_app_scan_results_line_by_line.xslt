<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:strip-space elements="*"/>

  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="text()"/>

  <xsl:template match="WasScan">

    <xsl:for-each select="vulns/list/WasScanVuln">

      <xsl:value-of select="../../../target/webApp/url"/><xsl:text>,</xsl:text>
      <xsl:value-of select="uri"/><xsl:text>,</xsl:text>
      <xsl:value-of select="qid"/><xsl:text>,</xsl:text>
      <xsl:value-of select="../../../launchedDate"/>
      <xsl:text>&#xA;</xsl:text>

    </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>
