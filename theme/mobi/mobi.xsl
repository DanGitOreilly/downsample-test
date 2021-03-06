<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="h">


<!-- Drop @width attributes from table headers if present -->
  <xsl:template match="h:th/@width"/>
  
<!-- Drop @width attributes from images if present -->
<xsl:template match="h:img/@width"/>

</xsl:stylesheet>
