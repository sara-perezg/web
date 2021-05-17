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
          
          
        <h3>3. Crear una tabla HTML con los atos de los alumnos (nombre y notas oredenado de manera ascendente por nota</h3>
        <table class = "tabla">
          <tr class = "header">
            <td>Nombre</td>
            <td>Nota</td>
          </tr>
          <xsl:for-each select="//alumno">
          <xsl:sort select = "@nota" order = "ascending"></xsl:sort>
          
            <tr>
              <td><xsl:value-of select="text()"></xsl:value-of></td>
              <td><xsl:value-of select="@nota"></xsl:value-of></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <h3>4. Crea una tabla HTML con los datos de los alumnos que tienen una nota de 3 en alguna asignatura</h3>
        <table class = "tabla">
          <tr class = "header">
            <td>Nombre</td>
            <td>Nota</td>
          </tr>
          <xsl:for-each select="//alumno[@nota = 3]">
            <tr>
              <td><xsl:value-of select="text()"></xsl:value-of></td>
              <td><xsl:value-of select="@nota"></xsl:value-of></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <h3>5. Crear una tabla HTML que muestre los nombre de los alumnos suspenso y su nota con diferente color de fonde segun la nota</h3>
        <table class = "tabla">
          <tr class = "header"> 
            <td>Nombre</td>
            <td>Nota</td>
          </tr>
            <xsl:for-each select="//alumno">
            <xsl:if test="@nota = 4">
              <tr class = "nota4">
                <td><xsl:value-of select="text()"></xsl:value-of></td>
                <td><xsl:value-of select="@nota"></xsl:value-of></td>
              </tr>
            </xsl:if>
            <xsl:if test="@nota = 3">
              <tr class = "nota3">
                <td><xsl:value-of select="text()"></xsl:value-of></td>
                <td><xsl:value-of select="@nota"></xsl:value-of></td>
              </tr>
            </xsl:if>
            <xsl:if test="@nota = 2">
              <tr class = "nota2">
                <td><xsl:value-of select="text()"></xsl:value-of></td>
                <td><xsl:value-of select="@nota"></xsl:value-of></td>
              </tr>
            </xsl:if>
            <xsl:if test="@nota = 1">
              <tr class = "nota1">
                <td><xsl:value-of select="text()"></xsl:value-of></td>
                <td><xsl:value-of select="@nota"></xsl:value-of></td>
              </tr>
            </xsl:if>
            </xsl:for-each>
            
            <br/>
            <br/>
        </table>
              <table class = "tabla">
          <tr class = "header"> 
            <td>Nombre</td>
            <td>Nota</td>
          </tr>
            <xsl:for-each select="//alumno">
            <xsl:choose>
            <xsl:when test="@nota = 4">
            <tr class = "nota4">
                <td><xsl:value-of select="text()"></xsl:value-of></td>
                <td><xsl:value-of select="@nota"></xsl:value-of></td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
            <tr>
                <td><xsl:value-of select="text()"></xsl:value-of></td>
                <td><xsl:value-of select="@nota"></xsl:value-of></td>
              </tr>
            </xsl:otherwise>
            </xsl:choose>
            </xsl:for-each>
        </table>
        
        <h3>6. Crear una tabla que muestre todos los datos de los ciclos fromativs de grado superior con diferente color de fonde segun el año de decreto</h3>
        <table class = "tabla">
          <tr class = "header">
            <td>Nombre</td>
            <td>Grado</td>
            <td>Decreto</td>
          </tr>
          <xsl:for-each select="//ciclo">
          <xsl:choose>
            <xsl:when test="decretoTitulo/@año = 2009">
            <tr class = "decreto2009">
                <td><xsl:value-of select="nombre/text()"></xsl:value-of></td>
                <td><xsl:value-of select="grado/text()"></xsl:value-of></td>
                <td><xsl:value-of select="decretoTitulo/@año"></xsl:value-of></td>
              </tr>
            </xsl:when>
            <xsl:when test="decretoTitulo/@año = 2010">
            <tr class = "decreto2010">
                <td><xsl:value-of select="nombre/text()"></xsl:value-of></td>
                <td><xsl:value-of select="grado/text()"></xsl:value-of></td>
                <td><xsl:value-of select="decretoTitulo/@año"></xsl:value-of></td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
            <tr class = "decretoOther">
                <td><xsl:value-of select="nombre/text()"></xsl:value-of></td>
                <td><xsl:value-of select="grado/text()"></xsl:value-of></td>
                <td><xsl:value-of select="decretoTitulo/@año"></xsl:value-of></td>
              </tr>
            </xsl:otherwise>
          </xsl:choose>
          </xsl:for-each>
        </table>
        
        <h3>7. Crear una transformacion que muestre diferentes tablas con los nombres 
        de los alumnos segun la nota obtenido por estos, es decir una tabla para todos los alumnos con un 1, otra tabla para los
        alumnos que han sacado un 2 otra para los que tengan un 3
    </h3>
        <table class = "tabla">
        <tr class = "header">
          <td>Nombre</td>
          <td>Nota</td>
        </tr>
        <xsl:for-each select="//suspensos">
        <tr>
          <td><xsl:value-of select="alumno[@nota = 4]/text()"></xsl:value-of></td>
          <td><xsl:value-of select="alumno[@nota = 4]/@nota"></xsl:value-of></td>
        </tr>
        </xsl:for-each>
        </table>
        
        <table class = "tabla">
        <tr class = "header">
          <td>Nombre</td>
          <td>Nota</td>
        </tr>
        <xsl:for-each select="//suspensos">
        <tr>
          <td><xsl:value-of select="alumno[@nota = 3]/text()"></xsl:value-of></td>
          <td><xsl:value-of select="alumno[@nota = 3]/@nota"></xsl:value-of></td>
        </tr>
        </xsl:for-each>
        </table>
        
         <table class = "tabla">
        <tr class = "header">
          <td>Nombre</td>
          <td>Nota</td>
        </tr>
        <xsl:for-each select="//suspensos">
        <tr>
          <td><xsl:value-of select="alumno[@nota = 2]/text()"></xsl:value-of></td>
          <td><xsl:value-of select="alumno[@nota = 2]/@nota"></xsl:value-of></td>
        </tr>
        </xsl:for-each>
        </table>
        
         <table class = "tabla">
        <tr class = "header">
          <td>Nombre</td>
          <td>Nota</td>
        </tr>
        <xsl:for-each select="//suspensos">
        <tr>
          <td><xsl:value-of select="alumno[@nota = 1]/text()"></xsl:value-of></td>
          <td><xsl:value-of select="alumno[@nota = 1]/@nota"></xsl:value-of></td>
        </tr>
        </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
