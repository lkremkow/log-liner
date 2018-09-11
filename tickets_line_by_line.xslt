<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:strip-space elements="*"/>

  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="text()"/>

  <xsl:template match="REMEDIATION_TICKETS/TICKET_LIST">

    <xsl:for-each select="TICKET">

        <xsl:value-of select="NUMBER"/><xsl:text>,</xsl:text>
        <xsl:value-of select="CURRENT_STATE"/><xsl:text>,</xsl:text>
        <xsl:value-of select="ASSIGNEE/EMAIL"/><xsl:text>,</xsl:text>
        <xsl:value-of select="DETECTION/IP"/><xsl:text>,</xsl:text>
        <xsl:value-of select="VULNINFO/QID"/><xsl:text>,</xsl:text>
        <xsl:value-of select="VULNINFO/TYPE"/><xsl:text>,</xsl:text>
        <xsl:value-of select="VULNINFO/SEVERITY"/>
        <xsl:text>&#xA;</xsl:text>

    </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>
