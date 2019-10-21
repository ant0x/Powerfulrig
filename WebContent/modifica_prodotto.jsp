<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import = "java.sql.*"
   	import = "javax.servlet.*"
   	import = "javax.servlet.http.*"
	import = "java.io.*"
	import = "java.util.*"
	import = "com.Powerfulrig.Bean.*"
%>

<%
	Prodotto bean = (Prodotto) request.getAttribute("product");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<<<<<<< HEAD
	<title>TechLord e-Shop</title>
=======
	<title>PowerfulRig e-Shop</title>
>>>>>>> branch 'master' of https://github.com/ant0x/Powerfulrig.git
	<meta name="description" content="EndGam Gaming Magazine Template">
	<meta name="keywords" content="endGam,gGaming, magazine, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<!-- Icona -->
	<link href="img/icona.ico" rel="shortcut icon"/>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

	<!-- JQUERY 3.4.1 -->
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

	<script>
		jQuery.extend(jQuery.validator.messages, {
			required: "Questo campo è richiesto",
			remote: "C'è un errore in questo campo, controllare.",
			name: "Inserire un valore adatto per il nome.",
			email: "Inserire un indirizzo email valido.",
			url: "Inserire un indirizzo URL valido.",
			date: "Inserire una data valida.",
			dateISO: "Digitare una data valida (ISO).",
			number: "Digitare un numero valido.",
			digits: "Digitare solo caratteri numerici.",
			creditcard: "Digitare un numero valido di carta di credito.",
			equalTo: "I campi password non corrispondono, controllare.",
			accept: "Digitare un valore con una valida estensione.",
			maxlength: $.validator.format("Digitare al massimo {0} caratteri."),
			minlength: $.validator.format("Digitare almeno {0} caratteri."),
			rangelength: $.validator.format("Inserire un valore compreso tra gli {0} ed i {1} caratteri."),
			range: $.validator.format("Digitare un valore compreso tra {0} e {1}."),
			max: $.validator.format("Inserire un valore minore o uguale di {0}."),
			min: $.validator.format("Inserire un valore maggiore o uguale di {0}.")
		});

			$(document).ready(function(){
			$('#insertproduct').validate({
			rules: {			  
				type_prod: {
					minlength: 	1,
					maxlength:  10,
					required: 	true,
				},
				model_prod: {
					required:	true,
					minlenght:   1,
					maxlenght:	10,
					range: 		[1, 99999],
				},
				brand_prod: {
					required: 	true,
					minlenght:	1,
					maxlenght: 	20,
				},
				name_prod: {
					minlenght:  1,
					maxlenght:	30,
					required: 	true,
				},
				year_prod: {
					minlenght:	4,
					maxlenght:	4,
					number:		true,
					range:		[1970-2300],
					required: 	true,
				},
				description_prod: {
					minlenght:	1,
					maxlenght:	500,
					required: 	true,
				},
				price_prod: {
					minlenght:	1,
					maxlenght:	8,
					required:	true,
					range: 		[0-80000],
					number:		true,
				},
				discount_prod: {
					minlenght: 	1,
					maxlenght: 	99,
					required:	true,
					number: 	true,
				},
				discounted_price_prod: {
					minlenght:	1,
					maxlenght: 	8,
					required: 	true,
					range: 		[0-80000],
					number: 	true,
				},
				family_prod: {
					minlenght: 	1,
					maxlength: 	1,
					required: 	true,
					range: 		[0-4],
					number: 	true,
				},
				qnt_prod: {
					minlengt: 	1,
					maxlength: 	3,
					required: 	true,
					range: 		[0-999],
					number: 	true,
				},
				img_folder_path: {
					required: true,
					url: true,
				}
			},
				highlight: function(element) {
					$(element).closest('.control-group').removeClass('success').addClass('error');
				},
				success: function(element) {
					element.text('OK!').addClass('valid').closest('.control-group').removeClass('error').addClass('success');
				}
			});
		}); // end document.ready
	
	</script>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section start -->
	<header class="sezioneHeader2 bg-visible">
		<div class="container-fluid au-reg-background">
			<div class="row">
				<div class="header-left col-xl-3">
					<div class="row">
						<a href="home.html" class="site-logo">
							<img src="./img/logotech.png" alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<!-- Header section end -->
	
	<section class="insform-pages">
		<div class="container">
			<div class="row justify-content-center">
				<h1>Modifica Prodotto</h1>
			</div>
		</div>
		<div class="container border-insformpage">
			<form name="modifyForm" id="modifyproduct" method = "get" action = "ModifyProduct">
				<div class="row form-group">
					<label for="type_prod" class="4 form-label">Tipo</label>
					<div class="col-xl-8">
						<input type="text" class="form-input" name="type_prod"  value="<%=bean.getTipo()%>"  readonly>
					</div>
				</div>
				<div class="row form-group">
					<label for="model_prod" class="4 form-label">Modello</label>
					<div class="col-xl-8">
						<input type="text" class="form-input" name="model_prod" value="<%=bean.getModello()%>">
					</div>
				</div>
				<div class="row form-group">
					<label for="brand_prod" class="4 form-label">Brand</label>
					<div class="col-xl-8">
						<input type="text" class="form-input" value="<%=bean.getMarca()%>" name="brand_prod">
					</div>
				</div>
				<div class="row form-group">
					<label for="name_prod" class="4 form-label">Nome</label>
					<div class="col-xl-8">
						<input type="text" class="form-input" value="<%=bean.getNome()%>" name="name_prod">
					</div>
				</div>
				<div class="row form-group">
					<label for="description_prod" class="4 form-label">Descrizione</label>
					<div class="col-xl-8">
						<textarea rows="5" class="form-input" name="description_prod"><%=bean.getDescrizione()%></textarea>
					</div>
				</div>
				<div class="row form-group">
					<label for="price_prod" class="4 form-label">Prezzo</label>
					<div class="col-xl-8">
						<input type="text" class="form-input" value="<%=bean.getPrezzo()%>" name="price_prod">
					</div>
				</div>
				<div class="row form-group">
					<label for="discount_prod" class="4 form-label">% Prodotto in Sconto</label>
					<div class="col-xl-8">
						<input type="text" class="form-input" value="<%=bean.getPercentualeSconto()%>" name="discount_prod">
					</div>
				</div>
				<div class="row form-group">
					<label for="family_prod" class="4 form-label">Informazioni Prodotto</label>
				<div class="row form-group">
					<label for="qnt_prod" class="4 form-label">Quantità Prodotto</label>
					<div class="col-xl-8">
						<input type="text" class="form-input" value="<%=bean.getQuantita()%>" name="qnt_prod">
					</div>
				</div>
				<div class="row form-group">
					<label for="img_folder_path" class="4 form-label">Path Folder Immagini</label>
					<div class="col-xl-8">
						<input type="text" class="form-input" value="<%=bean.getImmagine()%>" name="img_folder_path" >
					</div>
				</div>			
					<!-- <a href="Product?action=modify_product&type_prod=<%=bean.getTipo()%>&model_prod=<%=bean.getModello()%>&Brand_prod=<%=bean.getMarca()%>&name_prod=<%=bean.getNome()%>&year_prod=<%=bean.getYear_prod()%>&description_prod=<%=bean.getDescrizione()%>&price_prod=<%=bean.getPrezzo()%>&discount_prod=<%=bean.getPercentualeSconto()%>&discounted_price_prod=<%=bean.getDiscounted_price_prod()%>&family_prod=<%=bean.getFamily_prod()%>&qnt_prod=<%=bean.getQuantita()%>&img_folder_path=<%=bean.getImmagine()%>"><input type="button" class="form-button" value="Modifica"></a>			
					 -->
					<div class="row justify-content-center">
					<input type="submit" class="form-button" value="Modifica">				
					</div>
				</form>
			</div>
				
				
			
		</div>
	</section>

	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>
