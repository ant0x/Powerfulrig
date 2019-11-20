
<%@page 
	language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Powerfulrig.Bean.*"
    
    import="java.util.*"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>PowerfulRig - Home</title>
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

<!-- Header section start -->
     	  <%@ include file="fragment/header.jsp" %>
	<!-- Header section end -->

	<!-- Page Preloder-->
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
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
		</ol>
		
		<div class="carousel-inner">
			
			
			<div class="carousel-item active">
				<img src="img/gamingwp.jpg" alt="Second slide">
				<div class="carousel-caption">
					<h2>Benvenuto in PowerfulRig</h2>
					<p>Tanti prodotti per<br>configurare PC di ogni tipo</p>
					<a href="catalogo.jsp" class="site-btn">Scopri...</a>
				</div>
			</div>
			<div class="carousel-item">
				<video poster="https://cwsmgmt.corsair.com/pdp/ll-rgb-fans-white/LL_Fans_White_v01.mp4" autoplay muted loop preload style="width: 100%;">
					<source src="https://cwsmgmt.corsair.com/pdp/ll-rgb-fans-white/LL_Fans_White_v01.mp4"></source>
				</video>
				<div class="carousel-caption">
					<h2>Configurazioni Personalizzate</h2>
					<p><br>Configura il tuo PC<br>come meglio preferisci! <br><br><br></p>
					<% if(utenteLoggato != null)
						{%>					
							<a href="configurazioni.jsp" class="site-btn">Inizia ora...</a>
						
					<%	}
						else
						{%>
							<a href="log-area.jsp" class="site-btn">Inizia ora...</a>
						<%}%>
				</div>
			</div>
			<div class="carousel-item">
				<a href="Product?action=prodotto&type_prod=Cpu_comp&model_prod=i9-9980XE"><img src="img/intelxd.jpg" alt="First slide" class="imgsrc"></a>
				<div class="carousel-caption d-none d-md-block">
				</div>
			</div>
			<div class="carousel-item">
				<a href="Product?action=prodotto&type_prod=Case_comp&model_prod=Corsair 780T"><video poster="http://cwsmgmt.corsair.com/responsive/videos/vengeance-rgb-pro-header.mp4" class="imgsrc" autoplay muted loop preload style="width: 100%;">
					<source src="//cwsmgmt.corsair.com/responsive/videos/vengeance-rgb-pro-header.mp4"></source>
				</video></a>
				<div class="carousel-caption d-none d-md-block">
				</div>
			</div>
			<div class="carousel-item">
				<a href="Product?action=prodotto&type_prod=Pc_comp&model_prod=ONE i140"><video poster="http://cwsmgmt.corsair.com/responsive/videos/Corsair_One_i60_Loop_v01.mp4" class="imgsrc" autoplay muted loop preload style="width: 100%;">
					<source src="http://cwsmgmt.corsair.com/responsive/videos/Corsair_One_i60_Loop_v01.mp4"></source>
				</video></a>
				<div class="carousel-caption d-none d-md-block">
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
			 <div class="row">
				<div class="headerCatalogo col-md-12">
					<p>Prodotti in vetrina</p>
				</div>
				</div>
		<div>
		<div>
				<%
			DAOProdotto model_product=new DAOProdotto();
			ArrayList<Prodotto> array = model_product.viewProduct();
           	ArrayList<Prodotto> arrayVetrina = new ArrayList<Prodotto>();						
			int I=0;
			
			if((array!=null || array.size()!=0) && (arrayVetrina!=null || arrayVetrina.size()!=0))
			{
				while(I<array.size())
				{
					Prodotto b = array.get(I);
					if(arrayVetrina.size() < 12)
						arrayVetrina.add(b);
					I++;
				}
			
								
				Iterator<?> it2 = arrayVetrina.iterator();
				while (it2.hasNext()) 
				{
					Prodotto bean = (Prodotto) it2.next();	
			%>
			
			
				<div class="objectItem col-md-3">
					<a href="Product?action=prodotto&type_prod=<%=bean.getTipo()%>&model_prod=<%=bean.getModello()%>"><img src=<%=bean.getImmagine()+"/img1.jpg"%> width="150" height="150" class="imgItem"></a>
					<div class="row justify-content-center">
						<a href="Product?action=prodotto&type_prod=<%=bean.getTipo()%>&model_prod=<%=bean.getModello()%>"><p><b><%=bean.getNome()%></b></p></a>
					</div>
				</div>
			
			
			<% 	}
				} else { %>
					<div class="col-md-12"><h4>Nessun prodotto disponibile</h4></div>
			<% } %>
			</div>
		</div>
			</div>
	</section>
	

		
		
		
<!-- Pre-Footer section -->
	     <%@ include file="fragment/pre-footer.jsp" %>
	<!-- Pre-Footer section end -->

	<!-- Footer section -->
		<%@ include file="fragment/footer.jsp" %>
	<!-- Footer section end -->


	<!--====== Javascripts & Jquery ======-->
	<script>
	
		function closeOutside() {
			$('.input-large2').css("border-bottom", "1px solid blue");
		}
		
		
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
