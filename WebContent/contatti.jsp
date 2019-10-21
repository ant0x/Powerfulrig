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
	<title>TL - Contatti</title>
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

		<!-- Contact page -->
	<section class="contact-page">
		<div class="container">
			<div class="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.859379930551!2d13.914495715656189!3d40.74311964364766!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133b6aa7a6e5a78d%3A0x8b84caa5bfc53712!2sVia+Cretaio%2C+80074+Casamicciola+Terme+NA!5e0!3m2!1sit!2sit!4v1557677955819!5m2!1sit!2sit" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe></div>
			<div class="row">
				<div class="col-lg-7 order-2 order-lg-1">
					<form class="contact-form">
						<input type="text" placeholder="Nome">
						<input type="text" placeholder="e-Mail">
						<input type="text" placeholder="Oggetto">
						<textarea placeholder="Messaggio"></textarea>
						<input type="button" id="contact-form-button" value="INVIA MESSAGGIO">
					</form>
				</div>
				<div class="col-lg-5 order-1 order-lg-2 contact-text text-white">
					<h3>Contattaci</h3>
					<p>Per qualsiasi problematica riguardante il sito, ordini, acquisti o se solo volete dei consigli sulla vostra configurazione gaming/maning o semplicemente volete sapere un parere di un esperto, siamo disponibili dalle 9:00 del mattino fino alle 20:00 di sera, dal lunedì al venerdì, per fornire supporto a chiunque dei nostri clienti. Non esitate a contattarci in qualsimodo voi preferite da quelli sotto elencati.</p>
					<div class="cont-info">
						<div class="ci-icon"><i class="glyphicon glyphicon-home"> </i></div>
						<div class="ci-text">Via Cretaio, no 28, Ischia</div>
					</div>
					<div class="cont-info">
						<div class="ci-icon"><i class="glyphicon glyphicon-earphone"> </i></div>
						<div class="ci-text">+39 089 825355</div>
					</div>
					<div class="cont-info">
						<div class="ci-icon"><i class="fa fa-facebook"> </i></div>
						<div class="ci-text">Facebook</div>
					</div>
					<div class="cont-info">
						<div class="ci-icon"><i class="fa fa-twitter"> </i></div>
						<div class="ci-text">Twitter</div>
					</div>
					<div class="cont-info">
						<div class="ci-icon"><i class="glyphicon glyphicon-envelope envelope"> </i></div>
						<div class="ci-text">teklord@info.it</div>
=======
	<title>PR - Contatti</title>
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

		<!-- Contact page -->
	<section class="contact-page">
		<div class="container">
			<div class="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3021.6112000806993!2d14.798984315406761!3d40.7705753793256!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc507a5514a11%3A0x8115118a3c081d2a!2sVia%20della%20Rimembranza%2C%2084084%20Fisciano%20SA!5e0!3m2!1sit!2sit!4v1571599475349!5m2!1sit!2sit" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
			<div class="row">
				<div class="col-lg-7 order-2 order-lg-1">
					<form class="contact-form">
						<input type="text" placeholder="Nome">
						<input type="text" placeholder="e-Mail">
						<input type="text" placeholder="Oggetto">
						<textarea placeholder="Messaggio"></textarea>
						<input type="button" id="contact-form-button" value="INVIA MESSAGGIO">
					</form>
				</div>
				<div class="col-lg-5 order-1 order-lg-2 contact-text text-white">
					<h3>Contattaci</h3>
					<p>Per qualsiasi problematica riguardante il sito, ordini, acquisti o se solo volete dei consigli sulla vostra configurazione gaming/maning o semplicemente volete sapere un parere di un esperto, siamo disponibili dalle 9:00 del mattino fino alle 20:00 di sera, dal lunedì al venerdì, per fornire supporto a chiunque dei nostri clienti. Non esitate a contattarci in qualsimodo voi preferite da quelli sotto elencati.</p>
					<div class="cont-info">
						<div class="ci-icon"><i class="glyphicon glyphicon-home"> </i></div>
						<div class="ci-text">Via della Rimembranza, n° 28, Fisciano</div>
					</div>
					<div class="cont-info">
						<div class="ci-icon"><i class="glyphicon glyphicon-earphone"> </i></div>
						<div class="ci-text">+39 089 825355</div>
					</div>
					<div class="cont-info">
						<div class="ci-icon"><i class="fa fa-facebook"> </i></div>
						<div class="ci-text">Facebook</div>
					</div>
					<div class="cont-info">
						<div class="ci-icon"><i class="fa fa-twitter"> </i></div>
						<div class="ci-text">Twitter</div>
					</div>
					<div class="cont-info">
						<div class="ci-icon"><i class="glyphicon glyphicon-envelope envelope"> </i></div>
						<div class="ci-text">PowerfulRig@info.it</div>
>>>>>>> branch 'master' of https://github.com/ant0x/Powerfulrig.git
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact page end-->
	
	<!-- Footer section -->
		<%@ include file="fragment/footer.jsp" %>
	<!-- Footer section end -->
	
	
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>
	
</body>
</html>