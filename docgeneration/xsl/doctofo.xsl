<?xml version="1.0"?>
 
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">


    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:include href="fodoc.xsl"/>
    <xsl:include href="foblocks.xsl"/>
	<xsl:include href="xmlverbatim-fo.xsl"/>
	
    <xsl:variable name="fontsize">10pt</xsl:variable>
    <xsl:variable name="smallfontsize">9pt</xsl:variable>
 	<xsl:variable name="codefontsize">8pt</xsl:variable>
 
    <xsl:param name="datestamp"/>

 

</xsl:stylesheet>
