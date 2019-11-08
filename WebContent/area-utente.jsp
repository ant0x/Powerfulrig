<%@page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Powerfulrig.Bean.*"
    import="com.Powerfulrig.Model.*"
    import="java.util.*"
    import="java.time.format.DateTimeFormatter"
    import="java.time.*"
%>

<%
	//Utente utente = (Utente) request.getSession().getAttribute("utenteLoggato");
	PaymentMethodDAO model_payment = new PaymentMethodDAO();
	DAOUser model_utente = new DAOUser();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<title>PR - Area Utente</title>
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
     	  <!-- ottenimento dei metodi di pagamanto dell'utenteLoggato(questo è incluso nel fragment/header) -->>
     	  <% ArrayList<PaymentMethodBean> payment_methods = model_payment.doRetrieveByEmail(utenteLoggato.getEmail());
     	  
     	    ArrayList<String> addresses = model_utente.showAddres(utenteLoggato.getEmail());
     	    String address="";
     	    address=addresses.get(0)+" "+addresses.get(2)+" "+addresses.get(1);
     	    %>
	<!-- Header section end -->
	
	<section class="utente-section">
		<div class="container">
			<div class="row justify-content-center">
				<h1>Area Utente - Benvenuto <%=utenteLoggato.getNome()%></h1>
			</div>
		</div>
		<div class="container border-utentepage">
			<div class="row justify-content-start">
				<div class="col-xl-6">
					<h4 id="list1" class="utenteh4">Informazioni Utente</h4>
				</div>
				<div class="col-xl-6">
					<h4 id="list2" class="utenteh42">Lista Ordini</h4>
				</div>
			</div>
		</div>
		
		<div class="container" id="utdiv">
			<div class="container spacerUP borderutdiv" id="infPut">
				<div class="row justify-content-start">
					<div class="col-xl-3">
						<div class="row">
							<h4 class="upH4">Nome: </h4>
							<p class="upPCircle"><%=utenteLoggato.getNome()%></p>
						</div>
					</div>
					<div class="col-xl-3">
						<div class="row">
							<h4 class="upH4">Cognome: </h4>
							<p class="upPCircle"><%=utenteLoggato.getCognome()%></p>
						</div>
					</div>
					<div class="col-xl-5">
						<div class="row">
							<h4 class="upH4">E-mail: </h4>
							<p class="upPCircle"><%=utenteLoggato.getEmail()%></p>
						</div>
					</div>
				</div>
				<div class="row spacerUP2 justify-content-start">
					<div class="col-xl-3">
						<div class="row">
							<h4 class="upH4">Password: </h4>
							<p class="upPCircle">&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;</p>
						</div>
					</div>
					<div class="col-xl-3">
						<div class="row justify-content-end">
							<input type="button" class="site-btn6" id="btninfo" value="Modifica Informazioni">
						</div>
					</div>
				</div>
			</div>
			<!-- div nascosto per la modifica delle info dell'utente -->
			<div class="container spacerUP borderutdiv" id="infPut2">
				<form method="GET" action="ModifyUser">
					<div class="row justify-content-start">
						<div class="col-xl-3">
							<div class="row">
								<h4 class="upH4">Nome: </h4>
								<input type="text" name="firstname" class="form-input" value="<%=utenteLoggato.getNome()%>">
							</div>
						</div>
						<div class="col-xl-3">
							<div class="row">
								<h4 class="upH4">Cognome: </h4>
								<input type="text" name="lastname" class="form-input" value="<%=utenteLoggato.getCognome()%>">
							</div>
						</div>
						<div class="col-xl-5">
							<div class="row">
								<h4 class="upH4">E-mail: </h4>
							</div>
							<div class="row">
								<input type="email" name="email" class="form-input" style="width: 450px;" value="<%=utenteLoggato.getEmail()%>">
							</div>
						</div>
					</div>
					<div class="row spacerUP2 justify-content-start">
						<div class="col-xl-3">
						</div>
						<div class="col-xl-3">
							<div class="row">
								<a href="modify-password.jsp"><h4 class="passwordh4">Modifica Password</h4></a>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="row justify-content-center">
								<input type="Submit" class="site-btn6" style="width: 130px; margin-top: 37px; margin-right: 40px;" value="Applica">
								<input type="reset" class="site-btn6" style="width: 130px; margin-top: 37px; margin-left: 30px;" id="btninfo2" value="Annulla">
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="container spacerUP3">
				<div class="row justify-content-start">
					<div class="col-xl-5">
						<h4 style="color:navy">Indirizzi di Spedizione</h4>
					</div>
				</div>
				
				<div class="row borderutdiv">
					<div class="col-xl-12">
							<% 
							boolean isStampato = false;
							
															
								if(address == "" || addresses.get(0).equals(""))
								{
									if(!isStampato)
									{
									%>							
										<div class="row justify-content-start">
											<div class="col-xl-12">
												<div class="row">
													<h4 style="color:navy; margin-left: 5px; cursor: pointer;" id="newInd">+ Inserisci nuovo indirizzo</h4>
												</div>
											</div>
										</div>
										<div class="row justify-content-start" id="inputNewInd">
											<form action="InsertAddress" method="get">
												<div class="col-xl-12">
													<div class="row">
														<div class="col-xl-4">
															<input type="text" class="form-input" name="indirizzo" placeholder="Inserisci Indirizzo">
														</div>
														<div class="col-xl-4">
															<input type="text" class="form-input" name="citta" placeholder="Inserisci città">
														</div>
														<div class="col-xl-1">
															<input type="text" class="form-input3" id="provincia" maxlength="2" name="provincia" placeholder="Provincia">
														</div>
														<div class="col-xl-3">
															<div class="row justify-content-center">
																<input type="text" class="form-input3" id="cap" maxlength="5" name="cap" placeholder="CAP">
															</div>
														</div>
													</div>
													<div class="row justify-content-center">
														<input type="Submit" class="site-btn6" style="margin-top: 20px" value="Salva Indirizzo">
													</div>
												</div>
											</form>
										</div>
									<% 
										isStampato = true;
									}
								}
								else
								{
								%>	
									<div class="row justify-content-start">
										<input type="hidden" id="addressNumber" value="<%=1%>">
										<input type="hidden" id="username" value="<%=utenteLoggato.getEmail()%>">
											<div class="col-xl-6">
												<div class="row">
													<h4 class="upH4">Indirizzo: </h4>
													<p class="upPCircle"><%=address%></p>
												</div>
											</div>
											<div class="col-xl-1">
												<div class="row justify-content-center">
													<i id="removeAddressIcon" class="glyphicon glyphicon-remove remove3"> </i>
												</div>
											</div>
										</div>
							<%}
														
						%>				
						<!-- div nascosto per l'inserimento di un nuovo indirizzo -->							
						
						
					</div>
				</div>
			</div>
			<div class="container spacerUP3">
				<div class="row justify-content-start">
					<div class="col-xl-5">
						<h4 style="color:navy">Metodi di Pagamento</h4>
					</div>
				</div>
				<div class="row borderutdiv">
				<!-- codice generato -->
				<% isStampato = false;
				
				Boolean esito = (Boolean)request.getAttribute("isCardNumberValid");
				if(esito != null && !esito)
				{
					%>
					<script>
						Swal.fire({ //PRIMO POPUP
							  title: "Carta già utilizzata!",
							  text: "Controlla i dati inseriti della tua carta.",
							  type: 'warning',
							  confirmButtonColor: '#3085d6',
							  confirmButtonText: 'Ok',
						})
						setTimeout(2500);
					</script>
				<%	
				}				
					for(int i = 0; i < payment_methods.size(); i++)
					{
						if(i == payment_methods.size()-1) // se è l'ultimo metodo di pagamento esistente
						{
						%>
							<div class="col-xl-12">
						<%
						}
						else
						{	
							%>
							<div class="col-xl-12" style="margin-bottom: 2px;border-bottom: 1px solid white;">
						<% } %>
							<div class="row spacerUP4 justify-content-start">
								<div class="col-xl-5">
									<div class="row">
										<h4 class="upH4">Tipo Carta: </h4>
										<p class="upPCircle"><%=payment_methods.get(i).getCard_bank() %></p>
									</div>
								</div>
								<div class="col-xl-7">
									<div class="row">
										<h4 class="upH4">Scadenza Carta: </h4>
										<%	
											DateTimeFormatter pattern = DateTimeFormatter.ofPattern("dd-MM-yyyy");
											String data = payment_methods.get(i).getCard_expiry().format(pattern); 
											data = data.substring(3);										
										%>
										<p class="upPCircle"><%=data%></p>
									</div>
								</div>
							</div>
							<div class="row justify-content-start">
								<div class="col-xl-5">
									<div class="row">
										<h4 class="upH4">Codice Carta: </h4>
										<p id="card_number" class="upPCircle"><%=payment_methods.get(i).getCard_number()%></p>
									</div>
								</div>
								<div class="col-xl-4">
									<div class="row">
										<h4 class="upH4">Codice CVC: </h4>
										<p class="upPCircle">&#8226;&#8226;&#8226;</p>
									</div>
								</div>
								<div class="col-xl-3">
									<div class="row justify-content-end">
										<i id="removePaymentMethodIcon" class="glyphicon glyphicon-remove remove3"> </i>
									</div>
								</div>
							</div>
						</div>						
						<%
					}
					
					if(payment_methods.size() < 3 || payment_methods.isEmpty() )
					{
						if(!isStampato)
						{
						%>
							<div class="row justify-content-start">
								<div class="col-xl-12">
									<h4 style="color:navy; margin-left: 5px; margin-bottom: 15px; cursor: pointer;" id="newCard">+ Inserisci nuovo Metodo di Pagamento</h4>
								</div>
							</div>
						<%	
						isStampato = true;
						}
					}
				%>
					
					
					<!--  div nascosto per l'inserimento di un nuovo metodo di pagamento -->
					<div class="row" id="inputNewCard">
						<form action="InsertPaymentMethod" method="get">
							<div class="row justify-content-start">
								<div class="col-xl-4">
									<select class="custom-select" name="card_type_selector" id="card_selector">
										<option disabled hidden selected>TIPO CARTA</option>
										<option value="Carta di Credito">Carta di Credito</option>
										<option value="Paypal">Paypal</option>
										<option value="Carta di Docente">Carta del Docente</option>
										<option value="PostePay">PostePay</option>
									</select>
								</div>
								<div class="col-xl-4">
									<input type="text" class="form-input2" id="codcarta" name="codcarta" maxlength="19" placeholder="Codice Carta">
								</div>
								<div class="col-xl-2">
									<input type="password" class="form-input4" name="codcvc" maxlength="3" placeholder="Codice CVC">
								</div>
								<div class="col-xl-2">
									<input type="date" class="prova312" name="dataexpcarta" id="dataexpcarta" style="margin-left: 40px;">
								</div>
							</div>
							<div class="row justify-content-center">
								<input type="Submit" class="site-btn7" value="Salva Carta" style="margin-top: 25px;">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	
		<div class="container" id="ordiv">
		<!--  codice generato -->
		<%			
			DAOOrdine model_ordine = new DAOOrdine();
			ArrayList<Ordine> ordini = model_ordine.viewOrdineById(utenteLoggato.getEmail());			
		%>
			<div class="container spacerUP2 borderutdiv">
		<%				
			for(int I=0; I<ordini.size(); I++)
			{
				DateTimeFormatter pattern = DateTimeFormatter.ofPattern("dd-MM-yyyy");
				String data = ordini.get(I).getData();
			%>
				<div class="container" style="margin-bottom: 15px">
					<div class="row justify-content-start test">
						<div class="col-xl-3">
							<div class="row">
								<h4 class="upH43">ORDINE EFFETTUATO IL: </h4>
								<p class="ordP"><%=data%></p>
							</div>
						</div>
						<div class="col-xl-3">
							<div class="row">
								<h4 class="upH43">IMPORTO TOTALE: </h4>
								<div class="col-xl-12">
									<div class="row">
										<p class="ordP"><%=ordini.get(I).getTotale() %> &euro;</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="row">
								<h4 class="upH43">SPEDITO A: </h4>
								<p class="ordP"><%=" "+ordini.get(I).getUser().getVia()+
								ordini.get(I).getUser().getCap()+
								ordini.get(I).getUser().getNumeroCivico()
								%></p>
							</div>
						</div>
					</div>
					<div class="row justify-content-start test3">
						<div class="col-xl-12">
						<%
							if(ordini.get(I).getStato().equalsIgnoreCase("consegnato")) {
						%>
							<div class="row">
								<h4 class="upH43">Consegnato: <%LocalDate.parse(ordini.get(I).getData().toString()).plusDays(3).toString();%></h4>
							</div>
							<div class="row">
								<h4 class="uph44">Il pacco è stato consegnato presso il domicilio selezionato</h4>
							</div>
						<%	} else {	
							String data2 = LocalDate.parse(ordini.get(I).getData().toString()).plusDays(3).format(pattern);
						%>
							<div class="row">
								<h4 class="upH43">Consegna prevista per il: <%=data2%></h4>
							</div>
							<div class="row">
								<h4 class="uph44">Il pacco sarà consegnato presso il domicilio selezionato</h4>
							</div>
						<%
							}
								ArrayList<Prodotto> prod_ordini = ordini.get(I).getLista();
								System.out.println(prod_ordini);
								for(int J=0; J<prod_ordini.size(); J++)
								{
						%>
								
								<div class="row" style="margin-bottom: 15px;">
								<!-- codice generato -->
									<div class="col-xl-2">
										<a href="Product?action=prodotto&type_prod=<%=prod_ordini.get(J).getTipo()%>&model_prod=<%=prod_ordini.get(J).getModello()%>"><img src=<%=prod_ordini.get(J).getImmagine()+"/img1.jpg"%> class="imgItem7" width="auto" height="auto"></a>
									</div>
									<!--  prodotto acquistato simulato -->
									<div class="col-xl-3 spacerInfo">
										<h4 class="upH45"><a style="color: black;" class="prod_ordini_href" href="Product?action=prodotto&type_prod=<%=prod_ordini.get(J).getTipo()%>&model_prod=<%=prod_ordini.get(J).getModello()%>"><%=prod_ordini.get(J).getNome()%></a></h4>
										<h4 class="upH45">Spedizione Gratuita</h4>
										<h4 class="upH45"><%=prod_ordini.get(J).getPrezzo() %> &euro; x<%=prod_ordini.get(J).getQuantita()%></h4>
										<input type="hidden" id="type_prod" value="<%=prod_ordini.get(J).getTipo()%>">
										<input type="hidden" id="model_prod" value="<%=prod_ordini.get(J).getModello()%>">
										<input type="button" class="site-btn5" id="buyAgainButton" value="COMPRA DI NUOVO">
									</div>
									<div class="col-xl-4" id="details">
										<h4 class="uph44" style="margin-bottom: 0px;">Metodo di pagamento:</h4>
										<h4 class="upH45"><%=ordini.get(I).getMetodoPagamento()%></h4>
										<h4 class="uph44" style="margin-bottom: 0px;">Spedito a:</h4>
										<h4 class="upH45"><%=utenteLoggato.getNome()%> <%=utenteLoggato.getCognome() %>, <br> <%=ordini.get(I).getUser().getVia()%> <br> <%=ordini.get(I).getUser().getCap()%> <br> <%=ordini.get(I).getUser().getNumeroCivico()%></h4>
									</div>
									<%
										if(J==0) //se è il primo prodotto stampato dell'ordine, alalora stampa il div di informazioni laterale
										{
									%>
									<div class="col-xl-3 spacerBtnUP">
										<div class="row justify-content-center">
											<a href="https://www.ups.com/track?loc=it_IT&requester=ST/" target="_blank"><input type="button" class="site-btn6 setupbtnUP" value="Traccia il mio pacco"></a>
										</div>
										<div class="row justify-content-center">
											<input type="button" class="site-btn6 setupbtnUP" id="detailsBtn" value="Dettagli dell'ordine">
										</div>
										<div class="row justify-content-center">
											<a href="#"><input type="button" class="site-btn6 setupbtnUP" value="Fattura"></a>
										</div>
										<div class="row justify-content-center">
											<a href="condizioni-generali.jsp" target="_blank"><input type="button" class="site-btn6 setupbtnUP" value="Informativa sugli acquisti"></a>
										</div>
									</div>
								</div>
									
								<%} 
									else 
									{%>		
									</div>						
										<div class="col-xl-3 spacerBtnUP"></div>
									<%} 
								}
							%>
						</div>
					</div>
					<div class="row justify-content-start test2">
							<div class="col-xl-12">
								<div class="row justify-content-end">
									<h4 class="upH43">Ordine</h4>
									<p class="ordP"># 239-103-<%=ordini.get(I).getNumeroOrdine()%></p>
								</div>
							</div>
						</div>
					</div>					
			<% } %>			
		</div>		
		
	<!--  codice generato -->
		</div>
	</section>
	
	<!-- Pre-Footer section -->
	     <%@ include file="fragment/pre-footer.jsp" %>
	<!-- Pre-Footer section end -->


	<!-- Footer section -->
		<%@ include file="fragment/footer.jsp" %>
	<!-- Footer section end -->

	<script>	

		document.getElementById('codcarta').addEventListener('input', function (e) {
	  	var target = e.target, position = target.selectionEnd, length = target.value.length;
  
  			target.value = target.value.replace(/[^\dA-Z]/g, '').replace(/(.{4})/g, '$1 ').trim();
	  		target.selectionEnd = position += ((target.value.charAt(position - 1) === ' ' && target.value.charAt(length - 1) === ' ' && length !== target.value.length) ? 1 : 0);
		});			

		if (location.hash == "#ordiv") {
			$("#utdiv").hide();
			$("#ordiv").show();
		} 
		
		if (location.hash == "#utdiv") {
			$("#ordiv").hide();
			$("#utdiv").show();
		} 

		$(function() {
    		$("#dataexpcarta").datepicker({dateFormat: 'mm/yy'});
    	});

		$("#list1").on('click', function() {
			$("#ordiv").hide();
		   	$("#utdiv").show();
		});
	
		$("#list2").on('click', function() {
			$("#utdiv").hide();
			$("#ordiv").show();
		});

		$("#btninfo").on('click', function() {
			$("#infPut").hide();
			$("#infPut2").show();
		});

		$("#btninfo2").on('click', function() {
			$("#infPut2").hide();
			$("#infPut").show();
		});

		$("#newInd").on('click', function() {
			$("#inputNewInd").toggle();
		});

		$("#newCard").on('click', function() {
			$("#inputNewCard").toggle();
		});

		// funzione JQUERY per mostrare i dettagli relativi all'ordine cliccato 
		$("[id ='detailsBtn']").on('click', function showDetails(){				
	  		if ( $(this).parent().parent().parent().find('div#details').css('visibility') == 'hidden')
	  			$(this).parent().parent().parent().find('div#details').css('visibility','visible');
	  		else
	  			$(this).parent().parent().parent().find('div#details').css('visibility','hidden');
		});
		
		//funzione jquery con ajax annidato per eliminare l'indirizzo scelto
		$("[id ='removeAddressIcon']").on('click', function removeAddress(){
			var value1 = ("deleteAddress");
			var value2 = $(this).parent().parent().parent().find("input#addressNumber").val(); //ottenimeto username			
			var value3 = $(this).parent().parent().parent().find("input#username").val(); //ottenimeto username			
				Swal.fire({ //PRIMO POPUP
				  title: "Sei sicuro di voler eliminare l' indirizzo?",
				  text: "L'indirizzo sarà eliminato permanentemente.",
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
						    url: "Utente",
						    data: {"action" : value1, "addressNumber" : value2, "username" : value3},
						    success: function(results){
						    	Swal.fire({ //SECONDO POPUP
						  			  title: 'Indirizzo Eliminato',
						  			  timer: 1200,
						  			  type: 'success',
						  			  showCancelButton: false,
						  			  showConfirmButton: false,
						  			  width: '400px',
						  			})
						  		setTimeout(function(){location.href="area-utente.jsp"} , 1350);    
							  }
						})
				  	}
				})
			});
		
		//funzione jquery con ajax annidato per eliminare il metodo di pagamento scelto
		$("[id ='removePaymentMethodIcon']").on('click', function removePaymentMethod(){
			var value1 = ("deletePaymentMethod");
			var value2 = $(this).parent().parent().parent().find("p#card_number").html(); //ottenimeto card_number
				Swal.fire({ //PRIMO POPUP
				  title: "Sei sicuro di voler eliminare il metodo di pagamento?",
				  text: "Il metodo sarà eliminato permanentemente.",
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
						    url: "Utente",
						    data: {"action" : value1, "card_number" : value2},
						    success: function(results){
						    	Swal.fire({ //SECONDO POPUP
						  			  title: 'Indirizzo Eliminato',
						  			  timer: 1200,
						  			  type: 'success',
						  			  showCancelButton: false,
						  			  showConfirmButton: false,
						  			  width: '400px',
						  			})
						  		setTimeout(function(){location.href="area-utente.jsp"} , 1350);    
							  }
						})
				  	}
				})
			});
		
		
		$("[id ='buyAgainButton']").on('click', function addtocart(){	
			var value1 = $(this).prev().prev().val();
			var value2 = $(this).prev().val();
			var value3 = ("addProduct");
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
		  			setTimeout(function(){	window.location.hash = "#ordiv";
											location.reload();}, 1850);
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
		});
		
		
	</script>
	
	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>
	
</body>

</html>