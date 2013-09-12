<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">


    <xsl:output method="xml" omit-xml-declaration="no" indent="yes" version="1.0"/>

    <xsl:template match="doc">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

            <fo:layout-master-set>

                <fo:simple-page-master
                    master-name="A4"
                    page-width="210mm"  page-height="297mm"
                    margin-top="18mm"  margin-bottom="20mm"
                    margin-left="30mm" margin-right="20mm">

                    <fo:region-body margin-top="12mm"
                                    margin-bottom="2mm"/>
                    <fo:region-before extent="12mm"/>
                    <fo:region-after  extent="5mm"/>
                </fo:simple-page-master>

                <fo:page-sequence-master master-name="frontcover">
                    <fo:single-page-master-reference master-reference="A4"/>
                </fo:page-sequence-master>

                <fo:page-sequence-master master-name="preamble">
                    <fo:repeatable-page-master-reference master-reference="A4"/>
                </fo:page-sequence-master>

                <fo:page-sequence-master master-name="body">
                    <fo:repeatable-page-master-reference master-reference="A4"/>
                </fo:page-sequence-master>
            </fo:layout-master-set>

            <fo:page-sequence
                master-reference="frontcover"
                initial-page-number="1"
                force-page-count="no-force"
                language="en">
<!-- 
                <fo:static-content flow-name="xsl-region-before">
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after">
                </fo:static-content>
 -->

                <fo:flow flow-name="xsl-region-body">
                  	<xsl:apply-templates select="title|credits"/>
                </fo:flow>
            </fo:page-sequence>



            <fo:page-sequence
                master-reference="preamble"
                initial-page-number="1" format="i"
                language="en">

                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="end"
                              font-size="10pt"
                              font-family="serif"
                              font-style="italic"
                              line-height="14pt">
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>

<!-- 
                <fo:static-content flow-name="xsl-region-after">
                </fo:static-content>
 -->

                <fo:flow flow-name="xsl-region-body">

                    <xsl:apply-templates select="docmeta"/>
 

                    <fo:block break-before="page"
                              font-size="20pt"
                              font-weight="bold"
                              padding-top="2mm"
                              padding-bottom="6mm">Contents</fo:block>

                    <xsl:apply-templates select="section" mode="contents"/>
                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence
                master-reference="body"
                initial-page-number="1"
                language="en">

                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="end"
                              font-size="10pt"
                              font-family="serif"
                              font-style="italic"
                              line-height="14pt">
                        <fo:retrieve-marker retrieve-class-name="running"/>
                        &#160; <fo:page-number/>
                    </fo:block>
                </fo:static-content>

<!-- 
                <fo:static-content flow-name="xsl-region-after">
                </fo:static-content>
 -->

                <fo:flow flow-name="xsl-region-body">

                    <xsl:apply-templates select="section"/>

                </fo:flow>

            </fo:page-sequence>
        </fo:root>
    </xsl:template>




	<xsl:template match="doc/title">
			  <fo:block font-size="24pt"
                              padding-top="2mm"
                              padding-bottom="20mm"
                              text-align="center">
                        <xsl:apply-templates/>
                    </fo:block>
	</xsl:template>


	<xsl:template match="title" mode="title"><xsl:apply-templates/></xsl:template>
	<xsl:template match="title"></xsl:template>

	<xsl:template match="credits">
                    <fo:block font-size="11pt"
                              padding-top="2mm"
                              padding-bottom="2mm"
                              text-align="center">
                        <xsl:apply-templates/>
                    </fo:block>
    </xsl:template>
            


    <xsl:template match="section" mode="contents">
        <xsl:variable name="secnum"><xsl:value-of select="count(preceding-sibling::section) + 1"/></xsl:variable>

        <fo:block text-align-last="justify"
                  font-size="11pt"
                  font-family="serif"
                  padding-top="2mm"
                  padding-bottom="0.5mm">
            <xsl:value-of select="$secnum"/>&#160;&#160;<xsl:apply-templates select="title" mode="title"/>

            <fo:leader leader-pattern="dots"/>
            <fo:page-number-citation ref-id="section{$secnum}"/>

        </fo:block>
        <xsl:apply-templates select="subsection" mode="contents">
            <xsl:with-param name="parsecnum" select="$secnum"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="subsection" mode="contents">
        <xsl:param name="parsecnum"/>
        <xsl:variable name="secnum"><xsl:value-of select="$parsecnum"/>.<xsl:value-of select="count(preceding-sibling::subsection) + 1"/></xsl:variable>

        <fo:block text-align-last="justify"
                  font-size="10pt"
                  font-family="serif"
                  padding-top="0mm"
                  margin-left="10mm"
                  padding-bottom="0mm">
            <xsl:value-of select="$secnum"/>&#160;&#160;<xsl:apply-templates select="title" mode="title"/>
            <fo:leader leader-pattern="dots"/>
            <fo:page-number-citation ref-id="subsection{$secnum}"/>
        </fo:block>
    </xsl:template>
 
 
    <xsl:template match="section">
        <xsl:variable name="secnum"><xsl:value-of select="count(preceding-sibling::section) + 1"/></xsl:variable>

        <fo:block
            break-before="page"
            margin-left="0mm"
            padding-top="0mm"
            margin-top="0mm"
            id="section{$secnum}">

            <fo:block font-size="10pt"
                      font-family="serif"
                      font-style="italic">
                <fo:marker marker-class-name="running">
                	<xsl:choose>
						<xsl:when test="h1">
							<xsl:apply-templates select="h1" mode="title"/>
						</xsl:when>
						<xsl:otherwise>						
                    		<xsl:apply-templates select="title" mode="title"/>
						</xsl:otherwise>
                	
                	</xsl:choose>
                </fo:marker>
            </fo:block>

            <fo:block font-size="16pt"
                      font-weight="bold"
                      padding-top="0mm"
                      padding-bottom="6mm">
                <xsl:value-of select="$secnum"/>&#160;&#160;<xsl:apply-templates select="title" mode="title"/>
            </fo:block>

            <xsl:apply-templates>
                <xsl:with-param name="parsecnum" select="$secnum"/>
            </xsl:apply-templates>

        </fo:block>
    </xsl:template>



    <xsl:template match="docmeta">
        <fo:block
            margin-left="0mm"
            padding-top="0mm"
            margin-bottom="10mm">
            <fo:block font-size="14pt"
                      font-weight="bold"
                      padding-top="2mm"
                      padding-bottom="2mm">
                <xsl:value-of select="@title"/>
            </fo:block>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
 

    <xsl:template match="gt">&gt;</xsl:template>

    <xsl:template match="subsection">
        <xsl:param name="parsecnum"/>

        <xsl:variable name="secnum"><xsl:value-of select="$parsecnum"/>.<xsl:value-of select="count(preceding-sibling::subsection) + 1"/></xsl:variable>

        <fo:block
            margin-left="0mm"
            margin-top="5mm"
            padding-top="1mm"
            margin-bottom="5mm"
            id="subsection{$secnum}">

            <fo:block font-size="14pt"
                      font-weight="bold"
                      padding-top="2mm"
                      keep-with-next.within-page="always"
                      padding-bottom="4mm">
                <xsl:value-of select="$secnum"/>&#160;&#160;<xsl:apply-templates select="title" mode="title"/>
            </fo:block>

            <xsl:apply-templates>
                <xsl:with-param name="parsecnum" select="$secnum"/>
            </xsl:apply-templates>
        </fo:block>
    </xsl:template>





    <xsl:template match="subsubsection">

        <xsl:param name="parsecnum"/>

        <xsl:variable name="secnum"><xsl:value-of select="$parsecnum"/>.<xsl:value-of select="count(preceding-sibling::subsubsection) + 1"/></xsl:variable>

        <fo:block
            margin-left="0mm"
            padding-top="5mm"
            margin-bottom="5mm"
			id="subsubsection{$secnum}">
            <fo:block font-size="12pt"
                      padding-top="2mm"
                      keep-with-next.within-page="always"
                      padding-bottom="2mm">
                <xsl:value-of select="$secnum"/>&#160;<xsl:apply-templates select="title" mode="title"/>
            </fo:block>

            <xsl:apply-templates/>

        </fo:block>
    </xsl:template>

    <xsl:template match="subsubsubsection">

        <fo:block
            margin-top="5mm"
            padding-top="5mm"
            margin-left="20mm">
            <fo:block font-size="10pt"
                      font-weight="bold"
                      padding-top="2mm"
                      padding-bottom="1mm">
                <xsl:apply-templates select="title" mode="title"/>
            </fo:block>

            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

   

    <xsl:template match="par|p">
        <fo:block font-size="{$fontsize}"
                  font-family="serif"
                  span="none"
                  text-align="justify"
                  padding-left="2mm"
                  padding-right="2mm"
                  padding-top="0mm"
                  padding-bottom="3mm"
                  hyphenate="true"
                  hyphenation-character="-"
                  hyphenation-push-character-count="4"
                  hyphenation-remain-character-count="4">

            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>


  <xsl:template match="pmeta">
        <fo:block font-size="{$fontsize}"
                  font-family="serif"
                  span="none"
                  text-align="justify"
                  margin-left="40mm"
                  padding-right="2mm"
                  padding-top="0mm"
                  padding-left="3mm"
                  padding-bottom="0mm"
                  margin-bottom="3mm"
                  hyphenate="true"
                  hyphenation-character="-"
                  hyphenation-push-character-count="4"
                  border-left-color="#d0d0d0" border-left-width="1mm" border-left-style="solid"
                  hyphenation-remain-character-count="4">

            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>


  <xsl:template match="pnote">
        <fo:block font-size="{$fontsize}"
                  font-family="serif"
                  font-style="italic"
                  span="none"
                  text-align="justify"
                  margin-left="40mm"
                  padding-left="2mm"
                  padding-right="2mm"
                  padding-top="0mm"
                  padding-bottom="0mm"
                  margin-bottom="3mm"
                   border-left-color="#ffc0c0" border-left-width="1mm" border-left-style="solid"
                  hyphenate="true"
                  hyphenation-character="-"
                  hyphenation-push-character-count="4"
                  hyphenation-remain-character-count="4">

            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>


	<xsl:template match="pre|textarea">
	    <fo:block
       linefeed-treatment="preserve"
       white-space-treatment="preserve"
       white-space-collapse="false"
       font-size="9pt"
                  font-family="monospace"
                  span="none"
                  padding-left="2mm"
                  padding-right="2mm"
                  padding-top="0mm"
                  padding-bottom="1mm"
                  margin-bottom="2mm"
                  background-color = "#e0e0e0">
                  <xsl:apply-templates/>
    </fo:block>

   
	
	
	</xsl:template>


    <xsl:template match="b">
        <fo:inline font-weight="bold"><xsl:apply-templates/></fo:inline>
    </xsl:template>

    <xsl:template match="titleimg">
	<xsl:variable name="srcfnm"><xsl:value-of select="@src"/></xsl:variable>
 
	<xsl:variable name="fsrc">build/images/<xsl:value-of select="@src"/></xsl:variable> 	
	<xsl:variable name="imw"><xsl:value-of select="document('../build/images/sizes.xml')/sizelist/image[@file=$srcfnm]/@width"/></xsl:variable>
        <xsl:variable name ="mmw"><xsl:value-of select="$imw * 0.15"/></xsl:variable>
	
        <fo:block
            padding-top="4mm"
            padding-bottom="4mm"
            text-align="center">
            <fo:external-graphic
                src="build/images/{@src}"
                width="{$mmw}mm"/>
            <fo:block font-size="10pt"
                      padding-top="2mm"
                      text-align="center"
                      keep-with-previous.within-page="always">
                <xsl:value-of select="@title"/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="embedimg">
        <xsl:choose>
            <xsl:when test="@ext='png'">
                <fo:external-graphic
                    src="build/images/{@src}-noalpha.{@ext}"
                    background-color="#ffffff"
                    scaling="uniform"
                    width="4mm"/>
            </xsl:when>
            <xsl:otherwise>
                <fo:external-graphic
                    src="build/images/{@src}.{@ext}"
                    background-color="#ffffff"
                    scaling="uniform"
                    width="4mm"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="note">
        <fo:table table-layout="fixed"
                  padding-right="4mm"
                  background-color="#f0fff0">
                <fo:table-column column-width="16mm"/>
                <fo:table-column column-width="110mm"/>

                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block text-align="center">
                                <fo:external-graphic src="build/images/note-noalpha.png"
                                                     scaling="uniform"
                                                     width="7mm"/>
                            </fo:block>
                        </fo:table-cell>

                        <fo:table-cell>

                            <fo:block font-size="10pt"
                                      font-family="serif"
                                      span="none"
                                      text-align="justify"
                                      padding-left="4mm"
                                      padding-right="4mm"
                                      padding-top="3mm"
                                      padding-bottom="3mm"
                                      hyphenate="true"
                                      hyphenation-character="-"
                                      hyphenation-push-character-count="4"
                                      hyphenation-remain-character-count="4">
                                <xsl:apply-templates/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>

        <fo:block
            padding-top="2mm">
        </fo:block>
    </xsl:template>

    
    <xsl:template match="image">
        <fo:block
            text-align="center"
            padding-top="4mm"
            padding-bottom="4mm">
            <fo:external-graphic
                src="{@src}"
                scaling="uniform"
                width="120mm"/>
            <fo:block font-size="8pt"
                      padding-top="1mm"
                      text-align="center">
                <xsl:value-of select="@title"/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="ul">
        <fo:block
            font-size="11pt"
            font-family="serif"
            padding-top="1mm"
            padding-bottom="4mm">
            <fo:list-block
                provisional-distance-between-starts="7mm">

                <xsl:apply-templates select="li"/>
            </fo:list-block>
        </fo:block>
    </xsl:template>

    <xsl:template match="ol">
        <fo:block
            font-size="11pt"
            font-family="serif"
            padding-top="4mm">
            <fo:list-block
                provisional-distance-between-starts="7mm">

                <xsl:apply-templates select="li"/>
            </fo:list-block>
        </fo:block>
    </xsl:template>

    <xsl:template match="li">
        <fo:list-item>
            <fo:list-item-label start-indent="1.0cm"
                                end-indent="1.5cm">
                <fo:block>&#8226;</fo:block>
            </fo:list-item-label>

            <fo:list-item-body start-indent="15mm">
                <fo:block padding-left="6mm" padding-bottom="1mm" font-size="{$fontsize}"><xsl:apply-templates/></fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

    
    
    <xsl:template match="br"><fo:block/></xsl:template>

    <xsl:template match="i">
        <fo:inline font-style="italic"><xsl:apply-templates/></fo:inline>
    </xsl:template>

   
   
</xsl:stylesheet>
