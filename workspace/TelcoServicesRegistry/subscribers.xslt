<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
 <customers>
    <xsl:for-each select="//subscribers/subscriber">
      <customer>
        <firstname><xsl:value-of select="substring-before(name,' ')" /></firstname>
        <lastname><xsl:value-of select="substring-after(name,' ')" /></lastname>
        <phone><xsl:value-of select="mobile"/></phone>
     </customer>
    </xsl:for-each>
  </customers>
</xsl:template>
</xsl:stylesheet>