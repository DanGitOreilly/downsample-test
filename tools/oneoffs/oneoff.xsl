<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:opf="http://www.idpf.org/2007/opf"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:exsl="http://exslt.org/common"
                exclude-result-prefixes="dc opf exsl">

<!-- Placeholder xsl:import instruction -->
<xsl:import href="DYNAMICALLY_UPDATED_PLACEHOLDER"/>

<xsl:param name="generate.toc.start">book toc,title</xsl:param>
<xsl:param name="generate.toc.end">book title,table,figure</xsl:param>

<xsl:template match="book">
  <xsl:call-template name="id.warning"/>

  <div>
    <xsl:apply-templates select="." mode="common.html.attributes"/>
    <xsl:if test="$generate.id.attributes != 0">
      <xsl:attribute name="id">
        <xsl:call-template name="object.id"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:call-template name="book.titlepage"/>

    <xsl:apply-templates select="dedication" mode="dedication"/>
    <xsl:apply-templates select="acknowledgements" mode="acknowledgements"/>

    <xsl:variable name="toc.params.start">
      <xsl:call-template name="find.path.params">
        <xsl:with-param name="table" select="normalize-space($generate.toc.start)"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:call-template name="make.lots">
      <xsl:with-param name="toc.params" select="$toc.params.start"/>
      <xsl:with-param name="toc">
        <xsl:call-template name="division.toc">
          <xsl:with-param name="toc.title.p" select="contains($toc.params.start, 'title')"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>

    <xsl:apply-templates/>

    <xsl:variable name="toc.params.end">
      <xsl:call-template name="find.path.params">
        <xsl:with-param name="table" select="normalize-space($generate.toc.end)"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:call-template name="make.lots">
      <xsl:with-param name="toc.params" select="$toc.params.end"/>
      <xsl:with-param name="toc">
        <xsl:call-template name="division.toc">
          <xsl:with-param name="toc.title.p" select="contains($toc.params.end, 'title')"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>

  </div>
</xsl:template>

</xsl:stylesheet>
