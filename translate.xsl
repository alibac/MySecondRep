<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:output
    method="html"
    encoding="UTF-8"
    doctype-public="-//W3C//DTD HTML 4.01//EN"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    indent="yes" />
    
  <!-- template principal qui structure le document HTML -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Ma bibliotheque</title>
        <link type="text/css" rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <h1>Ma bibliothèque</h1>
                     <!-- Je récupère chaque Noeud Livre pour exécuter le template principal  -->
	    <xsl:for-each select="bibliotheque/livre">
	        <xsl:call-template name="book">
		    <xsl:with-param name="livre" select="." />
		</xsl:call-template>
	    </xsl:for-each>	   
        
        <div class="footer">
          Ali Bachiri - 22/10/2014
        </div>
      </body>
    </html>
  </xsl:template>
 
  <!-- template "book" qui gère l'affichage d'un livre -->
  <xsl:template name="book">
    <xsl:param name="livre" />
    
    <div class="book">
      <!-- appel du template "titreOriginal" -->
       <xsl:call-template name="titreOriginal">
        <xsl:with-param name="titre" select="$livre/titreOriginal" />
      </xsl:call-template>             
      <!-- appel du template "titres" -->
      <!-- Si il y'a d'autres titres -->
       <xsl:if test="count($livre/titres) != 0">
        <xsl:call-template name="titres">
          <xsl:with-param name="titres" select="$livre/titres" />
        </xsl:call-template>
      </xsl:if>     
      <!-- appel du template "informations" -->
      <xsl:call-template name="informations">
        <xsl:with-param name="type" select="$livre/@type" />
        <xsl:with-param name="style" select="$livre/@style" />
        <xsl:with-param name="auteur" select="$livre/auteur" />
        <xsl:with-param name="date" select="$livre/annee" />
      </xsl:call-template>   
      <!-- appel du template "resume" -->
      <xsl:call-template name="resume">
        <xsl:with-param name="resume" select="$livre/resume" />
      </xsl:call-template>

    <!--temlate "titreOriginal" qui gère l'affichage du titre original d'un livre -->
  <xsl:template name="titreOriginal">
    <xsl:param name="titre" />
    
    <h2>      
      <xsl:value-of select="$titre" />&#160;(<xsl:value-of select="$titre/@lang" />)
    </h2>
  </xsl:template>
 
  <!-- template "titres" qui gère l'affichage des autres titres d'un livre -->
  <!-- Ce template est appelé seulement si il y'a d'autres titres  -->
  <xsl:template name="titres">
    <xsl:param name="titres" />
      
    <h3>Autres titres </h3>
    <ul>
      <xsl:for-each select="$titres/titre">
        <li><xsl:value-of select="." />&#160;(<xsl:value-of select="./@lang" />)</li>
      </xsl:for-each>


</xsl:stylesheet>
