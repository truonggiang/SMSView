<?xml version="1.0" encoding="UTF-8"?>
<!-- =================================================

This template is a skeleton for single level TOC pages 
Do not overwrite this ! copy it and complete the missing
code.

I use the @ character whereever there is a missing code, so 
you can use a simple find to navigate and find the
places...

====================================================== -->

<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method               = "html"
                media-type           = "text/html"
                indent               = "yes"
                doctype-public       = "-//W3C//DTD HTML 4.0 Transitional//EN"
                omit-xml-declaration = "yes"
                standalone           = "yes" />
  
	<xsl:include href="../layout.xsl"/>

	 
	 
	 <!-- =============================
	               HTML BODY
	 ================================== -->
	 
	 <xsl:template name="body">
	 	<xsl:call-template name="toc"/>
	 </xsl:template>
	 
	 
	 <xsl:template name="toc">
	 	<xsl:variable name="doc-count" select="count(/session/content/document)"/>
	 
		<table width="{$doc-count * 250}" height="250" border="0" cellpadding="0" cellspacing="0" class="tcolor">
  		
  		<tr> 
	    <td height="50" colspan="{$doc-count * 2 + 2}" class="toctitle">
	      <xsl:value-of select="/session/general-info/@title"/>
	    </td>
  		</tr>

		<!-- use this alternative if you do not need to use groups 
		(uncomment to use - and do not forget to comment the group 
		option above...)-->
		
		<tr>
			<xsl:apply-templates select="/session/content/document"/>
			<td colspan="2"></td>
		</tr>

		</table>
		
		<!--
		     @ post toc html here
		-->
		
		<p class="colback"> </p>

	 </xsl:template>
	 
	<!-- also when using groups, in the end it comes 
	to this template, which is called for each document -->
	<xsl:template match="document">
	  
 		     <!-- image cell -->
    	
    			<td width="50" height="200" align="center"> 
      			<p>
				  		<xsl:apply-templates select="@icon"/>
		   		</p>
				</td>
	  
	  		<td width="200"><p>
	  		
	  		<xsl:apply-templates select="@title">
				<xsl:with-param name="target" select="'mainframe'"/>
			</xsl:apply-templates>
			
			<xsl:apply-templates select="@description"/>
			<xsl:apply-templates select="@author"/>
			<xsl:apply-templates select="@create-date"/>
			<xsl:apply-templates select="@update-date"/>
			<xsl:apply-templates select="@filename"/>
			<xsl:apply-templates select="@format"/>
			<xsl:apply-templates select="@pages"/>
			<xsl:apply-templates select="@size"/>
			
			
		</p> </td>
	
	</xsl:template>
    
</xsl:stylesheet>
