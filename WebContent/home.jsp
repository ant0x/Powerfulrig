


<%@page 
	language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>Powerfulrig</title>
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
	<!--  <link rel="stylesheet" href="css/font-awesome.min.css"/> -->
	
</head>

<body>

	<!-- Page Preloder xd-->
	<div id="preloder">
		<div class="loader"></div>
	</div>



	<!-- Main section -->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="9000">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>	
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/gamingwp.jpg" alt="Second slide">
				<div class="carousel-caption d-none d-md-block">
					<h2>Powerfulrig</h2>
					<p><br>TODO<br>TODO<br><br><br></p>
					<a href="catalogo.html" class="site-btn">Vai ai Prodotti</a>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/intelxd.png" alt="First slide" style="width: 4000px; height: 675px;">
				<div class="carousel-caption d-none d-md-block">
					<h2></h2>
					<p><br><br> <br><br><br></p>
					<a href="Product?action=prodotto&type_prod=cpu_comp&model_prod=i9-9980XE" class="site-btn">Vai al Prodotto</a>
				</div>
			</div>
			<div class="carousel-item">
				<video poster="http://cwsmgmt.corsair.com/responsive/videos/vengeance-rgb-pro-header.mp4" autoplay muted loop preload style="width: 100%;">
					<source src="//cwsmgmt.corsair.com/responsive/videos/vengeance-rgb-pro-header.mp4"></source>
				</video>
				<div class="carousel-caption d-none d-md-block">
					<a href="Product?action=prodotto&type_prod=ram_comp&model_prod=LPX" class="site-btn">Vai al Prodotto</a>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/2080ti2.jpg" alt="Second slide" style="width: 4000px; height: 675px;">
				<div class="carousel-caption d-none d-md-block">
					<h2></h2>
					<p><br><br><br><br><br></p>
					<a href="Product?action=prodotto&type_prod=gpu_comp&model_prod=RTX%202080Ti" class="site-btn">Vai al Prodotto</a>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- Main section END -->
	
	<section class="catalogo-section">
		<div class="container">
			<div class="row searchBarFiltered">
				<div class="row">
					<form action="Cerca" method="POST">
						<div class="searchBarElement col-xl-4">
							<span id="iconSearchSend" class="leftButton"><i class="fa fa-search" aria-hidden="true"> </i></span>
							<input class="input-large2" id="inputSearch" name="cerca" type="text" placeholder="Ricerca per nome..." onclick="closeOutside()">
						</div>
						<div class="searchBarElement col-xl-3 ">
							<div class="dropdown show">
							<a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false"> Seleziona Brand</a>
								<div class="dropdown-menu" style="margin-left:15px" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item" href="Product?action=brands&brand=MSI">MSI</a>
									<a class="dropdown-item" href="Product?action=brands&brand=Corsair">Corsair</a>
									<a class="dropdown-item" href="Product?action=brands&brand=NZXT">NZXT</a>
									<a class="dropdown-item" href="Product?action=brands&brand=WOLTU">WOLTU</a>
									<a class="dropdown-item" href="Product?action=brands&brand=Sparco">Sparco</a>
									<a class="dropdown-item" href="Product?action=brands&brand=Intel">Intel</a>
									<a class="dropdown-item" href="Product?action=brands&brand=Nvidia">Nvidia</a>
									<a class="dropdown-item" href="Product?action=brands&brand=Diablo">Diablo</a>
									<a class="dropdown-item" href="Product?action=brands&brand=Gigabyte">Gigabyte</a>
									<a class="dropdown-item" href="Product?action=brands&brand=HyperX">HyperX</a>
									<a class="dropdown-item" href="Product?action=brands&brand=Logitech">Logitech</a>
									<a class="dropdown-item" href="Product?action=brands&brand=DeepCool">DeepCool</a>
									<a class="dropdown-item" href="Product?action=brands&brand=AOC">AOC</a>
									<a class="dropdown-item" href="Product?action=brands&brand=Asus">Asus</a>
									<a class="dropdown-item" href="Product?action=brands&brand=ITEK">ITEK</a>
									<a class="dropdown-item" href="Product?action=brands&brand=TOSHIBA">TOSHIBA</a>
									<a class="dropdown-item" href="Product?action=brands&brand=KINGSTON">KINGSTON</a>
									<a class="dropdown-item" href="Product?action=brands&brand=Samsung">Samsung</a>
									<a class="dropdown-item" href="Product?action=brands&brand=CoolerMaster">CoolerMaster</a>
									<a class="dropdown-item" href="Product?action=brands&brand=Razer">Razer</a>
									
								</div>
							</div>
						</div>
						<div class="searchBarElement col-xl-3">
							<div class="dropdown show">
							<a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false"> Seleziona Categoria</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item" href="Product?action=cpu_comp&comp_name=Processori">Processori</a>
									<a class="dropdown-item" href="Product?action=gpu_comp&comp_name=Schede Grafiche">Schede Grafiche</a>
									<a class="dropdown-item" href="Product?action=ram_comp&comp_name=RAM">RAM</a>
									<a class="dropdown-item" href="Product?action=storage_comp&comp_name=Archiviazione">Archiviazione</a>
									<a class="dropdown-item" href="Product?action=powersupply_comp&comp_name=Alimentatori">Alimentatori</a>
									<a class="dropdown-item" href="Product?action=motherboard_comp&comp_name=Schede Madre">Schede Madre</a>							
									<a class="dropdown-item" href="Product?action=heatsink_comp&comp_name=Dissipatori">Dissipatori</a>
									<a class="dropdown-item" href="Product?action=case_comp&comp_name=Case">Case</a>
									<a class="dropdown-item" href="Product?action=monitor_comp&comp_name=Monitor">Monitor</a>
									<a class="dropdown-item" href="Product?action=keyboard_comp&comp_name=Tastiere">Tastiere</a>
									<a class="dropdown-item" href="Product?action=mouse_comp&comp_name=Mouse">Mouse</a>
									<a class="dropdown-item" href="Product?action=headphones_comp&comp_name=Cuffie">Cuffie</a>
									<a class="dropdown-item" href="Product?action=chair_comp&comp_name=Sedie Gaming">Sedie Gaming</a>
								</div>
							</div>	
						</div>
						<div class="searchBarElement col-xl-1">
							<input type="submit" class="site-btn2" value="CERCA">
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="headerCatalogo col-xl-5">
					<p>PRODOTTI IN VETRINA</p>
				</div>
				<div class="headerCatalogo col-xl-7">
					<hr>
				</div>
			</div>
		
		
		



	<!--====== Javascripts & Jquery ======-->
	<script>
	
		function closeOutside() {
			$('.input-large2').css("border-bottom", "1px solid blue");
		}
		
		$('.objectItem img').on({
		    mouseenter: function(){
		        $(this).animate({width: '200px', height: '200px', top: '-=15px', left: '-=15px'}, 500);
		    },
		    mouseleave: function(){
		        $(this).animate({width: '150px', height: '150px', top: '+=15px', left: '+=15px'}, 500);
		    }
		});
		
		$(document).mouseup(function(e) {
		var container = $(".inputSearch");
			
		// if the target of the click isn't the container
		if (!container.is(e.target)) 
		{
			$('.input-large2').css("border-bottom", "1px solid grey");
		}
		else
		{
			$('.input-large2').css("border-bottom", "1px solid blue");
		}
		});
	
	</script>
	
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>
			 
</body>

</html>
