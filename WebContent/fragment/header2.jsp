<%@page 
	language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Powerfulrig.Bean.*"
    import="com.Powerfulrig.controller.*"    
    import="com.Powerfulrig.Model.*"    
    import="com.Powerfulrig.Util.*"
    import="java.util.*"
    
    
%>

<head>
	
	<!-- SweetAlert v2.0 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>  
	
</head>
<%
 
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	
%>

<body>
	<header class="sezioneHeader1">
		<div class="container-fluid header-background">
			<div class="row">
				<div class="header-left col-md-3">
					<div class="row">
						<a href="home.jsp" class="site-logo">
							<img src="./img/logotech.png" alt="">
						</a>
					</div>
				</div>
				<div class="header-center col-md-7">
					<nav class="top-nav-area">
						<div class="bg"></div>
						<ul class="row main-menu">
							<li><a href="catalogo.jsp"><b>Prodotti</b></a>
								<ul class="sub-menu">
									<li><a href="Product?action=Cpu_comp&comp_name=Processori">Processori</a></li>
									<li><a href="Product?action=Gpu_comp&comp_name=Schede Grafiche">Schede Grafiche</a></li>
									<li><a href="Product?action=ram_comp&comp_name=RAM">RAM</a></li>
									<li><a href="Product?action=storage_comp&comp_name=Archiviazione">Archiviazione</a></li>
									<li><a href="Product?action=Psu_comp&comp_name=Alimentatori">Alimentatori</a></li>
									<li><a href="Product?action=motherboard_comp&comp_name=Schede Madre">Scheda Madre</a></li>								
									<li><a href="Product?action=heatsink_comp&comp_name=Dissipatori">Dissipatore</a></li>
									<li><a href="Product?action=Case_comp&comp_name=Case">Case</a></li>
									<li><a href="Product?action=Monitor_comp&comp_name=Monitor">Monitor</a></li>
									<li><a href="Product?action=keyboard_comp&comp_name=Tastiere">Tastiere</a></li>
									<li><a href="Product?action=mouse_comp&comp_name=Mouse">Mouse</a></li>
									<li><a href="Product?action=headphones_comp&comp_name=Cuffie">Cuffie</a></li>
									<li><a href="Product?action=Sedia_comp&comp_name=Sedie Gaming">Sedie Gaming</a></li>
									<li><a href="Product?action=Pc_comp&comp_name=Configurazioni">Configurazioni</a></li>
								</ul>
							</li>
							<li><a href="Product?action=prodottiscontati"><b>Ultime novità</b></a></li>
							<li><a href="chisiamo.jsp"><b>Info</b></a></li>
							<li><a href="contatti.jsp"><b>Contattaci</b></a></li>
						</ul>
					</nav>
				</div>
				<div class="header-right col-md-2">
					<div class="row user-option" id="uo1">
						<div class="col-md-3">
							<i class="glyphicon glyphicon-user men"> </i>
						</div>
									
				
								<% 
											Utente utenteLoggato;
											synchronized(session) 
											{
												utenteLoggato = (Utente) request.getSession().getAttribute("utenteLoggato"); 
											}
											if(utenteLoggato!=null) 
											{
												if((utenteLoggato.getTipo()).equals("user")){ %>
													<div class="col-md-6">
														<a href="area-utente.jsp"><%=utenteLoggato.getNome()%>  </a>
													</div>
													<div class="col-md-2">
														<a href="#"><i class="glyphicon glyphicon-log-out log-out" onclick="logout()"> </i></a>
													</div>
											<%} else{ %>
													<div class="col-md-6">
														<a href="area-admin.jsp" style = "font-size:10px">Admin:<%=utenteLoggato.getEmail()%></a>													
													</div>
													<div class="col-md-2">
														<a href="#"><i class="glyphicon glyphicon-log-out log-out" onclick="logout()"> </i></a>
													</div>
												<%} %>
												
											<%} else {%>
												<a href="log-area.jsp" style="margin-left:10px;">Utente</a>
										<%} %>					
					</div>
					
					<% if(utenteLoggato != null)
						{%>					
 						<div class="row user-option" id="uo2">
							<i class="glyphicon glyphicon-cog cog"> </i> 
							<a href="configurazioni.jsp">Configurazioni</a>
						</div>
						
					<%	}
						else
						{%>
						<div class="row user-option" id="uo2">
							<i class="glyphicon glyphicon-cog cog"> </i> 
							<a href="log-area.jsp">Configurazioni</a>
						</div>
						<%}%>
						
					<div class="row user-option" id="uo3">
						<i class="glyphicon glyphicon-shopping-cart cart"> </i> 
						<%	Cart cart;
							synchronized(session) 
							{ 
								cart = (Cart) request.getSession().getAttribute("Carrello");
							} %>
						<%	if(cart==null || cart.getProducts().isEmpty()) { %>
						<a href="#" id="cartdrop">Carrello</a>
					</div>
						<div class="apri">
							<div class="carrello">
								<div class="row setupRow">
									<div class="col-md-12">
										<h4 class="cartH4noElem">Nessun prodotto presente nel carrello!</h4>
									</div>
								</div>
							</div>
						</div>
						<% 	} else { 
							ArrayList<Prodotto> arraycart = cart.getProducts();
						%>
						<a href="#" id="cartdrop">Carrello</a>
					</div>
						<div class="apri">
							<div class="carrello">
							<% for(int I=0;I<arraycart.size();I++) {%>
								<div class="row setupRow">
									<div class="col-md-3">
										<img src=<%=arraycart.get(I).getImmagine()+"/img1.jpg"%> width="50" height="50" class="imgItem8">
									</div>
									<div class="col-md-6">
										<a id="productInCart" href="Product?action=prodotto&type_prod=<%=arraycart.get(I).getTipo()%>&model_prod=<%=arraycart.get(I).getModello()%>"><h4 class="cartH4"><%=arraycart.get(I).getNome()%></h4></a>
									</div>
									<div class="col-md-3">
										<h3 class="cartH3"><%=arraycart.get(I).getPrezzo()%> &euro;</h3>
										<i id="trashDel" class="glyphicon glyphicon-trash trash2" style="cursor: pointer;"> </i>
									</div>
								</div>
							<% } %>
							</div>
							<div class="row setupRow2 justify-content-center">
								<div class="col-md-12">
								<% 	if(utenteLoggato!=null) 
									{ %>
									<a href="checkout.jsp"><input type="button" class="site-btn6 setupbtncart2" value="ACQUISTA ORA"></a>
								<%	} else { %>
									<a href="log-area.jsp"><input type="button" class="site-btn6 setupbtncart2" value="ACQUISTA ORA"></a>
								<% 	} %>
								</div>
							</div>
						</div>
						<% 	} %>
			</div>
		</div>
	</header>	
	
	<script>
			
		function logout(){
			var value = ("logout");
			Swal.fire({
			  title: 'Sei sicuro di voler effettuare il Logout?',
			  text: "Tutti i progressi ed il carrello verranno eliminati.",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Logout',
			  cancelButtonText: 'Annulla'
			}).then((result) => {
 			  if (result.value) {
				  $.ajax({
					  	type: "POST",
					    url: "Utente",
					    data: {"action" : value},
					    success: function(results){
					    	Swal.fire({
					  			  title: 'Logout Effettuato',
					  			  timer: 1200,
					  			  type: 'success',
					  			  showCancelButton: false,
					  			  showConfirmButton: false,
					  			  width: '400px',
					  			})
					  		setTimeout(function(){location.href="home.jsp"} , 1350);   
						  }
					})
			  	}
			})
		};
		
		$("[id ='trashDel']").on('click', function deletefromcart(){
		    var url = $(this).parent().prev().children().attr("href");		//attraversamento del DOM a ritroso
		    var type_prod = getURLParameter(url, 'type_prod');
		    var model_prod = getURLParameter(url, 'model_prod');
		    //calling the ajax function
		    delfromCart(type_prod, model_prod);
		});
		
		function getURLParameter(url, name) {
		    return (RegExp(name + '=' + '(.+?)(&|$)').exec(url)||[,null])[1];
		}
		
		function delfromCart(type_prod, model_prod){
			var value3 = ("deleteProd");
		    $.ajax({
		        type: "POST",
		        url: "Product",
		        data: {"type_prod" : type_prod, "model_prod" : model_prod, "action" : value3},
		        success: function(results){
		        	location.reload(true)
		        },
		    });
		};
		
		
		$("#cartdrop").on('click', function() {
			$(".apri").toggle();
		});
	
		$(document).mouseup(function(e) 
		{
			var container2 = $(".apri");
			
			if (!container2.is(e.target) && container2.has(e.target).length === 0) 
			{
	        	container2.hide();
			}
		});
		
	</script>
</body>
