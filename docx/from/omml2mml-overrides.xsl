<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:omml="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:mml="http://www.w3.org/1998/Math/MathML"
    version="2.0"
    exclude-result-prefixes="#all">

  <xsl:function name="omml:non-combining-accent" as="xs:string">
    <xsl:param name="accent"/>
    <xsl:variable name="translations">
      <pair>
        <in>&#x0301;</in><!-- COMBINING ACUTE ACCENT -->
        <out>&#x00b4;</out><!-- ACUTE ACCENT -->
      </pair>
      <pair>
        <in>&#x0317;</in><!-- COMBINING ACUTE ACCENT BELOW -->
        <out>&#x00b4;</out><!-- ACUTE ACCENT -->
      </pair>
      <pair>
        <in>&#x0306;</in><!-- COMBINING BREVE -->
        <out>&#x02d8;</out><!-- BREVE -->
      </pair>
      <pair>
        <in>&#x032e;</in><!-- COMBINING BREVE BELOW -->
        <out>&#x02d8;</out><!-- BREVE -->
      </pair>
      <pair>
        <in>&#x030c;</in><!-- COMBINING CARON -->
        <out>&#x02c7;</out><!-- CARON -->
      </pair>
      <pair>
        <in>&#x032c;</in><!-- COMBINING CARON BELOW -->
        <out>&#x02c7;</out><!-- CARON -->
      </pair>
      <pair>
        <in>&#x0327;</in><!-- COMBINING CEDILLA -->
        <out>&#x00b8;</out><!-- CEDILLA -->
      </pair>
      <pair>
        <in>&#x0302;</in><!-- COMBINING CIRCUMFLEX ACCENT  -->
        <out>&#x005e;</out><!-- CIRCUMFLEX ACCENT -->
      </pair>
      <pair>
        <in>&#x032d;</in><!-- COMBINING CIRCUMFLEX ACCENT BELOW -->
        <out>&#x005e;</out><!-- CIRCUMFLEX ACCENT -->
      </pair>
      <pair>
        <in>&#x0308;</in><!-- COMBINING DIAERESIS -->
        <out>&#x00a8;</out><!-- DIAERESIS -->
      </pair>
      <pair>
        <in>&#x0324;</in><!-- COMBINING DIAERESIS BELOW -->
        <out>&#x00a8;</out><!-- DIAERESIS -->
      </pair>
      <pair>
        <in>&#x0307;</in><!-- COMBINING DOT ABOVE -->
        <out>&#x02d9;</out><!-- DOT ABOVE -->
      </pair>
      <pair>
        <in>&#x0323;</in><!-- COMBINING DOT BELOW -->
        <out>&#x02d9;</out><!-- DOT ABOVE -->
      </pair>
      <pair>
        <in>&#x030b;</in><!-- COMBINING DOUBLE ACUTE ACCENT -->
        <out>&#x02dd;</out><!-- DOUBLE ACUTE ACCENT -->
      </pair>
      <pair>
        <in>&#x0300;</in><!-- COMBINING GRAVE ACCENT -->
        <out>&#x0060;</out><!-- GRAVE ACCENT -->
      </pair>
      <pair>
        <in>&#x0316;</in><!-- COMBINING GRAVE ACCENT BELOW -->
        <out>&#x0060;</out><!-- GRAVE ACCENT -->
      </pair>

      <pair>
        <in>&#x20d6;</in><!-- COMBINING LEFT ARROW ABOVE -->
        <out>&#x2190;</out><!-- LEFT ARROW -->
      </pair>
      <pair>
        <in>&#x20ee;</in><!-- COMBINING LEFT ARROW BELOW -->
        <out>&#x2190;</out><!-- LEFT ARROW -->
      </pair>
      <pair>
        <in>&#x0332;</in><!-- COMBINING LOW LINE -->
        <out>&#x005f;</out><!-- LOW LINE -->
      </pair>
      <pair>
        <in>&#x0304;</in><!-- COMBINING MACRON -->
        <out>&#x00af;</out><!-- MACRON -->
      </pair>
      <pair>
        <in>&#x0305;</in><!-- COMBINING OVERLINE -->
        <out>&#x203e;</out><!-- OVERLINE -->
      </pair>
      <pair>
        <in>&#x20d7;</in><!-- COMBINING RIGHT ARROW ABOVE -->
        <out>&#x2192;</out><!-- RIGHT ARROW -->
      </pair>
      <pair>
        <in>&#x20ef;</in><!-- COMBINING RIGHT ARROW BELOW -->
        <out>&#x2192;</out><!-- RIGHT ARROW -->
      </pair>
      <pair>
        <in>&#x0303;</in><!-- COMBINING TILDE -->
        <out>&#x007e;</out><!-- TILDE -->
      </pair>
      <pair>
        <in>&#x0330;</in><!-- COMBINING TILDE BELOW -->
        <out>&#x007e;</out><!-- TILDE -->
      </pair>
    </xsl:variable>
    <xsl:value-of select="translate($accent, string-join($translations/pair/in, ''), string-join($translations/pair/out, ''))"/>
  </xsl:function>

  <xsl:template match="omml:acc" priority="1">
    <xsl:variable name="char" select="omml:accPr/omml:chr/@omml:val"/>
    <xsl:variable name="char-or-default">
      <xsl:choose>
        <xsl:when test="$char = ''">&#x0302;</xsl:when>
        <xsl:otherwise><xsl:value-of select="$char"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <mml:mover accent="true">
      <mml:mrow>
        <xsl:apply-templates select="omml:e[1]"/>
      </mml:mrow>
      <mml:mo>
        <xsl:value-of select="omml:non-combining-accent($char)"/>
      </mml:mo>
    </mml:mover>
  </xsl:template>
</xsl:stylesheet>
