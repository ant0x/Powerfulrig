<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
		import="com.Powerfulrig.Bean.*"
    	import="java.util.*"
%>
    	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<<<<<<< HEAD
	<title>TL - Cookies</title>
=======
	<title>PR - Cookies</title>
>>>>>>> branch 'master' of https://github.com/ant0x/Powerfulrig.git
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
	
	<!-- MAIN SECTION Cookies-->

	<section class="grcnd-section">
		<div class="container">
			<div class="row justify-content-center">
					<h1>INFORMAZIONI SUI COOKIES</h1>
			</div>
		</div>
		<div class="container border-grcndPage">
			<div class="row" id="spacergrcnd">
				<h7>Che cosa è un Cookie?</h7>
				<p id="grcndP">Che cosa è un cookie? Un cookie è un piccolo file di testo che viene memorizzato dal computer nel momento in cui un sito web viene visitato da un utente. Il testo memorizza informazioni che il sito è in grado di leggere nel momento in cui viene consultato in un secondo momento. Alcuni di questi cookies sono necessari al corretto funzionamento del sito, altri sono invece utili al visitatore perché in grado di memorizzare in modo sicuro ad esempio il nome utente o le impostazioni di lingua. Il vantaggio di avere dei cookies installati nel proprio pc è quello di non aver più bisogno di compilare le stesse informazioni ogni qualvolta si voglia accedere ad un sito visitato in precedenza.</p>
			</div>
			<div class="row" id="spacergrcnd">
				<h7>Perchè utilizziamo i Cookies?</h7>
				<p id="grcndP">Questo sito utilizza i cookies al fine di fornire ai propri clienti un&#180; esperienza di acquisto modellata il più possibile intorno ai suoi gusti e preferenze. Tramite i cookies si fa in modo che ad ogni visita sul sito non si debbano ricevere o inserire le stesse informazioni. I cookies vengono utilizzati anche al fine di ottimizzare le prestazioni del sito web: essi infatti rendono più facile sia il procedimento finale di acquisto che la ricerca veloce di elementi e prodotti specifici all'interno del sito. Al fine di proteggere i propri dati personali da possibili perdite e da qualsiasi forma di trattamento illecito l'azienda ha preso opportune misure tecniche ed organizzative. <br>
						Per ulteriori informazioni si prega di consultare la nostra <a href="privacy.jsp">Informativa sulla privacy</a>.</p>
			</div>
			<div class="row" id="spacergrcnd">
				<h7>Come posso disattivare i Cookies?</h7>
				<p id="grcndP">È possibile modificare il browser per disattivare i cookies tramite una procedura molto semplice. Attenzione: disattivando i cookies sia nome utente che password non saranno più memorizzati sul box di login del sito.</p>
			</div>
		</div>

	<!-- END SECTION -->


	<!-- Footer section -->
		<%@ include file="fragment/footer.jsp" %>
	<!-- Footer section end -->
	
	
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>
	
</body>
</html>