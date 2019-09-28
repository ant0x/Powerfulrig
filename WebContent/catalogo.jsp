<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
		import="com.Powerfulrig.Bean.*"
    	import="java.util.*"
%>
    	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<title>TL - Catalogo</title>
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
	
	<!-- Catologo section -->

	<section class="cataPage-section">
		<div class="container">
			<div class="row justify-content-center">
					<h1>CATALOGO</h1>
			</div>
		</div>
		<div class="container border-cataPage">
			<div class="row">
				<div class="col-xl-4">
					<a href="Product?action=cpu_comp&comp_name=Processori"><img src="img/categorie/cpu.jpg" width="300" height="300" class="imgItem4"></a>	
				</div>
				<div class="col-xl-4">
					<a href="Product?action=gpu_comp&comp_name=Schede Grafiche"><img src="img/categorie/schedevideo.jpg" width="300" height="300" class="imgItem4"></a>
				</div>
				<div class="col-xl-4">
					<a href="Product?action=ram_comp&comp_name=RAM"><img src="img/categorie/ram.jpg" width="300" height="300" class="imgItem4"></a>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4">
					<a href="Product?action=storage_comp&comp_name=Archiviazione"><img src="img/categorie/archiviazione.jpg" width="300" height="300" class="imgItem4"></a>	
				</div>
				<div class="col-xl-4">
					<a href="Product?action=powersupply_comp&comp_name=Alimentatori"><img src="img/categorie/alimentatore.jpg" width="300" height="300" class="imgItem4"></a>
				</div>
				<div class="col-xl-4">
					<a href="Product?action=motherboard_comp&comp_name=Schede Madre"><img src="img/categorie/schedemadre.jpg" width="300" height="300" class="imgItem4"></a>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4">
					<a href="Product?action=heatsink_comp&comp_name=Dissipatori"><img src="img/categorie/dissipatori.jpg" width="300" height="300" class="imgItem4"></a>	
				</div>
				<div class="col-xl-4">
					<a href="Product?action=case_comp&comp_name=Case"><img src="img/categorie/case.jpg" width="300" height="300" class="imgItem4"></a>
				</div>
				<div class="col-xl-4">
					<a href="Product?action=monitor_comp&comp_name=Monitor"><img src="img/categorie/monitor.jpg" width="300" height="300" class="imgItem4"></a>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4">
					<a href="Product?action=keyboard_comp&comp_name=Tastiere"><img src="img/categorie/tastiere.jpg" width="300" height="300" class="imgItem4"></a>	
				</div>
				<div class="col-xl-4">
					<a href="Product?action=mouse_comp&comp_name=Mouse"><img src="img/categorie/mouse.jpg" width="300" height="300" class="imgItem4"></a>
				</div>
				<div class="col-xl-4">
					<a href="Product?action=headphones_comp&comp_name=Cuffie"><img src="img/categorie/cuffie.jpg" width="300" height="300" class="imgItem4"></a>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-xl-4">
					<a href="Product?action=chair_comp&comp_name=Sedie Gaming"><img src="img/categorie/sedie.jpg" width="300" height="300" class="imgItem4"></a>	
				</div>
				<div class="col-xl-4">
					<a href="#"><img src="img/configurationpic2.png" width="300" height="300" class="imgItem4" style="background-color: rgb(217, 217, 217);"></a>	
				</div>
			</div>
		</div>
	</section>
	
	<!-- Catologo section end -->
	
	<!-- Pre-Footer section -->
	     <%@ include file="fragment/pre-footer.jsp" %>
	<!-- Pre-Footer section end -->


	<!-- Footer section -->
		<%@ include file="fragment/footer.jsp" %>
	<!-- Footer section end -->
	
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>