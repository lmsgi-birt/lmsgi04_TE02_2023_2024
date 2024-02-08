<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<xsl:template match='/eventos'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Club de montaña" />
			<a href="asamblea.xml">Asamblea</a>
			<a href="excursiones.xml">Excursiones</a>
			<a href="carreras.xml">Carreras</a>
			<a href="noticias.xml">Noticias</a>
			<a href="contacto.xml">Contacto</a>
		</header>
		
		<main class="principal">
			<section class="asamblea">
        		<!-- Seleccionamos las asambleas -->
				<xsl:for-each select="asamblea">
        
        		<!-- Las ordenamos por fecha de más reciente a menos 
					 También se podría ordenar al revés y elegir la última con last() -->
				<xsl:sort select="convocatoria/fecha" order="descending" />
        		<xsl:variable name="fc" select="convocatoria/fecha"/>
          			<!-- Seleccionamos solo la primera -->
					<xsl:if test="position()=1">
						<h1>ASAMBLEA</h1>
						<p>El <xsl:value-of select='$fc' /> celebraremos una asamblea <xsl:value-of select='convocatoria/@tipo' />.</p>
						<p>Los temas a tratar serán:</p>
						<ol>
              				<!-- Seleccionamos y mostramos los temas. La expresión es relativa al otro for-each -->
							<xsl:for-each select="orden_dia/tema">
								<li><xsl:value-of select='.' /></li>
							</xsl:for-each>
						</ol>
						<p>Te esperamos</p>
					</xsl:if>
				</xsl:for-each>
			</section>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>