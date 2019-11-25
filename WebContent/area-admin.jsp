<%@page	language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
    	import="com.Powerfulrig.Model.*" 
    	import="com.Powerfulrig.Bean.*" 
    	import="java.util.*"
%>

<%
	ArrayList<Prodotto> products = (ArrayList<Prodotto>) request.getAttribute("products");
	ArrayList<Utente> users = (ArrayList<Utente>) request.getAttribute("users");
	ArrayList<Ordine> orders = (ArrayList<Ordine>) request.getAttribute("orders");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>PR - Area Admin</title>
	
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
	
	<%
	
		if(!(utenteLoggato.getTipo().equals("admin")))
		{
			response.sendRedirect("home.jsp");
			return;
		}
	
	%>
	
	<!-- MAIN SECTION Admin-->
	
	<section class="admin-section">
		<div class="container">
			<div class="row justify-content-center">
				<h1>Area Admin - Benvenuto</h1>
			</div>
		</div>
		<div class="container border-adminpage">
			<div class="row justify-content-center">
				<div class="col-md-4">
					<h4 id="list1" class="adminh4">Lista Utenti</h4>
				</div>
				<div class="col-md-4">
					<h4 id="list2" class="adminh4">Lista Prodotti</h4>
				</div>
				<div class="col-md-4">
					<h4 id="list3" class="adminh4">Lista Ordini</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="container divutenti" id="utdiv">
						<div class="row justify-content-end">
							<h4 class="uth4">Utenti registrati: </h4>
						</div>
						<%
							DAOUser model_utente = new DAOUser();
							ArrayList<Utente> utenti = model_utente.showAccountall();
							Iterator<?> it = utenti.iterator();
							while (it.hasNext()) 
							{
								Utente utente = (Utente) it.next();	
								
						%>
						<div class="row spacerUt">
							<div class="col-md-11">
								<div class="row">
									<div class="col-md-4">
										<p id="utP">Nome:</p><p id="utP2"><%=utente.getNome()%></p>
									</div>
									<div class="col-md-4">
										<p id="utP">Cognome:</p><p id="utP2"><%=utente.getCognome()%></p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<p id="utP">Email:</p><p id="utP2"><%=utente.getEmail()%></p>
									</div>
									<div class="col-md-4">
										<p id="utP">Password:</p><p id="utP2">********</p>
									</div>
								</div>
							</div>
							<div class="col-md-1">
								<i  id="removeUserIcon" class="glyphicon glyphicon-remove remove"> </i>
							</div>
						</div>
						<%		
						}
						%>
					</div>
					<div class="container divprod" id="prodiv">
						<div class="row">
							<div class="col-md-5 justify-content-start">
							
									<% 
									Boolean inserimento = (Boolean) request.getAttribute("inserimento"); 
									%>
									<input type="text" name="inserimento" value="<%=inserimento%>" id="inserimento" class="hidden">
									
									<% 
										if(inserimento!=null) 
										{
											if(inserimento){ %>
												<h4 style="color:green;">Inserito con Successo</h4>
											<%} else{ %>
												<h4 style="color:red;">Inserimento non riuscito</h4>
											<%}
										}%>
									<% Boolean modifica = (Boolean) request.getAttribute("modifica"); 
											if(modifica!=null) 
											{
												if(modifica){ %>
													<h4 style="color:green;">Modificato con Successo</h4>
											<%} else{ %>
													<h4 style="color:red;">Modifica non riuscita</h4>
												<%} 
											}%>
								</div>
						
								<div class="col-md-7">
									<div class=" row justify-content-start">
										<a href="inserisci-prodotto.jsp"><h4 class="prodh4">Inserisci Prodotto</h4></a>
									</div>
								</div>
							
						</div>
						<%
							DAOProdotto model_product = new DAOProdotto();
							ArrayList<Prodotto> prodotti = model_product.viewProduct();
							Iterator<?> it2 = prodotti.iterator();
							while (it2.hasNext()) 
							{
								Prodotto bean = (Prodotto) it2.next();	
						%>
						<div class="row spacerProd">
							<div class="col-md-1">
								<a href="Product?action=prodotto&type_prod=<%=bean.getTipo()%>&model_prod=<%=bean.getModello()%>"><img src="<%=bean.getImmagine()%>/img1.jpg" width="70px" height="70px"></a>
							</div>
							<div class="col-md-1" id="type_prod_div">
								<div class="row justify-content-center">
									<p class="utProd">Tipo:</p>
								</div>
								<div class="row justify-content-center">
									<p  class="utProd2" id="type_prod_value"><%=bean.getTipo()%></p>
								</div>
							</div>
							<div class="col-md-1">
								<div class="row justify-content-center">
									<p class="utProd">Marca:</p>
								</div>
								<div class="row justify-content-center">
									<p class="utProd2"><%=bean.getMarca()%></p>
								</div>
							</div>
							<div class="col-md-2">
								<div class="row justify-content-center">
									<p class="utProd">Nome:</p>
								</div>
								<div class="row justify-content-center">
									<p class="utProd2"><%=bean.getNome()%></p>
								</div>
							</div>
							<div class="col-md-1" id="model_prod_div">
								<div class="row justify-content-center">
									<p class="utProd">Modello:</p>
								</div>
								<div class="row justify-content-center">
									<p class="utProd2" id="model_prod_value"><%=bean.getModello()%></p>
								</div>
							</div>
							<div class="col-md-1">
								<div class="row justify-content-center">
									<p class="utProd">Prezzo:</p>
								</div>
								<div class="row justify-content-center">
									<p class="utProd2"><%=bean.getPrezzo()%> &euro;</p>
								</div>
							</div>
							<div class="col-md-1">
								<div class="row justify-content-center">
									<p class="utProd">P. Scont:</p>
								</div>
								<div class="row justify-content-center">
									<p class="utProd2"><%=bean.getPercentualeSconto()%> %</p>
								</div>
							</div>
							<div class="col-md-1">
								<div class="row justify-content-center">
									<p class="utProd">Quantità:</p>
								</div>
								<div class="row justify-content-center">
									<p class="utProd2"><%=bean.getQuantita()%></p>
								</div>
							</div>	
							<div class="col-md-1">
								<div class="row justify-content-center">
									<a href="Product?action=modify_product&type_prod=<%=bean.getTipo()%>&model_prod=<%=bean.getModello()%>"><i class="glyphicon glyphicon glyphicon-wrench wrench"> </i></a>
								</div>
								<div class="row justify-content-center">
									<i id="removeProdIcon" class="glyphicon glyphicon-remove remove2"></i>
								</div>
							</div>
						</div>
						<%
							}	
						%>
					</div>
					<div class="container divordini" id="ordiv">
						<div class="container spacerUP5">
							<form action="SelectOrdersByDate" method="GET">
								<div class="row">
									<div class="col-md-4">
										<div class="row justify-content-center">											
											<input id="dataStart" class="prova312" type="date" name="start">
										</div>
									</div>
									<div class="col-md-4">
										<div class="row justify-content-center">
											<input id="dataEnd" class="prova312" type="date" name="end">
										</div>
									</div>
									<div class="col-md-4">
										<div class="row justify-content-center">
											<input type="Submit" class="site-btn6" id="setupbtnUP2" value="Cerca per Data">
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="container spacerUP5">
							<form action="SelectOrdersByUsername" method="GET">
								<div class="row">
									<div class="col-md-4">
									</div>
									<div class="col-md-4">
										<div class="row justify-content-center">											
											<input id="username" type="text" name="username">
										</div>
									</div>
									<div class="col-md-4">
										<div class="row justify-content-center">
											<input type="Submit" class="site-btn6" id="setupbtnUP2" value="Cerca per Email" style="margin-top: 3px">
										</div>
									</div>
								</div>
							</form>
						</div>
						<%
							Iterator<?> it3 = null;
							ArrayList<Ordine> ordiniPerData = (ArrayList<Ordine>) request.getAttribute("ordiniPerData");
							ArrayList<Ordine> ordiniPerUsername = (ArrayList<Ordine>) request.getAttribute("ordiniPerUsername");
							
							if(ordiniPerData != null)
							{
								it3 = ordiniPerData.iterator();
							} else 	
								if(ordiniPerUsername != null)
								{
									it3 = ordiniPerUsername.iterator();								
								}
								else 	
									if(ordiniPerData == null && ordiniPerUsername == null)
									{				
										request.removeAttribute("ordiniPerData");
										request.removeAttribute("ordiniPerUsername");
										DAOOrdine model_ordine = new DAOOrdine();
										ArrayList<Ordine> ordini = model_ordine.viewOrdiniAll();
										it3 = ordini.iterator();
									}
							
							while (it3.hasNext()) 
							{
								Ordine bean = (Ordine) it3.next();	
						%> 
						<div class="row spacerUt">
							<div class="col-md-11">
								<div class="row">
									<div class="col-md-3">
										<p id="utP">ID Ordine:</p><p id="utP2"><%=bean.getNumeroOrdine()%></p>
									</div>
									<div class="col-md-4">
										<p id="utP">Utente Ordine:</p><p id="utP2"><%=bean.getUser().getEmail()%></p>
									</div>
									<div class="col-md-5">
										<p id="utP">Codice Carta:</p><p id="utP2"><%=bean.getMetodoPagamento()%></p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-5">
										<div class="row">
											<p id="utP" class="spacerIndirizzoOrd">Indirizzo:</p><p id="utP2"><%=bean.getUser().getVia()+" "+bean.getUser().getCap()%></p>
										</div>
									</div>
									<div class="col-md-4">
										<p id="utP">Data Ordine:</p><p id="utP2"><%=bean.getData()%></p>
									</div>
									<div class="col-md-3">
										<p id="utP">Prezzo:</p><p id="utP2"><%=bean.getPrezzo()%> &euro;</p>
									</div>
								</div>
							</div>
							<div class="col-md-1">
								<i id="removeOrderIcon" class="glyphicon glyphicon-remove remove"></i>
							</div>
						</div>
						<%
							}	
						%>					
					</div>
				</div>
			</div>
		</div>
	</section>	
	<!-- END SECTION -->
	
	<!-- Header section start -->
     	  <%@ include file="fragment/footer.jsp" %>
	<!-- Header section end -->

	<script>	
	
	if (location.hash == "#ordiv") {
		$("#utdiv").hide();
		$("#prodiv").hide();
		$("#ordiv").show();
	} else if(location.has == "#utdiv") {
		$("#ordiv").hide();
		$("#prodiv").hide();
		$("#utdiv").show();
	} else if(location.has == "#prodiv") {
		$("#ordiv").hide();
		$("#utdiv").hide();
		$("#prodiv").show();
	}
	
	// funziona AJAX che elimina il prodotto selezionato dal db
	$("[id ='removeProdIcon']").on('click', function removeProd(){
		var value1 = ("removeProd");
		var value2 = $(this).parent().parent().parent().find('div#type_prod_div').find('p#type_prod_value').html(); //ottenimeto type_prod	
		var value3 = $(this).parent().parent().parent().find('div#model_prod_div').find('p#model_prod_value').html(); //ottenimeto model_prod	
			Swal.fire({ //PRIMO POPUP
			  title: 'Sei sicuro di voler eliminare il prodotto?',
			  text: "Il prodotto sarà eliminato permanentemente.",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Conferma',
			  cancelButtonText: 'Annulla'
			}).then((result) => {
			  if (result.value) {
				  $.ajax({ //INVOCAZIONE AJAX
					  	type: "GET",
					    url: "Product",
					    data: {"action" : value1, "type_prod": value2, "model_prod": value3},
					    success: function(results){
					    	Swal.fire({ //SECONDO POPUP
					  			  title: 'Prodotto Eliminato',
					  			  timer: 1000,
					  			  type: 'success',
					  			  showCancelButton: false,
					  			  showConfirmButton: false,
					  			  width: '400px',
					  			})
					  		setTimeout(function(){location.href="area-admin.jsp"} , 200);
						  }
					})
			  	}
			})
		});
				
	//funzione jquery con ajax annidato per eliminare l'ordine selezionato
	$("[id ='removeOrderIcon']").on('click', function removeOrder(){
		var value1 = ("deleteOrder");
		var value2 = $(this).parent().prev().children("div:nth-child(1)").children("div:nth-child(1)").find("p#utP2").html(); //ottenimeto username	
			Swal.fire({ //PRIMO POPUP
			  title: "Sei sicuro di voler eliminare l' ordine?",
			  text: "L'ordine sarà eliminato permanentemente.",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Elimina',
			  cancelButtonText: 'Annulla'
			}).then((result) => {
			  if (result.value) {
				  $.ajax({ //INVOCAZIONE AJAX
					 	type: "GET",
					    url: "Order",
					    data: {"action" : value1, "order_id" : value2},
					    success: function(results){
					    	Swal.fire({ //SECONDO POPUP
					  			  title: 'Ordine Eliminato',
					  			  timer: 1200,
					  			  type: 'success',
					  			  showCancelButton: false,
					  			  showConfirmButton: false,
					  			  width: '400px',
					  			})
					  		setTimeout(function(){	window.location.hash = "#ordiv";
					  								location.reload();} , 1350);    
						  }
					})
			  	}
			})
		});
	
	// funziona AJAX che elimina l'utente selezionato dal db
	$("[id ='removeUserIcon']").on('click', function removeUser(){
		var value1 = ("banUser");
		var value2 = $(this).parent().prev().children("div:nth-child(2)").children("div:nth-child(1)").find("p#utP2").html(); //ottenimeto email	
		alert(value2);		
		Swal.fire({ //PRIMO POPUP
			  title: 'Sei sicuro di voler eliminare l\' utente?',
			  text: "L'utente sarà bannato permanentemente.",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Conferma',
			  cancelButtonText: 'Annulla'
			}).then((result) => {
			  if (result.value) {
				  $.ajax({ //INVOCAZIONE AJAX
					  	type: "GET",
					    url: "Utente",
					    data: {"action" : value1, "username" : value2},
					    success: function(results){
					    	Swal.fire({ //SECONDO POPUP
					  			  title: 'Utente Bannato',
					  			  timer: 1200,
					  			  type: 'success',
					  			  showCancelButton: false,
					  			  showConfirmButton: false,
					  			  width: '400px',
					  			})
					  		setTimeout(function(){	window.location.hash = "#utdiv";
													location.reload();} , 1350); 
						  }
					})
			  	}
			})
		});
			  
	$("#list1").on('click', function() {
   		$("#prodiv").hide();
		$("#ordiv").hide();
   		$("#utdiv").show();
	});

	$("#list2").on('click', function() {
   		$("#utdiv").hide();
		$("#ordiv").hide();
   		$("#prodiv").show();
	});

	$("#list3").on('click', function() {
   		$("#prodiv").hide();
		$("#utdiv").hide();
   		$("#ordiv").show();
	});

	
	
	</script>	
	
	
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>
	
</body>

</html>