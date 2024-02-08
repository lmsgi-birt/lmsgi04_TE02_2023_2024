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
		
		<section class="carreras">
			<h1>Carreras hasta 15 km</h1>
      		<!-- Seleccionamos las carreras de distancia menor o igual a 15 
				De este modo, no necesitamos usar if -->
			<xsl:for-each select="carrera[kilometros&lt;=15]">
				<article>
				<!-- Usamos las {} para combinar codigo HTML y XSLT -->
					<a href="{informacion}">
						<img src="../img/{img}" alt="{nombre}" />
						<p class="texto"><xsl:value-of select='nombre' /> </p>
					</a>
				</article>
			</xsl:for-each>
		</section>
		
		<section class="carreras">
			<h1>Carreras de más de 15 km</h1>
			<xsl:for-each select="carrera[kilometros&gt;15]">
				<article>
					<a href="{informacion}">
						<img src="../img/{img}" alt="{nombre}" />
						<p class="texto"><xsl:value-of select='nombre' /> </p>
					</a>
				</article>
			</xsl:for-each>
		</section>
		
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>		
</xsl:stylesheet>