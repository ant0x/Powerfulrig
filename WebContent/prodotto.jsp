<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
    	import="com.Powerfulrig.Bean.*"
    	import="com.Powerfulrig.Model.*"
    	import="java.util.*"
%>
<%	
	Prodotto bean = (Prodotto) request.getAttribute("product");
	DAOProdotto model_prod = new DAOProdotto();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>PR - <%=bean.getMarca()+" "+bean.getNome()+" "+bean.getModello()%></title>
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
	
	 <!-- 
	 	UserConfigurationDAO model_user_conf = null;
	  	ArrayList<UserConfigurationBean> userconfs = null;
	 	
	  	if(utenteLoggato != null)
	 	{
     	  model_user_conf = new UserConfigurationDAO();
     	  userconfs = model_user_conf.retrieveByUsername(utenteLoggato.getUsername()); 
	 	}
     -->	
	
	<!-- Prodotto Singolo section -->

	<section class="prodsing-section">
		<div class="container border-prodsing">
			<div class="row">
				<div class="col-xl-12">
					<h6><%=bean.getNome()+" "+bean.getModello()%></h6>
				</div>
			</div>
			<div class="row" id="spacerPS">
				<div class="col-xl-1">
					<img src=<%=bean.getImmagine()+"/img1.jpg"%> width="65" height="65" class="imgItem3">
					<img src=<%=bean.getImmagine()+"/img2.jpg"%> width="65" height="65" class="imgItem3">
					<img src=<%=bean.getImmagine()+"/img3.jpg"%> width="65" height="65" class="imgItem3">
					<img src=<%=bean.getImmagine()+"/img4.jpg"%> width="65" height="65" class="imgItem3">
				</div>
					<img id="imgXD" src="<%=bean.getImmagine()%>/img1.jpg" alt="Snow" style="width:100%; max-width:280px; height: 280px;" class="imgItem2">
					<div id="myModal" class="modal">
						<span class="close">&times;</span>
						<img class="modal-content" id="img01" style="width: 350px;">
					</div>
				<div class="col-xl-8" id="spacerDettagli">
					<div>
						<p id="stiletitle">Marca: </p>
						<p class="stilep"><%=bean.getMarca()%></p>
					</div>
					<div>
						<p id="stiletitle">Modello: </p>
						<p class="stilep" id="model_prod"><%=bean.getModello()%></p>
					</div>
					<div>
						<p id="stiletitle">Prezzo: </p>
						<p style="text-decoration: line-through;" class="stilep"> <%=bean.getPrezzo()%> &euro; </p>
					</div>
					<div>
						<p id="stiletitle">Disponibilita: </p>
						<%
							if(bean.getQuantita() >= 1) {
						%>
						<i class="glyphicon glyphicon-ok-sign ok-sign"> </i>
						<%
							} else {
						%>
						<i class="glyphicon glyphicon-remove-sign remove-sign"> </i>
						<%	} %>
					</div>
					<p id="stilepPS">Spedizione Gratuita</p>
					<div class="row">
						<div class="col-xl-6">
							<input type="button" class="site-btn3" value="AGGIUNGI AL CARRELLO" onclick="addtocart()">
						</div>
						<div class="col-xl-6">
							<div class="row justify-content-center dropdown">
								<button type="button" class="btn btn-secondary dropdown-toggle site-btn3 spacerBtn" id="dropdownMenuButton" data-display="static" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">AGGIUNGI A CONFIGURAZIONE</button>
								<div class="dropdown-menu fixSpaceConf" aria-labelledby="dropdownMenuButton">
								<%
								if(utenteLoggato != null)
							 	{						     	  							 	
									int size_userconfs = userconfs.size();
									int J=0;  // contatore configurazioni esistenti
									int i = 0;
									
									for(i = 0; i < size_userconfs; i++) 
									{%>
										<a class="dropdown-item" id="addToConf" style="cursor:pointer;"><input type="hidden" id="id_conf" value="<%=userconfs.get(i).getId_user_configuration()%>"> <%=userconfs.get(i).getName_user_configuration()%> </a>
									<%
									J++;
									} 
									if(J < 3)
									{%>
										<a class="dropdown-item" href="configurazioni.jsp">Crea una nuova configurazione</a>
									<%
									}
								
								}
								else
								{%>
									<a class="dropdown-item" href="log-area.jsp">Crea una nuova configurazione</a>
								<%} %>	
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
		<div class="container spacerDescrizioneProd">
			<div class="row">
				<div class="col-xl-3">
					<h2 id="titlePPS">DESCRIZIONE</h2>
				</div>
				<div class="descstyle col-xl-9">
					<hr>
				</div> 
				<p id="descP"><%=bean.getDescrizione()%></p>
			</div>
			<div class="row">
				<div class="col-xl-2">
					<h2 id="titlePPS">SPECIFICHE</h2>
				</div>
				<div class="specstyle col-xl-10">
					<hr>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-xl-6">
						<table class="table">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
							<tr style="display: none;">
								<th scope="row">Tipo</th>
								<td id="type_prod"><%=bean.getTipo()%></td>
							</tr>
							<tr>
								<th scope="row">Marca</th>
								<td><%=bean.getMarca()%></td>
							</tr>
							<tr>
								<th scope="row">Nome</th>
								<td><%=bean.getNome()%></td>
							</tr>
							<tr>
								<th scope="row">Modello</th>
								<td><%=bean.getModello()%></td>
							</tr>
							<tr>
								<th scope="row">Anno di Rilascio</th>
								
							</tr>
							<tbody>
						</table>
					</div>
					<div class="col-xl-6">
						<table class="table">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
							<% 
							 for (Map.Entry<String,String> entry : component.entrySet())
								{
									 if(entry.getKey().contains("id") || entry.getKey().contains("model") || entry.getKey().contains("label"))
									 {
										 if(entry.getKey().contains("id"))
										 {
							%>
											 	<input type="hidden" id="id_comp" value="<%=entry.getValue()%>">
							<%
										 }
										 continue;
									 }										
									 else
									 {
							%>
										<tr>
											<th scope="row"><%=entry.getKey()%></th>
											<td><%=entry.getValue()%></td>
										</tr>
							<%
									}									
								}
							%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>

		// Get the modal
		var modal = document.getElementById("myModal");
		
		// Get the image and insert it inside the modal - use its "alt" text as a caption
		var img = document.getElementById("imgXD");
		var modalImg = document.getElementById("img01");
		var captionText = document.getElementById("caption");
		img.onclick = function(){
		modal.style.display = "block";
		modalImg.src = this.src;
		
		captionText.innerHTML = this.alt;
		}
		
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() { 
		modal.style.display = "none";
		}
	
		jQuery(document).ready(function($){
			$('.imgItem3').on('click',  function() {
	    		$('#imgXD').prop('src', this.src);
			});
		});
		
		var value1 = $("#type_prod").html();
		var value2 = $("#model_prod").html();
		var value3 = ("addProduct");
		
		function addtocart(){
		    $.ajax({
		        type: "POST",
		        url: "Product",
		        data: {"type_prod" : value1, "model_prod" : value2, "action" : value3},
		        success: function(results){
		        	Swal.fire({
		  			  title: 'Aggiunto al Carrello',
		  			  timer: 1700,
		  			  type: 'success',
		  			  showCancelButton: false,
		  			  showConfirmButton: false,
		  			  width: '400px',
		  			})
		  			setTimeout(location.reload.bind(location), 1850);
		        },
		        error: function (result){
		        	Swal.fire({
			  			 title: 'Non aggiunto al Carrello',
			  			 timer: 2000,
			  			 type: 'error',
			  			 showCancelButton: false,
			  			 showConfirmButton: false,
			  			 width: '500px'
			  		})
		        }
		    });
		};
		
		
		// funzione jquery per inserire il prodotto in questione nella configurazione
		$("[id ='addToConf']").on('click', function addComponent(){
			var value3 = $(this).find("input#id_conf").val();
			var value4 = $('#id_comp').val();
			var value5 = $('#model_prod').html();
			$.ajax({
				type: "POST",
			    url: "UserConfiguration",
			    data: {"action" : "addComponentToConf", "id_conf" : value3, "id_comp" : value4, "model_comp" : value5},
			    success: function(results){
			   		Swal.fire({
			  			title: 'Aggiunto a Configurazione!',
			  			timer: 1200,
			  			type: 'success',
			  			showCancelButton: false,
			  			showConfirmButton: false,
			  			width: '600px',
			  		})
			   	},
			    error: function (result){
			    	Swal.fire({
						title: 'Una componente della stessa tipologia è già presente!',
						text: "Sei sicuro di volerla sostituire?",
						type: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: 'Sostituisci',
						cancelButtonText: 'Annulla'
					}).then((result) => {  //SE SI VUOLE SOSTITUIRE LA COMPONENTE, SI PROCEDE CON QUESTA CHIAMATA AJAX AL METODO modifyComponentInConf
						if (result.value) {
							$.ajax({
								type: "POST",
							    url: "Product",
							    data: {"action" : "modifyComponentInConf", "id_conf" : value3, "id_comp" : value4, "model_comp" : value5},
							    success: function(results){
							   		Swal.fire({
							  			title: 'Sostituito nella configurazione!',
							  			timer: 1200,
							  			type: 'success',
							  			showCancelButton: false,
							  			showConfirmButton: false,
							  			width: '600px',
							  		})
							   	}
							})
						}
					})
				}
			});
		});
		
	</script>


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