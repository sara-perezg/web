<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <head>
        <title>Mis Datos</title>  
      </head>
      <body>
       <h3>1. Crear una tabla HTML con los nombres y grados de los ciclos Formativos</h3> 
        <table>
        <th>
        <td>Nombre</td>
        <td>Grado</td>
        </th>
        <xsl:for-each select = "//ciclos/ciclo">
         <tr>
          <td><xsl:value-of select="nombre/text()"></xsl:value-of></td>
          <td><xsl:value-of select="grado/text()"></xsl:value-of></td>
        </tr>
        </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
