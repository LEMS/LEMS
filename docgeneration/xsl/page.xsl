<!DOCTYPE stylesheet [
<!ENTITY copy  "&#169;" >
<!ENTITY nbsp  "&#160;" >
<!ENTITY middot  "&#183;" >
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="html" version="1.0" encoding="iso-8859-1"
		doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"
		omit-xml-declaration="yes" indent="yes" />


   <xsl:include href="xmlverbatim.xsl"/>

	<xsl:param name="datestamp" select="''" />
	<xsl:param name="datetext" select="''" />
	<xsl:param name="vnum" select="''" />
	<xsl:param name="vdate" select="''" />

	<!--    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" -->
	<!--    doctype-system="DTD/xhtml1-strict.dtd" -->



	<xsl:template match="page">
		<html>
			<head>
				<title>
					<xsl:value-of select="@title" />
				</title>

				<xsl:choose>
					<xsl:when test="@metatext">
						<meta name="description" content="{@metatext}" />
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
				<link type="text/css" rel="stylesheet" href="static.css"></link>
				<link rel="icon" href="favico.png" type="image/png"></link>
			</head>



			<body>
                            <div id="left">
                             <div><a href="index.html">About</a></div>
                            <div><a href="introduction.html">Introduction</a></div>
                            <div><a href="elements.html">Elements</a></div>
                            <div><a href="interpreter.html">Download</a></div>
                            <div><a href="example1.html">Example 1</a></div>
                            <div><a href="example2.html">Example 2</a></div>
                            <div><a href="example3.html">Example 3</a></div>
                            <div><a href="example4.html">Example 4</a></div>
                            <div><a href="example5.html">Example 5</a></div>
                            <div><a href="example6.html">Example 6</a></div>
                            <div><a href="example7.html">Example 7</a></div>
                            <div><a href="example-regimes.html">Regimes example</a></div>
                            <!--<div><a href="neuroml2.html">NeuroML 2 etc.</a></div>-->
                            <div><a href="example-n.html">Example n</a></div>
                            <div><a href="canonical.html">Canonical form</a></div>
                            <div><a href="discussion.html">Discussion</a></div>
                            <div class="footer">
                                Code and content GPL
                            </div>
                            </div>

                            <div id="content">
                            <xsl:apply-templates>
                                <xsl:with-param name="name" select="@name" />
                            </xsl:apply-templates>
                            </div>


			

			</body>
		</html>
	</xsl:template>


	<xsl:template match="versioninfo">
		<xsl:value-of select="$vnum"/>&nbsp; <xsl:value-of select="$vdate"/>
	</xsl:template>
	
	
	<xsl:template match="downloadlink">
		<xsl:variable name="zfnm">lems-<xsl:value-of select="$vnum"/>.jar</xsl:variable>
		<a href="{$zfnm}"><xsl:value-of select="$zfnm"/></a>
	</xsl:template>

	<xsl:template match="centerimg">
		<table align="center">
			<tr><td><img src="{@src}"/></td></tr>
		</table>
	</xsl:template>
	

	<xsl:template match="nbsp">
		&#160;
	</xsl:template>



	<!--  pass html through unchanged -->
	<xsl:template match="pre|img|input|textarea|iframe|script|tt|code">
		<xsl:copy-of select="." />
	</xsl:template>

	<!--
		pass through tag and attributes, but apply templates to inside just in
		case there is something to match
	-->
	<xsl:template
		match="tt|ul|ol|li|center|hr|u|i|b|p|h1|h2|h3|h4|br|form|table|td|tr|div|a|span|sup|strong|object|param|embed|map|area">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>


	<xsl:template match="img">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>





	<xsl:template match="middot">&middot;
	</xsl:template>



  <xsl:template match="code">
                 <div class="code">
                         <pre><xsl:apply-templates/></pre>
                 </div>
        </xsl:template>

        <xsl:template match="smallcode">
                 <div class="smallcode">
                         <pre><xsl:apply-templates/></pre>
                 </div>
        </xsl:template>


        <xsl:template match="xcode">
                <div class="xcode"><xsl:apply-templates mode="xcodeitem"/></div>
                 
        </xsl:template>

        
        <xsl:template match="*" mode="xcodeitem">
            <div class="xcodeelement">
             <xsl:apply-templates select="." mode="xmlverb">
                  <xsl:with-param name="indent-elements" select="1"/>
                  <xsl:with-param name="mains" select="'-Type-HHCell1-HHCell-HHChannel-Component-Network-Simulation-'"/>
             </xsl:apply-templates>
               </div>
        </xsl:template>
        
    
        
        
        <xsl:template match="x">
            <span class="xelt"><xsl:apply-templates/></span>
        </xsl:template>



    <xsl:template match="xinclude">
        <div class="fileincludetitle">
            <xsl:variable name="fnm">
            <xsl:call-template name="lastpart">
                <xsl:with-param name="rest" select="@src"/>
           </xsl:call-template>
            </xsl:variable>
            <xsl:value-of select="$fnm"/>
            (<a href="{$fnm}">xml</a>)
        </div>
        <div class="xcodefile">
            <xsl:apply-templates select="document(@src)" mode="xcodeitem"/>     
        </div>
    </xsl:template>
    
    
    <xsl:template name="lastpart">
        <xsl:param name="rest" select="''"/>
        <xsl:variable name="r"><xsl:value-of select="substring-after($rest, '/')"/></xsl:variable>
        <xsl:choose>
            <xsl:when test="$r = ''">
                <xsl:value-of select="$rest"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="lastpart">
                    <xsl:with-param name="rest" select="$r"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>






    <xsl:template match="Elt">
        <div class="eltdef">
            <h3><xsl:value-of select="@name"/></h3>
            <xsl:apply-templates mode="defs"/>
        </div>
    </xsl:template>

    <xsl:template match="IntParam" mode="defs">
        <div class="attdef">
            <div class="attdefname"><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(int)</span></div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

      <xsl:template match="Label" mode="defs">
        <div class="attdef">
            <div class="attdefname"><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(string)</span></div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
     <xsl:template match="EltRef" mode="defs">
        <div class="attdef">
            <div class="attdefname"><xsl:value-of select="@name"/></div>
            Reference to a component of type <span class="eltname"><xsl:value-of select="@to"/>. </span>
            <xsl:apply-templates/>
        </div>
    </xsl:template>


     <xsl:template match="Choice" mode="defs">
        <div class="attdef">
            <div class="attdefname"><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(choice)</span></div>
            possible values: <xsl:value-of select="@values"/> <xsl:apply-templates/>
        </div>
    </xsl:template>

     <xsl:template match="Expression" mode="defs">
        <div class="attdef">
            <div class="attdefname"><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(expression)</span></div>
             <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="Path" mode="defs">
        <div class="attdef">
            <div class="attdefname"><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(path)</span></div>
             <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="Quantity" mode="defs">
        <div class="attdef">
            <div class="attdefname"><xsl:value-of select="@name"/> <span class="attmeta"> &nbsp;&nbsp;(quantity)</span></div>
             <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="Child" mode="defs">
        <div class="chlddef">       
                <xsl:value-of select="@typ"/>
                <xsl:if test="@number">
                    <span class="attmeta"> &nbsp;&nbsp;(<xsl:value-of select="@number"/>)</span>
                 </xsl:if>
         </div>
    </xsl:template>


    <xsl:template match="Info" mode="defs">
        <div class="info">
            <xsl:apply-templates/>
        </div>
    </xsl:template>


	<xsl:template match="GeneratedElementsList">
		<xsl:variable name="pth">../extractedannotations/sourceannotations.xml</xsl:variable>
		<xsl:apply-templates select="document($pth, /)">
			<xsl:with-param name="section" select="@section"/>
		</xsl:apply-templates>
	</xsl:template>



	<xsl:template match="ElementTypes">
		<xsl:param name="section"/>
		<xsl:apply-templates>
			<xsl:with-param name="section" select="$section"/>
		</xsl:apply-templates>
	</xsl:template>

     <xsl:template match="ElementType">
		<xsl:param name="section"/>
		<xsl:if test="@section = $section">
        <div class="eltdef">
            <h3><xsl:value-of select="@name"/></h3>
          
            	<xsl:apply-templates select="Info" mode="defs"/>
           
            
           	 <xsl:apply-templates select="Property" mode="defs"/>
        	<xsl:if test="ListProperty">
        		
        		<div class="attdef childof">
            		<div class="childofname"> 
           			 <span class="attmeta">Can contain:</span></div>
        			<xsl:apply-templates select="ListProperty"/>
        		</div>
        	</xsl:if>

        	<xsl:if test="OccursInside">

				<div class="attdef childof">
            		<div class="childofname"> 
           			 <span class="attmeta">Child of:</span></div>
        			<xsl:apply-templates select="OccursInside"/>
        		</div>
        	</xsl:if>
        	
        </div>
		</xsl:if>
    </xsl:template>

	
	<xsl:template match="ListProperty">
		<xsl:value-of select="@type"/><br/>
	</xsl:template>
	
	<xsl:template match="OccursInside">
		<xsl:apply-templates/> 
	</xsl:template>


  <xsl:template match="Property" mode="defs">
        <div class="attdef">
            <div class="attdefname"><xsl:value-of select="@name"/>
            <span class="attmeta">  (<xsl:value-of select="@type"/>)</span></div>
            <xsl:apply-templates/>&nbsp;
        </div>
    </xsl:template>


</xsl:stylesheet>



