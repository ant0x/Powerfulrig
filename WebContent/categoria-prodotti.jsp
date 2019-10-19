<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
    	import="com.Powerfulrig.Bean.*"     import="com.Powerfulrig.controller.*"
    	import="com.Powerfulrig.Model.*" 
    	import="java.util.*"
%>

<%
	String action_name = (String) request.getAttribute("action_name");
	String comp_name = (String) request.getAttribute("comp_name");
	String action = (String) request.getAttribute("component");
	String brand = (String) request.getAttribute("brand");
	log("il componente è : "+action);
	log("Comp_name ha valore null la seconda volta : "+comp_name);
	String ricerca = (String) session.getAttribute("ricerca");
	ArrayList<?> array = (ArrayList<?>) session.getAttribute("products");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<title>TL - Categoria Prodotti</title>
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

	<section class="cateProd-section">
		<div class="container">
			<div class="row justify-content-center">
			<% 	if(comp_name!=null) {%>
					<h1><%=comp_name%></h1>
			<% 	} else { 
					if(action_name!=null) {%>
					<h1><%=action_name%></h1>
			<%		} else { if(brand != null) {%>
					<h1><%=brand%></h1>
			<%		} else { %>
					<h1><%=ricerca%></h1>
			<%	} } } %>
			</div>
		</div>
		<div class="container border-cateProd">
			<div class="row">
				<div class="col-xl-10">
					<div class="row justify-content-start">
					
					<%
					DAOProdotto model_product=new DAOProdotto();
					
					if(comp_name != null) {
						array = model_product.viewProduct("Tipo",action);					
					}
					else 
					{
							array = model_product.viewProduct(brand);
					}
						
					
					
					if(array!=null && array.size()!=0)
					{
						Iterator<?> it = array.iterator();
						while (it.hasNext()) 
						{
							Prodotto bean = (Prodotto) it.next();	
							System.out.println("il path immagine è : "+bean.getImmagine());
							log("il path immagine è : "+bean.getImmagine());
					%>
					
						<div class="col-xl-4 spacerProdotti">
							<a href="Product?action=prodotto&type_prod=<%=bean.getTipo()%>&model_prod=<%=bean.getModello()%>"><img src=<%=bean.getImmagine()+"/img1.jpg"%> width="200" height="200" class="imgItem5"></a>
							<a href="Product?action=prodotto&type_prod=<%=bean.getTipo()%>&model_prod=<%=bean.getModello()%>"><h5><%=bean.getNome()+" "+bean.getModello()%></h5></a>
						</div>
					<% 	}
						} else { %>
							<div class="row justify-content-center" style="margin-left: 20px"><h4>Nessun prodotto disponibile</h4></div>
					<% } %>
					</div>
				</div>
				<div class="col-xl-2 list-group">
				<a href="Product?action=cpu_comp&comp_name=Processori" class="list-group-item list-group-item-action">Processori</a>
					<a href="Product?action=gpu_comp&comp_name=Schede Grafiche" class="list-group-item list-group-item-action">Schede Grafiche</a>		
					<a href="Product?action=ram_comp&comp_name=RAM" class="list-group-item list-group-item-action">RAM</a>
					<a href="Product?action=storage_comp&comp_name=Archiviazione" class="list-group-item list-group-item-action">Archiviazione</a>
					<a href="Product?action=powersupply_comp&comp_name=Alimentatori" class="list-group-item list-group-item-action">Alimentatori</a>
					<a href="Product?action=motherboard_comp&comp_name=Schede Madre" class="list-group-item list-group-item-action">Schede Madre</a>
					<a href="Product?action=heatsink_comp&comp_name=Dissipatori e Ventole" class="list-group-item list-group-item-action">Dissipatori</a>
					<a href="Product?action=case_comp&comp_name=Case" class="list-group-item list-group-item-action">Case</a>
					<a href="Product?action=monitor_comp&comp_name=Monitor" class="list-group-item list-group-item-action">Monitor</a>
					<a href="Product?action=keyboard_comp&comp_name=Tastiere" class="list-group-item list-group-item-action">Tastiere</a>
					<a href="Product?action=mouse_comp&comp_name=Mouse" class="list-group-item list-group-item-action">Mouse</a>
					<a href="Product?action=headphones_comp&comp_name=Cuffie" class="list-group-item list-group-item-action">Cuffie</a>
					<a href="Product?action=chair_comp&comp_name=Sedie Gaming" class="list-group-item list-group-item-action">Sedie Gaming</a>
					<a href="Product?action=conf_comp&comp_name=Configurazioni" class="list-group-item list-group-item-action">Configurazioni</a>
					<a href="Product?action=lastarrived" class="list-group-item list-group-item-action">Ultimi Arrivi</a>
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
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>