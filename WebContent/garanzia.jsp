<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
		import="com.Powerfulrig.Bean.*"
    	import="java.util.*"
%>
    	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<title>TL - Garanzia</title>
	<meta name="description" content="EndGam Gaming Magazine Template">
	<meta name="keywords" content="endGam,gGaming, magazine, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Icona -->
	<link href="img/icona.ico" rel="shortcut icon"/>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

	<!-- JQUERY 3.4.1 -->
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	    
	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	
</head>

<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	
	<!-- Header section start -->
    	<%@ include file="fragment/header.jsp" %>
	<!-- Header section end -->
	
	<!-- MAIN SECTION Garanzia-->

	<section class="grcnd-section">
		<div class="container">
			<div class="row justify-content-center">
					<h1>GARANZIE</h1>
			</div>
		</div>
		<div class="container border-grcndPage">
			<div class="row" id="spacergrcnd">
				<h7>GARANZIA DI 2 ANNI SUI PC PowerfulRig Corporation</h7>
				<p id="grcndP">Tutti i pc PowerfulRig Corporation sono garantiti 2 anni. La garanzia copre solo i guasti di tipo hardware, quindi problemi dei componenti interni del pc. Problemi riconducibili al software installato (Microsoft Windows, driver, programmi o software di terze parti) o legati all'infezione di sistema da parte di virus e malware, non sono coperti da garanzia.</p>
			</div>
			<div class="row" id="spacergrcnd">
				<h7>MODALITÀ DI GESTIONE DEI PRODOTTI IN GARANZIA</h7>
				<p id="grcndP">Per ottenere assistenza sui prodotti in garanzia, i clienti dovranno scrivere una mail ad PowerfulRig@mail.it specificando il numero d'ordine o allegando la prova d'acquisto del prodotto. E' necessario anche scrivere nel dettaglio il problema. I nostri tecnici ricontatteranno i clienti e, in caso di conferma del guasto, sarà necessario spedire il prodotto presso i nostri laboratori. Verrà inviato anche un modulo da compilare e includere nel pacco. Qualora il problema sia effettivamente coperto da garanzia, i nostri tecnici procederanno con la riparazione oppure la sostituzione se necessario. Per più dettagli circa le condizioni di riparazione e reso, rimandiamo al punto 6.0 delle <a href="#">Condizioni Generali</a>.</p>
			</div>
		</div>
	</section>
	
	<!-- END SECTION -->
	
	<!-- Footer section -->
		<%@ include file="fragment/footer.jsp" %>
	<!-- Footer section end -->
	
	
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>
	
</body>
</html>