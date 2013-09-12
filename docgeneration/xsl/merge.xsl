<!DOCTYPE stylesheet [
<!ENTITY copy  "&#169;" >
<!ENTITY nbsp  "&#160;" >
<!ENTITY middot  "&#183;" >
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"
                version="1.0"
                encoding="UTF-8"
                omit-xml-declaration="no"
                indent="yes"/>


  <xsl:param name="datestamp"/>


	<xsl:template match="doc">
		<doc>
			<xsl:apply-templates/> 
		</doc>
		 
	</xsl:template>
  
 	<xsl:template match="chapter"> 
        <xsl:variable name="fnm">../docsrc/<xsl:value-of select="@file"/>.xml</xsl:variable>
       
        <xsl:apply-templates select="document($fnm)"/>
       
    </xsl:template>
    
    <xsl:template match="page">
        <section>
            <title>
                <xsl:apply-templates select="h1" mode="titleonly"/>
            </title>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    
     <xsl:template match="h1" mode="titleonly">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="*" mode="titleonly"></xsl:template>
    
    <xsl:template match="h1">
    </xsl:template>
    
 	<xsl:template match="sectionsref"> 
 		<xsl:variable name="fnm">../docsrc/<xsl:value-of select="@file"/>.xml</xsl:variable>
 		<xsl:apply-templates select="document($fnm)"/>
 	</xsl:template>


	 
	<xsl:template match="title|credits|about|pre|img|tt|div|h2|h3|h4|p|subsection|subsubsection|docmeta|pnote|pmeta|xcode|x">
    	    <xsl:copy-of select="."/>
	</xsl:template>
	 
	 
	 
	 <xsl:template match="code|smallcode"><xsl:copy-of select="."/></xsl:template>


    <xsl:template match="section"> 
        <section>
        <xsl:copy-of select="@*"/>
        <xsl:attribute name="number"><xsl:value-of select="count(preceding-sibling::section) + 1"/></xsl:attribute>
        <xsl:apply-templates/>      
        </section>
  
    </xsl:template>









  <xsl:template match="Elt">
        <peltdef>
            <elthead><xsl:value-of select="@name"/></elthead>
            <xsl:apply-templates mode="defs"/>
        </peltdef>
    </xsl:template>

    <xsl:template match="IntParam" mode="defs">
        <pattdef>
            <divattdefname><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(int)</span></divattdefname>
            <xsl:apply-templates/>
        </pattdef>
    </xsl:template>

      <xsl:template match="Label" mode="defs">
        <pattdef>
            <divattdefname><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(string)</span></divattdefname>
            <xsl:apply-templates/>
        </pattdef>
    </xsl:template>
    
     <xsl:template match="EltRef" mode="defs">
        <pattdef>
            <divattdefname><xsl:value-of select="@name"/></divattdefname>
            Reference to a component of type <span class="eltname"><xsl:value-of select="@to"/>. </span>
            <xsl:apply-templates/>
        </pattdef>
    </xsl:template>


     <xsl:template match="Choice" mode="defs">
        <pattdef>
            <divattdefname><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(choice)</span></divattdefname>
            possible values: <xsl:value-of select="@values"/> <xsl:apply-templates/>
        </pattdef>
    </xsl:template>

     <xsl:template match="Expression" mode="defs">
        <pattdef>
            <divattdefname><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(expression)</span></divattdefname>
             <xsl:apply-templates/>
        </pattdef>
    </xsl:template>

    <xsl:template match="Path" mode="defs">
        <pattdef>
            <divattdefname><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(path)</span></divattdefname>
             <xsl:apply-templates/>
        </pattdef>
    </xsl:template>

    <xsl:template match="Quantity" mode="defs">
        <pattdef>
            <divattdefname><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(quantity)</span></divattdefname>
             <xsl:apply-templates/>
        </pattdef>
    </xsl:template>
    
    
    <xsl:template match="Child" mode="defs">
        <pchlddef>       
                <xsl:value-of select="@typ"/>
                <xsl:if test="@number">
                    <span class="attmeta"> &nbsp;&nbsp;(<xsl:value-of select="@number"/>)</span>
                 </xsl:if>
         </pchlddef>
    </xsl:template>


    <xsl:template match="Info" mode="defs">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>















</xsl:stylesheet>