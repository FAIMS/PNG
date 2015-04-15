<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:variable name="lessThan" select="'&#x3C;'"/>

<xsl:template match="/">
<!-- makeVocab(String type, String path, String attrib){ -->

<xsl:for-each select="//*[@faims_attribute_type='vocab' and not(@type='camera') and not(@type='file')]">
	<xsl:variable name="path">"<xsl:if test="normalize-space(../../../../@ref)"><xsl:value-of select="normalize-space(../../../../@ref)"/>/<xsl:value-of select="normalize-space(../../../@ref)"/>/<xsl:value-of select="normalize-space(@ref)"/></xsl:if><xsl:if test="normalize-space(../../../../@ref) = ''"><xsl:value-of select="normalize-space(../../@ref)"/>/<xsl:value-of select="normalize-space(../@ref)"/>/<xsl:value-of select="normalize-space(@ref)"/></xsl:if>"</xsl:variable>

<xsl:if test="name() = 'select1'">makeVocab(<xsl:if test="@appearance='full'">"RadioGroup"</xsl:if><xsl:if test="not(@appearance)">"DropDown"</xsl:if>, <xsl:copy-of select="$path" />, "<xsl:value-of select="normalize-space(@faims_attribute_name)"/>");
</xsl:if>
<xsl:if test="name() = 'select' and not(@faims_sync)">makeVocab("CheckBoxGroup", <xsl:copy-of select="$path" />, "<xsl:value-of select="normalize-space(@faims_attribute_name)"/>");
</xsl:if>
</xsl:for-each> 
</xsl:template>

</xsl:stylesheet>

