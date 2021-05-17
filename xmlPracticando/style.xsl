<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <head>
        <title>Mis Datos</title>
        <link rel = "stylesheet" href="style.css"/>
      </head>
      <body>
       <h3>1. Crear una tabla HTML con los nombres y grados de los ciclos Formativos</h3> 
        <table class = "tabla">
        <tr class = "header">
          <td>Nombre</td>
          <td>Grado</td>
        </tr>
        <xsl:for-each select = "//ciclos/ciclo">
         <tr>
          <td><xsl:value-of select="nombre/text()"></xsl:value-of></td>
          <td><xsl:value-of select="grado/text()"></xsl:value-of></td>
        </tr>
        </xsl:for-each>
        </table>
        
        <h3>2. Crear una tabla HTML que contenga los alumnos suspenso en cada modulo indenado nombre del aluno y nombre del modulo</h3>
        <table>
          <tr>
            <td></td>
            <td></td>
          </tr>  
          <xsl:for-each select="">
          <tr>
            <td></td>
            <td></td>
          </tr>
          </xsl:for-each>
        </table>  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
