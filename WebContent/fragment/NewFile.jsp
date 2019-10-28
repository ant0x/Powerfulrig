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
	<header class="sezioneHeader">
	<nav class="navbar navbar-expand-lg navbar-dark">
	  <a href="home.jsp" class="navbar-brand site-logo">
			<img src="./img/logotech.png" alt="">
			</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menuToggler" aria-controls="menuToggler" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" style="background-color: #001a1a;" id="menuToggler">
	    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
	    <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="catalogo.jsp" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <b>Prodotti</b>
	        </a>
	        <div class="dropdown-menu bg-info" aria-labelledby="navbarDropdownMenuLink">
	            <a class="dropdown-item" href="Product?action=Cpu_comp&comp_name=Processori">Processori</a>
				<a class="dropdown-item" href="Product?action=Gpu_comp&comp_name=Schede Grafiche">Schede Grafiche</a>
				<a class="dropdown-item" href="Product?action=ram_comp&comp_name=RAM">RAM</a>
				<a class="dropdown-item" href="Product?action=storage_comp&comp_name=Archiviazione">Archiviazione</a>
				<a class="dropdown-item" href="Product?action=Psu_comp&comp_name=Alimentatori">Alimentatori</a>
				<a class="dropdown-item" href="Product?action=motherboard_comp&comp_name=Schede Madre">Scheda Madre</a>							
				<a class="dropdown-item" href="Product?action=heatsink_comp&comp_name=Dissipatori">Dissipatore</a>
				<a class="dropdown-item" href="Product?action=Case_comp&comp_name=Case">Case</a>
				<a class="dropdown-item" href="Product?action=Monitor_comp&comp_name=Monitor">Monitor</a>
				<a class="dropdown-item" href="Product?action=keyboard_comp&comp_name=Tastiere">Tastiere</a>
				<a class="dropdown-item" href="Product?action=mouse_comp&comp_name=Mouse">Mouse</a>
				<a class="dropdown-item" href="Product?action=headphones_comp&comp_name=Cuffie">Cuffie</a>
				<a class="dropdown-item" href="Product?action=Sedia_comp&comp_name=Sedie Gaming">Sedie Gaming</a>
				<a class="dropdown-item" href="Product?action=Pc_comp&comp_name=Configurazioni">Configurazioni</a>
	        </div>
	      </li>
	       <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="catalogo.jsp" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <b>Brand</b>
	        </a>
	        <div class="dropdown-menu bg-info" aria-labelledby="navbarDropdownMenuLink">
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
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="Product?action=lastarrived"><b>Ultime novità</b></a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <b>Info</b>
	        </a>
	        <div class="dropdown-menu bg-info" aria-labelledby="navbarDropdownMenuLink">
	            <a class="dropdown-item" href="chisiamo.jsp">Chi siamo</a>
				<a class="dropdown-item" href="contatti.jsp">Contattaci</a>
	        </div>
	     </ul>
			<div class="searchBarElement  mx-auto">	
			  <form action="Cerca" method="POST">
							<input class="input-large2" id="inputSearch" name="cerca" type="text" placeholder="Cerca nel sito..." onclick="closeOutside()">
							<button class="btn btn-outline-info my-2 my-sm-0 rounded-pill" type="submit">Cerca</button>
							</form>
				  </div>
			<ul class="navbar-nav navbar-right mt-2 mt-lg-0">
			<li class="nav-item">
			
			<% 
											Utente utenteLoggato;
											synchronized(session) 
											{
												utenteLoggato = (Utente) request.getSession().getAttribute("utenteLoggato"); 
											}
											if(utenteLoggato!=null) 
											{
												if((utenteLoggato.getTipo()).equals("user")){ %>
														<a class="nav-link" href="area-utente.jsp"><span class="glyphicon glyphicon-user men"></span><%=utenteLoggato.getNome()%> </a>
														<li class="nav-item"><a class="nav-link" href="#"><span class="d-inline-block glyphicon glyphicon-log-out log-out" onclick="logout()"> </span></a></li>
											<%} else{ %>
														<a class="nav-link" href="area-admin.jsp" style = "font-size:10px"><span class="glyphicon glyphicon-user men"></span>Admin:<%=utenteLoggato.getEmail()%></a>											
														<li class="nav-item"><a class="nav-link" href="#"><span class="d-inline-block glyphicon glyphicon-log-out log-out" onclick="logout()"> </span></a></li>
													
												<%} %>
												
											<%} else {%>
												<a class="nav-link" href="log-area.jsp"><span class="glyphicon glyphicon-user men"></span>Utente</a>
										<%} %>
				
				<li class="nav-item">
								<% if(utenteLoggato != null)
										{%>					
											<a class="nav-link" href="configurazioni.jsp"><span class="glyphicon glyphicon-cog cog"> </span> Configurazioni</a>
									
									<%	}
										else
										{%>
										<a class="nav-link" href="log-area.jsp"><span class="glyphicon glyphicon-cog cog"> </span> Configurazioni</a>
										<%}%>	
				
			</ul>		
				</div>
		</nav>
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
					    url: "Utente1",
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
