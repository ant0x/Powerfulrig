<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import = "java.sql.*"
   	import = "javax.servlet.*"
   	import = "javax.servlet.http.*"
	import = "java.io.*"
	import = "java.util.*"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<title>PowerfulRig e-Shop</title>
	<meta name="description" content="EndGam Gaming Magazine Template">
	<meta name="keywords" content="endGam,gGaming, magazine, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	
	<!-- Header section start -->
	 <%@ include file="fragment/header3.jsp" %>
	
	<!-- Header section end -->
	
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

	<script>
	if($){inserimento=='true'}{
		alert("Prodotto inserito correttamente");
	}
	if($){errore_inserimento=='true'}{
		alert("Errore durante l'inserimento del prodotto");
	}
	</script>
	
	<script>
				function showEsito() {
					document.getElementById('esito').innerHTML= 'okokok';
				}
</script>
	
</head>

<body>

	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	
	
	<section class="insform-pages">
		<div class="container">
			<div class="row justify-content-center">
				<h1>Inserisci Prodotto</h1>
			</div>
		</div>
		<div class="container border-insformpage">
			<form name="insertForm" id="insertproduct" method = "post" action = "InsertProduct">
				<div class="row form-group">
					<label for="type_prod" class="4 form-label">Tipo</label>
					<div class="col-md-8">
						<select name = "type_prod" class="arrows" onchange = "sendInfo()" style="background-color:#001a1a">
						<!--  Gli attribbuti "value" sono i  prefissi delle tabelle nel DB -->
							<option class="singleOption" value="searchCategory" disabled selected hidden>Seleziona Categoria</option>
							<option class="singleOption" value="Cpu">CPU</option>
							<option class="singleOption" value="heatsink">Dissipatori</option>
							<option class="singleOption" value="Gpu">Schede Video</option>
							<option class="singleOption" value="motherboard">Schede Madre</option>
							<option class="singleOption" value="ram">RAM</option>
							<option class="singleOption" value="storage">Archiviazione</option>
							<option class="singleOption" value="Psu">Alimentatore</option>
							<option class="singleOption" value="Case">Case</option>
							<option class="singleOption" value="Monitor">Monitor</option>
							<option class="singleOption" value="keyboard">Tastiere</option>
							<option class="singleOption" value="mouse">Mouse</option>
							<option class="singleOption" value="headphones">Cuffie</option>
							<option class="singleOption" value="Sedia">Sedie Gaming</option>
						</select>
					</div>
				</div>
				<div class="row form-group">
					<label for="model_prod" class="4 form-label">Modello</label>
					<div class="col-md-8">
						<input type="text" class="form-input" name="model_prod" placeholder="Modello Prodotto">
					</div>
				</div>
				<div class="row form-group">
					<label for="brand_prod" class="4 form-label">Brand</label>
					<div class="col-md-8">
						<input type="text" class="form-input" name="brand_prod" placeholder="Brand Prodotto">
					</div>
				</div>
				<div class="row form-group">
					<label for="name_prod" class="4 form-label">Nome</label>
					<div class="col-md-8">
						<input type="text" class="form-input" name="name_prod" placeholder="Nome Prodotto">
					</div>
				</div>
				<div class="row form-group">
					<label for="description_prod" class="4 form-label">Descrizione</label>
					<div class="col-md-8">
						<textarea rows="5" class="form-input" name="description_prod" placeholder="Descrizione Prodotto"></textarea>
					</div>
				</div>
				<div class="row form-group">
					<label for="price_prod" class="4 form-label">Prezzo</label>
					<div class="col-md-8">
						<input type="text" class="form-input" name="price_prod" placeholder="Prezzo Prodotto">
					</div>
				</div>
				<div class="row form-group">
					<label for="discount_prod" class="4 form-label">% Prodotto in Sconto</label>
					<div class="col-md-8">
						<input type="text" class="form-input" name="discount_prod" placeholder="% Prodotto in Sconto">
					</div>
				</div>
				<div class="row form-group">
					<label for="specifiche_prod" class="4 form-label">Specifiche Prodotto</label>
					<div class="col-md-8">
						<input type="text" class="form-input" name="specifiche_prod" placeholder="Specifiche Prodotto">
					</div>
				</div>
				<div class="row form-group">
					<label for="watt_prod" class="4 form-label">WattHr</label>
					<div class="col-md-8">
						<input type="text" class="form-input" name="watt_prod" placeholder="500W">
					</div>
				</div>
				<div class="row form-group">
					<label for="qnt_prod" class="4 form-label">Quantità Prodotto</label>
					<div class="col-md-8">
						<input type="text" class="form-input" name="qnt_prod" placeholder="Quantità  Prodotto">
					</div>
				</div>
				<div class="row form-group">
					<label for="img_folder_path" class="4 form-label">Path Folder Immagini</label>
					<div class="col-md-8">
						<input type="text" class="form-input" name="img_folder_path" placeholder="Path Folder Prodotto">
					</div>
				</div>
					<!-- Qui verranno generati i campi di input per le singole componenti -->
					<div id = "generated-inputs">
					</div>
				<div class="row justify-content-center">
					<input type="submit" class="form-button" value="Invia" id="subm1t">
					<input type="reset" class="form-button" value="Reset">
				</div>
				
			</form>
		</div>
	</section>

	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>



</body>

</html>
