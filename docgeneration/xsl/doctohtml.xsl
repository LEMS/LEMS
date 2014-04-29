<!DOCTYPE stylesheet [
<!ENTITY copy  "&#169;" >
<!ENTITY nbsp  "&#160;" >
<!ENTITY cents  "&#162;" >
<!ENTITY euro  "&#8364;" >
<!ENTITY pound  "&#163;" >
<!ENTITY yen  "&#165;" >
<!ENTITY middot  "&#183;" >
]> 

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">


    <xsl:output method="html" omit-xml-declaration="no" indent="yes"/>

	<xsl:include href="xmlverbatim.xsl"/>

	
    <xsl:template match="doc">
    	<html>
    		<head>
    			<style type="text/css">
    				body {margin : 32px; color : #303030; font-family : sans-serif}
    				h1,h2,h3 { font-family : helvetica, sans-serif} 
    				h1 {color : #404040; font-size : 18pt}
    				h2 {color : #404040; font-size : 14pt}
    				h3 {color : #404040; font-size : 12pt}
    				h4 {color : #404040; font-size : 11pt}
    				
    				div.section {margin-top : 64px}
    				div.subsection {margin-top : 32px; margin-left : 0px}
    				p.discussion {margin-left : 120px; font-size : 9pt; color : #404090}
    				div.code {background-color : #fffff4; border : 1px solid #c0c0c0; margin : 12px}
    				div.smallcode {background-color : #fffff4; border : 1px solid #c0c0c0; margin : 12px}
    				pre {padding-left : 12px; margin : 0px; color : #800000; font-size : 8pt}
    				span.m {font-family : monospace; color : #000060}
    				span.x {font-family : monospace; font-weight : bold; color : #800000}
    				div.type {background-color : #f4f8ff; padding : 6px; border : 1px solid #c0c0c0; margin: 12px 40px 22px 40px}
    				th {text-align : left; font-size : 8pt; font-style : italic; font-weight : normal}
    				div.vskip {height : 12px}
    				td.tableft { font-size : 7pt; font-weight : bold; color : #606060; padding : 4px 10px 0px 0px}
    			</style>
    		</head>
    		<body>
    			
    			<xsl:apply-templates/>
    		
    		</body>
    	</html>   
    </xsl:template>
    
    
    <xsl:template match="section">
    	<div class="section">
    		<xsl:apply-templates/>
    	</div>
    </xsl:template>
    
    
     <xsl:template match="subsection">
    	<div class="subsection">
    		<xsl:apply-templates/>
    	</div>
    </xsl:template>
    
    
    
     <xsl:template match="title">
    	<h1><xsl:apply-templates/></h1>
    </xsl:template>
    
   
      <xsl:template match="section/title">
    	<h2><xsl:apply-templates/></h2>
    </xsl:template>
    
      <xsl:template match="subsection/title">
    	<h3><xsl:apply-templates/></h3>
    </xsl:template>
    
     <xsl:template match="subsubsection/title">
    	<h4><xsl:apply-templates/></h4>
    </xsl:template>
    
      <xsl:template match="ul|li|br|b">
      	<xsl:copy-of select="."/>
      </xsl:template>
    
    
    	<xsl:template match="p">
    	 <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
              
        </xsl:copy>    		
    	</xsl:template>
    
    <xsl:template match="code">
    <div class="code">
    <pre><xsl:apply-templates mode="xmlverb"/></pre>
    </div>
	</xsl:template>
	
 <xsl:template match="smallcode">
		<div class="smallcode">
			<pre><xsl:apply-templates mode="xmlverb"/></pre>
		</div>
	</xsl:template>
	
	
   <xsl:template match="sup">
                <sup class="power"><xsl:apply-templates/></sup>
        </xsl:template>

        <xsl:template match="pow">
                <sup class="power"><xsl:apply-templates/></sup>
        </xsl:template>


        <xsl:template match="sub">
                <sub><xsl:apply-templates/></sub>
        </xsl:template>

	<xsl:template match="x">
		<span class="x"><xsl:apply-templates/></span>
	</xsl:template>
    
    <xsl:template match="m">
		<span class="m"><xsl:apply-templates/></span>
	</xsl:template>
    
    
    
    <xsl:template match="Type">
    	<div class="type">
    		<b><xsl:value-of select="@name"/></b>
    		<xsl:if test="@extends">
    			extends <xsl:value-of select="@extends"/>
    		</xsl:if>
    		
    		<table> 
				
			<xsl:if test="Parameter">
			<tr>
			<td valign="top" class="tableft">Parameters:</td>
			 <td>
				<table cellspacing="0" cellpadding="4">
					<tr><th>Name</th><th>Dimension</th><th>Required</th><th>Notes</th></tr>
    				<xsl:apply-templates select="Parameter"/>
    			</table>
			 </td>
    		</tr>
    		</xsl:if>	
    			
    		<xsl:if test="Reference">
			<tr>
			<td colspan="2">
	    		<div class="vskip">&nbsp;</div>
			</td>
			</tr>
    		
			<tr>
			<td valign="top" class="tableft">
			References:
			</td>
			 <td>
				<table cellspacing="0" cellpadding="4">
					<tr><th>Name</th><th>Target type</th><th>Required</th><th>Notes</th></tr>
    				<xsl:apply-templates select="Reference"/>
    			</table>
			 </td>
			</tr>		 
    		</xsl:if>	
    		
    		
    		<xsl:if test="Element">
    		<tr>
			<td colspan="2">
	    		<div class="vskip">&nbsp;</div>
			</td>
			</tr>
    		
    			<tr>
    			<td valign="top" class="tableft">
    			Elements:
    			</td>
    			<td>
    			<table cellspacing="0" cellpadding="4">
    				<tr><th>Type</th><th>Required</th><th>Notes</th></tr>
	    			<xsl:apply-templates select="Element"/>
    			</table>
    			</td>
 </tr>
    		</xsl:if>
    		</table>
    	</div>
    </xsl:template>
    
    
    <xsl:template match="Parameter">
    	<tr>
    		<td valign="top" style="padding-right : 10px"><span class="x"><xsl:value-of select="@name"/></span></td>
    		<td valign="top"><xsl:value-of select="@dimension"/></td>
    		<td valign="top"><xsl:value-of select="@required"/></td>
    		<td><xsl:apply-templates/></td>
    	</tr>
    </xsl:template>
    
     <xsl:template match="Reference">
    	<tr>
    		<td valign="top" style="padding-right : 10px"><span class="x"><xsl:value-of select="@name"/></span></td>
    		<td valign="top"><xsl:value-of select="@type"/></td>
    		<td valign="top"><xsl:value-of select="@required"/></td>
    		<td><xsl:apply-templates/></td>
    	</tr>
    </xsl:template>
    
    
    
    <xsl:template match="Element">
    	<tr>
    		<td><span class="x"><xsl:value-of select="@type"/></span></td>
    		<td>
    		</td>
    		<td>
    			<xsl:apply-templates/>
    		</td>
    	</tr>
    </xsl:template>
    
    
    <xsl:template match="docmeta">
    	<h2><xsl:value-of select="@title"/></h2>
    	 
    		<xsl:apply-templates/>
    	 
    </xsl:template>
    
     
    
    
</xsl:stylesheet>
