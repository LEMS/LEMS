<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">


    <xsl:template name="title">
	<xsl:param name="txt"/>
        <fo:block font-size="14pt"
		  font-weight="bold"
                  padding-top="2mm"
                  keep-with-next="always"
                  padding-bottom="2mm">
	    <xsl:value-of select="$txt"/>
        </fo:block>
    </xsl:template>


    <xsl:template match="tagline">
        <fo:block font-size="{$fontsize}"
		  margin-left="4mm"
		  padding-left="4mm"
		  font-style="italic"
                  padding-top="2mm"
                  padding-bottom="0mm">
	    <xsl:apply-templates/>
        </fo:block>
    </xsl:template>


    <xsl:template match="people">
        <fo:block font-size="{$fontsize}"
		  margin-left="4mm"
		  padding-left="4mm"
                  padding-top="0mm"
                  padding-bottom="1mm">
	    <xsl:apply-templates/>
        </fo:block>
    </xsl:template>


    <xsl:template match="places">
        <fo:block font-size="{$fontsize}"
		  margin-left="4mm"
		  padding-left="4mm"
                  padding-top="0mm"
                  padding-bottom="1mm">
	    <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="contact">
        <fo:block font-size="{$fontsize}"
		  margin-left="4mm"
		  padding-left="4mm"
		  font-style="italic"
                  padding-top="0mm"
                  padding-bottom="1mm">
	    <xsl:apply-templates/>
        </fo:block>
    </xsl:template>



    <xsl:template match="vskip">
	<fo:block padding-top="{@skip}"></fo:block>
    </xsl:template>

 



    <xsl:template name="doctitle">
	<xsl:param name="txt"/>
        <fo:block font-size="14pt"
                  padding-top="2mm"
                  keep-with-next="always"
                  padding-bottom="6mm">
	    <xsl:value-of select="$txt"/>
        </fo:block>
    </xsl:template>

 
  

 <xsl:template match="h2">
        <fo:block font-size="12pt"
        			font-weight="bold"
                  padding-top="2mm"
                  margin-top="6mm"
                  keep-with-next="always"
                  padding-bottom="6mm">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="h3">
        <fo:block font-size="11pt"
                  font-weight="bold"
                  padding-top="10mm"
                  keep-with-next.within-page="always"
                  padding-bottom="2mm">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="h4">
        <fo:block font-size="10pt"
                  padding-top="2mm"
                  padding-bottom="6mm">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>


 
    <xsl:template match="gt">&gt;</xsl:template>

    <xsl:template match="up">
	<fo:inline vertical-align="super" font-size="9pt"><xsl:apply-templates/></fo:inline>
    </xsl:template>


    <xsl:template match="powten">10<fo:inline vertical-align="super" font-size="9pt"><xsl:value-of select="@power"/></fo:inline></xsl:template>


    <xsl:template match="sup"><fo:inline vertical-align="super" font-size="8pt"><xsl:apply-templates/></fo:inline></xsl:template>


    <xsl:template match="code">
    <fo:block font-size="{$codefontsize}"
    		white-space-collapse="false" linefeed-treatment="preserve" white-space-treatment="preserve"
    		font-family="monospace"
    		  border-width="0.2mm"
                  border-color="#a0a0a0"
                  border-style="solid"
    		 text-align="left"
		  margin-left="0mm"
		  margin-right="0mm"
		  margin-top="4mm"
		  margin-bottom="4mm"
		  padding-left="4mm"
		  padding-right="4mm"
                  padding-top="0mm"
                  padding-bottom="0mm" background-color="#f0f0f0"><xsl:apply-templates mode="xmlverb"/></fo:block>
	</xsl:template>
	
	
	 <xsl:template match="xcode">
    <fo:block font-size="{$codefontsize}"
            white-space-collapse="false" linefeed-treatment="preserve" white-space-treatment="preserve"
            font-family="monospace"
              border-width="0.2mm"
                  border-color="#a0a0a0"
                  border-style="solid"
             text-align="left"
          margin-left="0mm"
          margin-right="0mm"
          margin-top="4mm"
          margin-bottom="4mm"
          padding-left="4mm"
          padding-right="4mm"
                  padding-top="0mm"
                  padding-bottom="0mm" background-color="#f0f0f0"><xsl:apply-templates mode="xmlverb"/></fo:block>
    </xsl:template>
    
    
	
	
 <xsl:template match="smallcode">
		  <fo:block font-size="{$codefontsize}"
		  white-space-collapse="false" linefeed-treatment="preserve" white-space-treatment="preserve"
		  font-family="monospace" background-color="#f0f0f0"
		    border-width="0.2mm"
                  border-color="#a0a0a0"
                  border-style="solid"
		   text-align="left"
		  margin-left="0mm"
		   margin-right="0mm"
		  margin-top="4mm" 
		  margin-bottom="1mm"
		  padding-left="4mm"
		  padding-right="4mm"
                  padding-top="0mm"
                  padding-bottom="0mm"><xsl:apply-templates mode="xmlverb"/></fo:block>
	</xsl:template>
	
	
	 
 
	<xsl:template match="x">
		<fo:inline font-family="monospace" font-weight="bold" color="#b04040"><xsl:apply-templates/></fo:inline>
	</xsl:template>
    
    <xsl:template match="m">
		<fo:inline font-family="serif" font-style="italic" color="#000060">
		<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
    
    
     
    <xsl:template match="Type">
    	<fo:block font-size="{$fontsize}"
                  font-family="serif"
                  span="none"
                  text-align="left"
                  padding-left="2mm"
                  padding-right="2mm"
                  padding-top="3mm"
                  padding-bottom="1mm"
                  margin-top="2mm"
                  margin-bottom="4mm"
                  hyphenate="true"
                  hyphenation-character="-"
                  hyphenation-push-character-count="4"
                  hyphenation-remain-character-count="4" 
                  border-width="0.2mm"
                  border-color="#a0a0a0"
                  border-style="solid"
                  background-color="#f0f0ff" 
                  keep-together="always">
                  
                     <!--
                   -->
             <fo:block padding-bottom="2mm">
    		<fo:inline font-weight="bold">
    		<xsl:value-of select="@name"/>
    		</fo:inline>
    		<xsl:if test="@extends">
    			extends  <fo:inline font-weight="bold"><xsl:value-of select="@extends"/></fo:inline>
    		</xsl:if>
    		</fo:block>
 			<fo:block keep-together="auto"><xsl:apply-templates mode="bodytext"/></fo:block>
    	 
    		<fo:table table-layout="fixed" width="100%"> 
    		<fo:table-column column-width="17mm"/>
			<fo:table-column column-width="143mm"/>
    		
    		
    		<fo:table-body>
				<fo:table-row>
				   <fo:table-cell><fo:block></fo:block></fo:table-cell>
				    <fo:table-cell><fo:block></fo:block></fo:table-cell>
				
				</fo:table-row>
				
				
			<xsl:if test="Parameter">
			<fo:table-row>
			<fo:table-cell><fo:block font-size="9pt">Parameters:</fo:block></fo:table-cell>
			 <fo:table-cell>
			 	<fo:block keep-together="auto">
			 
				<fo:table table-layout="fixed" width="100%">
				<fo:table-column column-width="30mm"/>	
				<fo:table-column column-width="18mm"/>	
				<fo:table-column column-width="15mm"/>
				<fo:table-column column-width="80mm"/>
				
				 	<fo:table-body>
					<fo:table-row>
					
					<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Name'"/></xsl:call-template>
					<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Dimension'"/></xsl:call-template>
				<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Required'"/></xsl:call-template>
				<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Description'"/></xsl:call-template>
					 
					
					</fo:table-row>
    				
    				
    				<xsl:apply-templates select="Parameter"/>
    				</fo:table-body>
    			</fo:table>
    		 
			 	</fo:block>
			 
			 </fo:table-cell>
    		</fo:table-row>
    		</xsl:if>	
    			
    		<xsl:if test="Reference">
			<fo:table-row>
			<fo:table-cell>  
				<fo:block padding-top="3mm"></fo:block>
			</fo:table-cell>
			</fo:table-row>
    		
			<fo:table-row>
			<fo:table-cell>  
			<fo:block  font-size="9pt">
			References:
			</fo:block>
			</fo:table-cell>
			 <fo:table-cell>
			 <fo:block keep-together="auto">
			 
				<fo:table table-layout="fixed" width="100%">
				<fo:table-column column-width="30mm"/>	
				<fo:table-column column-width="18mm"/>	
				<fo:table-column column-width="15mm"/>
				<fo:table-column column-width="80mm"/>
			 	<fo:table-body>
					<fo:table-row>
					<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Name'"/></xsl:call-template>
					<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Target type'"/></xsl:call-template>
					<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Required'"/></xsl:call-template>
					<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Description'"/></xsl:call-template>
					
			 
					
					</fo:table-row>
    				<xsl:apply-templates select="Reference"/>
    				</fo:table-body>
    				</fo:table>
    			 
			 </fo:block> 
			 </fo:table-cell>
			</fo:table-row>		 
    		</xsl:if>	
    		
    		
    		<xsl:if test="Element">
    		<fo:table-row>
			<fo:table-cell>  <fo:block padding-top="3mm"></fo:block>
	    	 
			</fo:table-cell>
			</fo:table-row>
    		
    			<fo:table-row>
    			<fo:table-cell>  
    			<fo:block font-size="9pt">
    			Elements:
    			</fo:block>
    			</fo:table-cell>
    			<fo:table-cell>
    			<fo:block keep-together="auto">
    		 
    			<fo:table table-layout="fixed" width="100%">  
    			<fo:table-column column-width="48mm"/>	
				<fo:table-column column-width="15mm"/>
				<fo:table-column column-width="80mm"/>
    			<fo:table-body>
    				<fo:table-row>
    					<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Type'"/></xsl:call-template>
    					<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Required'"/></xsl:call-template>
    					<xsl:call-template name="colhead"><xsl:with-param name="txt" select="'Description'"/></xsl:call-template>
    			 
    				
    				</fo:table-row>
	    			<xsl:apply-templates select="Element"/>
    			</fo:table-body>
    			</fo:table>
    			 
    			</fo:block>
    			</fo:table-cell>
 </fo:table-row>
    		</xsl:if>
    		</fo:table-body>
    		</fo:table>
    	 
    	</fo:block>
    </xsl:template>
    
    
    <xsl:template name="colhead">
    	<xsl:param name="txt" select="''"/>
    	<fo:table-cell><fo:block font-size="8pt" font-style="italic" padding-top="0.4mm" margin-bottom="2mm"><xsl:value-of select="$txt"/></fo:block></fo:table-cell>
    </xsl:template>
    
    <xsl:template name="xtxt">
    	<xsl:param name="txt" select="''"/>
    	<fo:table-cell><fo:block font-family="monospace"  font-weight="bold" font-size="9pt" color="#b04040" margin-bottom="2mm"><xsl:value-of select="$txt"/></fo:block></fo:table-cell>
    </xsl:template>
    
    <xsl:template match="Parameter">
    	<fo:table-row>
    	    <xsl:call-template name="xtxt"><xsl:with-param name="txt" select="@name"/></xsl:call-template>
    		<fo:table-cell><fo:block font-size="9pt"> <xsl:value-of select="@dimension"/></fo:block></fo:table-cell>
    		<fo:table-cell> <fo:block font-size="9pt"> <xsl:value-of select="@required"/></fo:block></fo:table-cell>
    		<fo:table-cell><fo:block margin-bottom="2mm" font-size="9pt"><xsl:apply-templates/></fo:block></fo:table-cell>
    	</fo:table-row>
    </xsl:template>
    
     <xsl:template match="Reference">
    	<fo:table-row>
    	  <xsl:call-template name="xtxt"><xsl:with-param name="txt" select="@name"/></xsl:call-template>
    		 <xsl:call-template name="xtxt"><xsl:with-param name="txt" select="@type"/></xsl:call-template>
    		<fo:table-cell><fo:block font-size="9pt">  <xsl:value-of select="@required"/></fo:block></fo:table-cell>
    		<fo:table-cell><fo:block margin-bottom="2mm" font-size="9pt"><xsl:apply-templates/></fo:block></fo:table-cell>
    	</fo:table-row>
    </xsl:template>
   
    <xsl:template match="Element">
    	<fo:table-row>
    	 <xsl:call-template name="xtxt"><xsl:with-param name="txt" select="@type"/></xsl:call-template>
    		<fo:table-cell><fo:block font-size="9pt">  <xsl:value-of select="@required"/></fo:block></fo:table-cell>
    		<fo:table-cell><fo:block margin-bottom="2mm" font-size="9pt"><xsl:apply-templates/></fo:block></fo:table-cell>
    	</fo:table-row>
    </xsl:template>
   
   
   <xsl:template match="Parameter|Reference|Element" mode="bodytext"></xsl:template>
   
   
    <xsl:template match="introduction">
        <xsl:apply-templates/>
    </xsl:template>

  

    <xsl:template match="parin">
        <fo:block font-size="{$fontsize}"
                  font-family="sans-serif"
                  span="none"
		  line-height="12.5pt"
                  text-align="justify"
		  margin-left="5mm"
                  padding-left="5mm"
                  padding-right="2mm"
                  padding-top="2mm"
                  padding-bottom="6mm"
                  hyphenate="true"
                  hyphenation-character="-"
                  hyphenation-push-character-count="4"
                  hyphenation-remain-character-count="4">

            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>








    <xsl:template match="smallpar">
        <fo:block font-size="9pt"
                  font-family="sans-serif"
                  span="none"
		  line-height="12pt"
                  text-align="justify"
                  padding-left="2mm"
                  padding-right="2mm"
                  padding-top="0mm"
                  padding-bottom="1mm"
                  hyphenate="true"
                  hyphenation-character="-"
                  hyphenation-push-character-count="4"
                  hyphenation-remain-character-count="4">

            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>





    <xsl:template match="b">
        <fo:inline font-weight="bold"><xsl:apply-templates/></fo:inline>
    </xsl:template>


    <xsl:template match="ul">
        <fo:block
            font-size="{$fontsize}"
            padding-top="2mm"
            padding-bottom="1mm">
            <fo:list-block
                provisional-distance-between-starts="7mm">

                <xsl:apply-templates select="li"/>
            </fo:list-block>
        </fo:block>
    </xsl:template>

    <xsl:template match="ol">
        <fo:block
            font-size="{$fontsize}"
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
                <fo:block font-size="16pt">&#8226;</fo:block>
            </fo:list-item-label>

            <fo:list-item-body start-indent="15mm">
                <fo:block padding-left="6mm" 
			  padding-bottom="1mm"
			  line-height="12.5pt"
			  font-size="{$fontsize}">
		    <xsl:apply-templates/></fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>



    <xsl:template match="br"><fo:block/></xsl:template>

    <xsl:template match="i">
        <fo:inline font-style="italic"><xsl:apply-templates/></fo:inline>
    </xsl:template>

    <xsl:template match="pounds">&#163;</xsl:template>


    <xsl:template match="eacute">&#233;</xsl:template>
    
    <xsl:template match="secref">
        <xsl:variable name="tgt"><xsl:value-of select="@section"/></xsl:variable>
        <xsl:variable name="num"><xsl:value-of select="/doc/section[attribute::id=$tgt][position()=1]/@number"/></xsl:variable>
         <xsl:variable name="ttl"><xsl:value-of select="/doc/section[attribute::id=$tgt][position()=1]/title"/></xsl:variable>
        <xsl:choose>
            <xsl:when test="$num"><xsl:value-of select="$num"/> (<xsl:value-of select="$ttl"/>)</xsl:when>
            <xsl:otherwise>(MISSING id:<xsl:value-of select="$tgt"/>)</xsl:otherwise>
        </xsl:choose></xsl:template>


 <xsl:template match="elthead">
        <fo:block font-size="{$fontsize}"
                  font-family="monospace"
                  font-weight="bold"
                  span="none"
          line-height="12.5pt">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>


 <xsl:template match="peltdef">
        <fo:block font-size="{$fontsize}"
                  font-family="sans-serif"
                  span="none"
          line-height="12.5pt"
                  text-align="justify"
          margin-left="5mm"
                  padding-left="5mm"
                  padding-right="2mm"
                  padding-top="2mm"
                  padding-bottom="6mm"
                  hyphenate="true"
                  hyphenation-character="-"
                  hyphenation-push-character-count="4"
                  hyphenation-remain-character-count="4">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>



<xsl:template match="pattdef">
        <fo:block font-size="{$fontsize}"
        font-family="serif" font-weight="normal"
                  span="none"
          line-height="10.5pt"
                  text-align="left"
          margin-left="5mm"
                  padding-left="5mm"
                  padding-right="2mm"
                  padding-top="0mm"
                  padding-bottom="1mm"
                  hyphenate="true"
                  hyphenation-character="-"
                  hyphenation-push-character-count="4"
                  hyphenation-remain-character-count="4">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>


<xsl:template match="divattdefname">
        <fo:inline font-size="{$fontsize}"
        font-family="monospace" font-weight="bold"
                  span="none"
          line-height="12.5pt"
                  text-align="left">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    
    
 <xsl:template match="divattdefname/span">
    <fo:inline font-size="8pt" font-family="serif" font-style="italic">
        <xsl:apply-templates/>
    </fo:inline>
 </xsl:template>   
  
  <xsl:template match="pchlddef/span">
    <fo:inline font-size="8pt" font-family="serif" font-style="italic">
        <xsl:apply-templates/>
    </fo:inline>
 </xsl:template>   
  
  
<xsl:template match="pchlddef">
        <fo:block font-size="{$fontsize}"
                  font-family="monospace"
                  span="none"
          line-height="10.5pt"
                  text-align="justify"
          margin-left="5mm"
                  padding-left="5mm"
                  padding-right="2mm"
                  padding-top="1mm"
                  padding-bottom="0mm"
                  hyphenate="true"
                  hyphenation-character="-"
                  hyphenation-push-character-count="4"
                  hyphenation-remain-character-count="4">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    
    
    
    <xsl:template match="img">
        <xsl:variable name="fsrc">images/<xsl:value-of select="@src"/></xsl:variable>
        <fo:block padding-left="40mm">
            <fo:external-graphic src="{$fsrc}" content-width="12cm" 
 content-height="8cm" scaling="uniform"/>
        </fo:block>
    </xsl:template>
    
    
    

</xsl:stylesheet>
