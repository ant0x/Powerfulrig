
<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
    	import="java.time.format.DateTimeFormatter"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>TL - Configurazioni</title>
	
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
	
		if(utenteLoggato==null)
		{
			response.sendRedirect("log-area.jsp");
			return;
		}
	
	%>
	
	
	<section class="conf-section">
		<div class="container">
			<div class="row justify-content-center">
					<h1>CONFIGURAZIONI - <%=utenteLoggato.getNome() %></h1>
			</div>
		</div>
		<div class="container border-confPage">
		<%
		
			UserConfigurationDAO model_user_conf = new UserConfigurationDAO();
			ArrayList<UserConfigurationBean> userconfs = model_user_conf.retrieveByUsername(utenteLoggato.getUsername());
			
			int size_userconfs = userconfs.size();
			int I=0;
			int J=0;
				
			while(I<size_userconfs)
			{
				DateTimeFormatter pattern = DateTimeFormatter.ofPattern("dd-MM-yyyy");
				String data = userconfs.get(I).getCreation_date().format(pattern);
			%>
					<div class="row">
						 <div class="yConf">
						 	<div class="row">			
								<div class="col-xl-8">
									<a href="UserConfiguration?action=showConf&id_conf=<%=userconfs.get(I).getId_user_configuration()%>"><p class="confP4" id="confP41"><%=userconfs.get(I).getName_user_configuration()%></p></a>
									<input type="hidden" id="id_conf" value="<%=userconfs.get(I).getId_user_configuration()%>">
								</div>
								<div class="col-xl-3">
									<div class="row">
										<p id="confPP2"><%=data%></p>
									</div>
									<div class="row">
										<p id="confPP3">Prezzo: <%=userconfs.get(I).getConfiguration_price()%> &euro;</p>
									</div>
								</div>
								<div class="col-xl-1">
									<i id="removeConfIcon" class="glyphicon glyphicon-remove remove" style="margin-top: 28px;"> </i>
								</div>
							</div>
						</div>
					</div>
			<%
				I++;
				J++;
			}
			
			I=0;
			while(I<3-J)
			{
			%>
				<div class="row noConf" id="noVis1" onclick="createConf()">
					<div class="col-xl-2">
						<i class="glyphicon glyphicon-plus plus"> </i> 
					</div>
					<div class="col-xl-10">
						<p class="confP" id="confP1">Aggiungi Configurazione</p>
						<input type="hidden" id="username_conf" value="<%=utenteLoggato.getEmail()%>">
					</div>
				</div>
			<%
				I++;
			}
			%>
		</div>
	</section>

	<!-- END SECTION -->

	<!-- Pre-Footer section -->
	     <%@ include file="fragment/pre-footer.jsp" %>
	<!-- Pre-Footer section end -->

	<!-- Footer section -->
		<%@ include file="fragment/footer.jsp" %>
	<!-- Footer section end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>
	
	<script>				
			
		function createConf(){
			(async function getNameConf () {
	
				const {value: nameConf} = await Swal.fire({
				title: 'Inserisci nome Configurazione',
				inputPlaceholder: 'NOME CONFIGURAZIONE',
				input: 'text',
				showCancelButton: true,
				inputValidator: (value) => {
					if (!value) {
				      return 'Errore: inserisci un nome!'
				    }
				  }
				})
				if (nameConf) {
					var username = $('#username_conf').val();
					$.ajax({
						type: "GET",
				        url: "UserConfiguration",
				        data: {"action" : "createConf", "username" : username, "confName" : nameConf}, 
				        success: function(results){
				        	Swal.fire({
				  			  title: 'Configurazione Creata',
				  			  timer: 1700,
				  			  type: 'success',
				  			  showCancelButton: false,
				  			  showConfirmButton: false,
				  			  width: '400px',
				  			})
				  			setTimeout(function(){location.href="configurazioni.jsp"}, 1850);
						}
					})
				}
			})()
		}
		
		//funzione jquery con ajax annidato per eliminare il metodo di pagamento scelto
		$("[id ='removeConfIcon']").on('click', function deleteConf(){	
			var value1 = ("deleteConf");
			var value2 = $(this).parent().parent().find('input#id_conf').val();
				Swal.fire({ //PRIMO POPUP
				  title: "Sei sicuro di voler eliminare la configurazione?",
				  text: "La configurazione sarÃ  eliminata permanentemente.",
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
						    url: "UserConfiguration",
						    data: {"action" : value1, "id_conf" : value2},
						    success: function(results){
						    	Swal.fire({ //SECONDO POPUP
						  			  title: 'Configurazione eliminata',
						  			  timer: 1200,
						  			  type: 'success',
						  			  showCancelButton: false,
						  			  showConfirmButton: false,
						  			  width: '400px',
						  			})
						  			setTimeout(location.reload.bind(location), 1850);   
							  }
						})
				  	}
				});
			});
	
	
	</script>

</body>

</html>
