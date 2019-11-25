<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
    	import="com.Powerfulrig.Model.*"
    	import="com.Powerfulrig.Bean.*"
    	import="java.util.*"
    	import="java.time.format.DateTimeFormatter"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<title>PR - Checkout</title>
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

	<% PaymentMethodDAO model_payment = new PaymentMethodDAO();
		PaymentMethodBean paymentBean = new PaymentMethodBean();
		DAOUser model_utente = new DAOUser();
		%>
	
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section start -->
     	  <%@ include file="fragment/header.jsp" %>	<!-- utenteLoggato arriva da qui -->
	<!-- Header section end -->
	
	<!-- Prodotto Singolo section -->

	<section class="ordine-section">
	<input type="hidden" id="username" value="<%=utenteLoggato.getEmail()%>">
		<form action="CreateOrder" method="POST">
			
			<div class="container">
				<% 
					ArrayList<Prodotto> arraycart = cart.getProducts();	
				
					for(int I=0;I<arraycart.size();I++) 
					{%>
				<!-- Display del singolo prodotto in carello -->
				<div class="row spacerOrdProd">
					<div class="col-md-2 border-ordprod">
						<img src=<%=arraycart.get(I).getImmagine()+"/img1.jpg"%> width="100" height="100" class="imgItem5">
					</div>
					<div class="col-md-5 spacer-ordine border-ordprod" style="margin-left: -30px;">
						<div class="row justify-content-start">
							<p id="ordProd"><%=arraycart.get(I).getMarca()+" "+arraycart.get(I).getNome()+" "+arraycart.get(I).getModello()%></p>
						</div>
					</div>
					<div class="col-md-2 spacer-ordine border-ordprod">
						<div class="row justify-content-center">
							<% float price = arraycart.get(I).getPrezzo(); %>
							<p id="ordProd" style="color: red"><input type="hidden" name="priceProd" value=<%=price%>> <%=price%> &euro;</p>
						</div>
					</div>
					<div class="col-md-1 spacer-ordine border-ordprod">
					<input type="hidden" id="prodParameters" value="Product?action=addQuantity&type_prod=<%=arraycart.get(I).getTipo()%>&model_prod=<%=arraycart.get(I).getModello()%>">
						<select class="custom-select" name="qnt_selector" id="qnt_selector">
							<option disabled hidden selected><%=arraycart.get(I).getQuantita()%></option>
							<option value=1>1</option>
							<option value=2>2</option>
							<option value=3>3</option>
							<option value=4>4</option>
							<option value=5>5</option>
							<option value=6>6</option>
							<option value=7>7</option>
							<option value=8>8</option>
							<option value=9>9</option>
							<option value=10>10</option>
						</select>
					</div>					
				</div>								
				<%	} %>
				<div class="row justify-content-end" id="totalOrderPrice">
				</div>
			</div>	
			 <!-- Container per la selezione dell'indirizzo -->
			<div class="container">
				<div class="row spacerInfo2">
					<div class="col-md-6 setupAddress">
						<div class="row justify-content-start">
							<div class="col-md-5">
								<h4 class="ordH42">Seleziona l'indirizzo di spedizione</h4>
							</div>
						</div>
						<!-- generazione indirizzi-->
						<%
							ArrayList<String> addresses = model_utente.showAddres(utenteLoggato.getEmail());
							String address = "";
							if (addresses.size() < 3) 
							{
								address = null;
							}
							else 
							{
								address = addresses.get(0) + " " + addresses.get(2) + " " + addresses.get(1);
							}
						%>
			     	    <input type="text" name="addressopt1" value="<%=addresses.get(0)%>" id="opt1" class="hidden">
						<input type="text" name="addressopt2" value="<%=addresses.get(2)%>" id="opt2" class="hidden">
						<input type="text" name="addressopt3" value="<%=addresses.get(1)%>" id="opt3" class="hidden">
						<%
							boolean isStampato = false;
							
							
							%>
							<div class="row cntr justify-content-jusitfy"> 
								<label id="address_selector" class="radio">
							<%	
								if(address == null || address.equals(null))
								{
									if(!isStampato)
									{
							%>
								<div class="row">
									<span class="glyphicon glyphicon-plus plus2"></span><p id="newInd" class="ordinePar"><a herf="#">Inserisci un nuovo indirizzo</p></a>
								</div>
								<div class="row justify-content-start" id="inputNewInd2">
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-4">
												<input type="text" class="form-input indSpacer1" name="indirizzo"  id="address" placeholder="Inserisci Indirizzo">
											</div>
											<div class="col-md-4">
												<input type="text" class="form-input indSpacer1" name="città" id="city" placeholder="Inserisci cap">
											</div>
											<div class="col-md-3">
												<div class="row justify-content-center">
													<input type="text" class="form-input3 indSpacer3" id="cap" maxlength="5" name="cv" placeholder="numero civico">
												</div>
											</div>
										</div>
										<div class="row justify-content-center">
											<input type="button" class="site-btn6" style="margin-top: 20px; margin-right: 120px;" value="Salva Indirizzo" id="CreateNewAddress">
										</div>
									</div>
								</div>
							<%
										isStampato = true;
									}
								}
								else
								{
							%>
									<input type="radio" name="addressopt" value="<%=address%>" id="opt1" class="hidden">
									
									
									<span class="label"></span>
									<p class="ordinePar"><%=address%></p>
							<%
								}							
							%>
							</label>											
						</div>
					</div>
						<!-- codice generato -->												
					<div class="col-md-6 spacerMethod_payment">
						<div class="row justify-content-center">
							<div class="col-md-5">
								<h4 class="ordH4">Seleziona il metodo di pagamento</h4>
							</div>
						</div>
						
						<!-- codice generato -->
						<% 
						isStampato = false;
						ArrayList<PaymentMethodBean> paymentMethods = model_payment.doRetrieveByEmail(utenteLoggato.getEmail());
						
						if(paymentMethods.size()==0)
						{
							%>
							<div class="row cntr justify-content-start"> 
								<label class="radio newPaymentMethod">
									<span class="glyphicon glyphicon-plus plus2"></span><p id="newCard" class="ordinePar"><a herf="#">Inserisci un nuovo metodo di pagamento</p></a>
								</label>
							</div>
							<div class="row" id="inputNewCard2">
								<form action="InsertPaymentMethod" method="GET">
									<div class="row justify-content-start" >
										<div class="col-md-5">
											<select class="custom-select" name="card_selector" id="card_selector">
												<option disabled hidden selected>TIPO CARTA</option>
												<option value=1>PayPal</option>
												<option value=2>Carta di Credito</option>
												<option value=3>Carta del Docente</option>
												<option value=4>PostePay</option>
											</select>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-input2" id="codcarta" name="codcarta" maxlength="19" placeholder="Codice Carta">
										</div>
									</div>
									<div class="row justify-content-start" style="margin-top: 20px;">
										<div class="col-md-5">
											<input type="password" class="form-input4" name="codcvc" maxlength="3" placeholder="Codice CVC">
										</div>
										<div class="col-md-7">
											<input type="date" name="dataexpcarta" id="dataexpcarta">
										</div>
									</div>
									<div class="row justify-content-center">
										<input type="Submit" class="site-btn7" value="Salva Carta" style="margin-top: 25px;">
									</div>
								</form>
							</div>
						
							<%
							isStampato = true;
							
						}
						
						for(int i = 0;i < paymentMethods.size(); i++) 
						{
							paymentBean = paymentMethods.get(i);
							%>
							<div class="row cntr justify-content-start spacerCards"> 
								<label class="radio">
									<input type="radio" name="payment_method_opt" id="opt3" value="<%=paymentBean.getCard_bank()%>" class="hidden">
									<span class="label"></span>
									<p class="ordinePar2"><%=paymentBean.getCard_bank()%> - &#8226;&#8226;&#8226;&#8226; &#8226;&#8226;&#8226;&#8226; &#8226;&#8226;&#8226;&#8226; <%=paymentBean.getCard_number().substring(14)%></p>
								</label>											
							</div>
							<%	
								if(!isStampato && i < paymentMethods.size() )
									{
										%>
										<div class="row cntr justify-content-start"> 
										<label class="radio newPaymentMethod">
											<span class="glyphicon glyphicon-plus plus2"></span><p id="newCard" class="ordinePar"><a herf="#">Inserisci un nuovo metodo di pagamento</p></a>
										</label>
										</div>
										<div class="row" id="inputNewCard2">
											<form action="InsertPaymentMethod" method="get">
												<div class="row justify-content-start">
													<div class="col-md-5">
														<select class="custom-select" name="card_selector" id="card_selector">
															<option disabled hidden selected>TIPO CARTA</option>
															<option value=1>PayPal</option>
															<option value=2>Carta di Credito</option>
															<option value=3>Carta del Docente</option>
															<option value=4>PostePay</option>
														</select>
													</div>
													<div class="col-md-7">
														<input type="text" class="form-input2" id="codcarta" name="codcarta" maxlength="19" placeholder="Codice Carta">
													</div>
												</div>
												<div class="row justify-content-start" style="margin-top: 20px;">
													<div class="col-md-5">
														<input type="password" class="form-input4" name="codcvc" maxlength="3" placeholder="Codice CVC">
													</div>
													<div class="col-md-7">
														<input type="date" class="prova312" name="dataexpcarta" id="dataexpcarta">
													</div>
												</div>
												<div class="row justify-content-center">
													<input type="Submit" class="site-btn7" value="Salva Carta" style="margin-top: 25px;">
												</div>
											</form>
										</div>

										<%
										isStampato = true;
									}
						}
						
						
								%>
						
						</div>	
						<!-- codice generato -->
					</div>
						
				<div class="row justify-content-center">
					<input type="checkbox" id="cbx" style="display: none;">
						<label for="cbx" class="check">
							<svg width="18px" height="18px" viewBox="0 0 18 18">
								<path d="M1,9 L1,3.5 C1,2 2,1 3.5,1 L14.5,1 C16,1 17,2 17,3.5 L17,14.5 C17,16 16,17 14.5,17 L3.5,17 C2,17 1,16 1,14.5 L1,9 Z"></path>
								<polyline points="1 9 7 14 15 4"></polyline>
							</svg>
						</label>
					<p class="ordineCheck">Selezionando questa spunta dichiari di aver visionato la Nostra <a href="#">Informativa sugli acquisti</p></a>
				</div>
				<div class="row spacer-ordbutton justify-content-center">
					<input type="Submit" class="site-btn3" value="ACQUISTA ORA">
				</div>
			</div>
		</form>
	</section>
	
	<!-- Prodotto Singolo section END -->
	
	<!-- Footer section -->
		<%@ include file="fragment/footer.jsp" %>
	<!-- Footer section end -->
	
	
	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>
	
	<script>
	
		$("#newInd").on('click', function() {
			$("#inputNewInd2").fadeToggle();
		});
		
		$("#newCard").on('click', function() {
			$("#inputNewCard2").fadeToggle();
		});
	
		// questo è l'equivalente di $(document).ready
		document.addEventListener("DOMContentLoaded", function(event) { 
			calcolaTot();
		});
	
			function calcolaTot()		//si controlla prima la qnt se è disponibile per l'acquisto. Se questo è verofocato si procede con il calcolo del prezzo tot
			{			
				// questa funzione considera i prodotti uno ad uno (va dall'alto verso il basso)
				var quantities = document.getElementsByName("qnt_selector");
				var prices = document.getElementsByName("priceProd");
	
				var qntXprice;
				var tot = 0.00;
				
				i=0; 	// quantities[i] è relativa a prices[i]
				while(i<quantities.length && i<prices.length)
				{
					qntXprice = quantities[i].value * prices[i].value; 
					tot += qntXprice;
					i++;
				}
				var price = tot;
				document.getElementById("totalOrderPrice").innerHTML = "<input type=\"hidden\" name=\"totalOrderPrice\" value="+tot+"><p id=\"ordProd\" class=\"totordspacer\">Totale ordine: "+price+"&#128;</p>";
			}
			
			
			//funzione JQuery per selezionare la quantità relativa al menù select cliccato
			//N.B si usano più IDs con lo stesso valore
			$("[id ='qnt_selector']").on('change', function catchQnt(){
			    var url = $(this).prev().val();			    
			    var type_prod = getURLParameter(url, 'type_prod');			  
			    var model_prod = getURLParameter(url, 'model_prod');			  
			    var qnt_prod = $(this).val();			   
			    //calling the ajax function
			    checkQnt(type_prod, model_prod, qnt_prod);
			});
			
			function getURLParameter(url, name) {
			    return (RegExp(name + '=' + '(.+?)(&|$)').exec(url)||[,null])[1];
			}
			
			function checkQnt(type_prod, model_prod, qnt_prod){
				var value4 = ("addQuantity");
			    $.ajax({
			        type: "POST",
			        url: "Product",
			        data: {"type_prod" : type_prod, "model_prod" : model_prod, "qnt_to_add" : qnt_prod, "action" : value4},
			        success: function(results){
			        		calcolaTot()
			        },
			       	error: function(results){
			       		Swal.fire({
				  			  title: 'Quantità non disponibile!',
				  			  timer: 1100,
				  			  type: 'warning',
				  			  showCancelButton: false,
				  			  showConfirmButton: false,
				  			  width: '400px',
				  			})
				  		setTimeout(location.reload.bind(location), 1250);	
			       	},
			    });
			};
			
			// funzione ajax per aggiungere un nuovo indirizzo
			$("#CreateNewAddress").on('click', function createAddress(){
			var value1 = $(this).parent().prev().find("input#address").val();
			var value2 = $(this).parent().prev().find("input#city").val();
			var value3 = $(this).parent().prev().find("input#province").val();
			var value4 = $(this).parent().prev().find("input#cap").val();
			var value5 = $("#username").val();			
				Swal.fire({ //PRIMO POPUP
				  title: "Sei sicuro di voler eliminare il metodo di pagamento?",
				  text: "Il metodo sarà eliminato permanentemente.",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Elimina',
				  cancelButtonText: 'Annulla',
				}).then((result) => {
				  if (result.value) {
					  $.ajax({ //INVOCAZIONE AJAX
						  	type: "GET",
						    url: "InsertAddress",
						    data: {"indirizzo": value1, "citta": value2, "provincia": value3, "cap": value4, "username":value5},
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
			
	</script>
	
	
	
</body>

</html>