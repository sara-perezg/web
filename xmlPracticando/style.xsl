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
          <table class = "tabla">
          <xsl:for-each select="//modulos">
            <tr class = "header"><td colspan = "2" >Nombre del ciclo</td></tr>
            <tr><td  colspan = "2" ><xsl:value-of select="@ciclo"></xsl:value-of></td></tr>
            <tr class = "header">
              <td>Nombre del modulo</td>
              <td>Nombre del alumno</td>
            </tr>
            <xsl:for-each select="nombre">
            <tr>
              <td><xsl:value-of select="text()"></xsl:value-of></td>
              <td>
                <xsl:for-each select="suspensos/alumno">
                  <table><tr><td><xsl:value-of select="text()"></xsl:value-of></td></tr></table> 
                </xsl:for-each>
              </td>
            </tr>
            </xsl:for-each>
          </xsl:for-each>
          </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
