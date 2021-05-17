<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
  <html>
  <head>
  <style type="text/css">table{ border:1px solid black;}
  </style>
  </head>
<body>
 <h1>1.Crear una tabla HTML con los nombres y grados de los ciclos Formativos</h1>
  <table style="border:1px solid lightblue">
      <tr style="background-color:orange">
        <th >Nombre</th>
        <th>Grado</th>
      </tr>  
      <xsl:for-each select="//ciclo">
      <tr>
        <td><xsl:value-of select="nombre" /></td>
        <td><xsl:value-of select="grado"/></td>
        </tr>
      </xsl:for-each>
        </table>
        
      <h1>2. Crear una tabla HTML que contenga los alumnos suspensos en cada módulo indicando
              nombre del alumno y nombre del módulo.</h1>
                <table style="1px solid orage">
                 <tr style="background-color:lightblue">
                  <th style="text-align:center">Alumno</th>
                  <th style="text-align:center">Módulo</th>
                  </tr>
                  <xsl:for-each select="ies/modulos/nombre">
                  <tr>
                    <td style="text-align:center">
                      <xsl:for-each select="suspensos/alumno">
                          <xsl:value-of select="text()"/>
                      </xsl:for-each>
                    </td>
                    <td style="text-align:center">
                      <xsl:value-of select="text()"/>
                    </td>
                  </tr>
                   
                  </xsl:for-each>
                  </table>     
                  
        <h1>3. Crear una tabla HTML con los datos de los alumnos (nombre y notas) ordenado de
                  manera ascendente por nota.</h1>
                  
                  <table style="border:1px solid lightblue">
                    <tr>
                    <th>Nombre</th>
                    <th>Nota</th>
                    </tr>
                    
                    <xsl:for-each select="//alumno">
                    <xsl:sort select="@nota" data-type="number"/>
                      <tr>
                      <td><xsl:value-of select="text()"/></td>
                      <td><xsl:value-of select="@nota"/></td>
                      </tr>
                    </xsl:for-each>
                  </table>
                  
          <h1>4. Crear una tabla HTML con los datos de los alumnos que tienen una nota de 3 en alguna
                    asignatura.</h1>
                    
                    <table>
                      <tr>
                        <th>Alumno</th>
                        <th>Nota</th>
                      </tr>
                      
                      <xsl:for-each select="//alumno">
                        <xsl:if test="@nota=3">
                          <tr>
                          <td><xsl:value-of select="text()"/></td>
                          <td><xsl:value-of select="@nota"/></td>
                          </tr>
                        </xsl:if>
                      </xsl:for-each>
                    </table>
                    
            <h1>Crear una tabla HTML que muestre los nombres de los alumnos suspensos y su
                      nota con diferente color de fondo según la nota.</h1>
                      
                      <table style="border:1px solid lightblue">
                      <tr>
                        <th>Alumno</th>
                        <th>Nota</th>
                      </tr>
                      
                     <xsl:for-each select="//alumno">
                    <xsl:choose>
                    <xsl:when test="@nota=4">
                      <tr>
                        <td style="background-color:orange"><xsl:value-of select="text()"/></td>
                        <td style="background-color:orange"><xsl:value-of select="@nota"/></td>
                      </tr>
                    </xsl:when>
                    <xsl:when test="@nota=3">
                      <tr>
                        <td style="background-color:green"><xsl:value-of select="text()"/></td>
                        <td style="background-color:green"><xsl:value-of select="@nota"/></td>
                      </tr>
                    </xsl:when>
                    <xsl:when test="@nota=2">
                      <tr>
                        <td style="background-color:lightblue"><xsl:value-of select="text()"/></td>
                        <td style="background-color:lightblue"><xsl:value-of select="@nota"/></td>
                      </tr>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <td style="background-color:yellow"><xsl:value-of select="text()"/></td>
                        <td style="background-color:yellow"><xsl:value-of select="@nota"/></td>
                      </tr>
                    </xsl:otherwise>
                    </xsl:choose> 
                     </xsl:for-each> 
                      </table>
              
              <h1>6. Crear una tabla que muestre todos los datos de los ciclos formativos de grado superior
                        con diferente color de fondo según el año del decreto.</h1>
                        
                        <table style="border:1px solid lightblue">
                        <tr>
                        <th>Nombre</th>
                        <th>Grado</th>
                        <th>Año</th>
                        </tr>
                        <xsl:for-each select="//ciclo[grado='Superior']">
                       
                        <xsl:choose>
                        <xsl:when test="decretoTitulo/@año=2009">
                          <tr>
                            <td style="background-color:orange"><xsl:value-of select="nombre"/></td>
                            <td style="background-color:orange"><xsl:value-of select="grado"/></td>
                            <td style="background-color:orange"><xsl:value-of select="decretoTitulo/@año"/></td>
                          </tr>
                        </xsl:when>
                        
                         <xsl:when test="decretoTitulo/@año=2010">
                          <tr>
                            <td style="background-color:lightblue"><xsl:value-of select="nombre"/></td>
                            <td style="background-color:lightblue"><xsl:value-of select="grado"/></td>
                            <td style="background-color:lightblue"><xsl:value-of select="decretoTitulo/@año"/></td>
                          </tr>
                        </xsl:when>
                        </xsl:choose>
                        </xsl:for-each>
                        </table>
              <h1>Crear una transformación que muestre diferentes tablas con los nombres de los
                          alumnos según la nota obtenida por estos, es decir, una tabla para todos los alumnos
                          con un 1, otra tabla para los alumnos que han sacado un 2, otra para los que tengan un
                          3, etc…</h1>
                            <table>
                            <tr>
                                    <th>Nombre</th>
                                    <th>Nota</th>
                                  </tr>
                          <xsl:for-each select="//alumno">
                          <xsl:sort select="@nota" data-type="number"/>
                            <xsl:choose>
                              <xsl:when test="@nota=1">
                                <table>
                                
                                  <tr>
                                    <td style="background-color:lightblue"><xsl:value-of select="text()"/></td>
                                    <td style="background-color:lightblue"><xsl:value-of select="@nota"/></td>
                                  </tr>
                                </table>
                              </xsl:when>
                              
                               <xsl:when test="@nota=2">
                                <table>
                                 
                                  <tr>
                                    <td style="background-color:orange"><xsl:value-of select="text()"/></td>
                                    <td style="background-color:orange"><xsl:value-of select="@nota"/></td>
                                  </tr>
                                </table>
                              </xsl:when>
                              
                               <xsl:when test="@nota=3">
                                <table>
                                
                                  <tr>
                                    <td style="background-color:green"><xsl:value-of select="text()"/></td>
                                    <td style="background-color:green"><xsl:value-of select="@nota"/></td>
                                  </tr>
                                </table>
                              </xsl:when>
                              
                               <xsl:when test="@nota=4">
                                <table>
                                  <tr>
                                    <th>Nombre</th>
                                    <th>Nota</th>
                                  </tr>
                                  <tr>
                                    <td style="background-color:yellow"><xsl:value-of select="text()"/></td>
                                    <td style="background-color:yellow"><xsl:value-of select="@nota"/></td>
                                  </tr>
                                </table>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                          </table>
  </body> 
  </html>
  </xsl:template>
</xsl:stylesheet>
