<%@page language="java" 
		contentType="text/html; charset=ISO-8859-1"
		import="com.Powerfulrig.Bean.*"
    	pageEncoding="ISO-8859-1"
%>

<%

	UserConfigurationBean bean = (UserConfigurationBean) request.getAttribute("conf");

	DAOProdotto model_prod = new DAOProdotto();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>PR - Configurazione</title>
	
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

	<section class="confSing-section">
		<div class="container">
			<div class="row justify-content-center">
					<h1>CONFIGURAZIONE - <%=bean.getname_configuration() %></h1>
			</div>
		</div>
		<div class="container border-confSingPage">
			<div class="row">
				<%
				if(bean.getCpu_in_configuration()==null || bean.getCpu_in_configuration().isEmpty())
				{
				%>
				<div class="col-xl-2">
					<a href="Product?action=Cpu_comp&comp_name=Processori"><img src="img/plus.png" width="150" height="150" class="imgItem6"></a>
				</div>
				<div class="col-xl-2">
					<div class="row" id="spacerConf">
						<div>
							<p id="titleConf">Inserire Processore</p>
							<p id="pConf"></p>
						</div>
					</div>
				</div>
				<%
				} else {
					Prodotto prod_bean = model_prod.viewProduct("IdProdotto",bean.getCpu_in_configuration()).get(0);
					
				%>	
				<div class="col-xl-2">
					<a href="Product?action=prodotto&type_prod=<%=prod_bean.getTipo()%>&model_prod=<%=prod_bean.getModello()%>"><img src=<%=prod_bean.getImmagine()+"/img1.jpg"%> width="150" height="150" class="imgItem6"></a>	
					
					<i class="glyphicon glyphicon-trash trash" id="removeCompIcon"></i>
				</div>
				<div class="col-xl-2" id="spacerConf3">
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Marca: </p>
							<p id="pConf"><%=prod_bean.getMarca()%></p>
							<input type="hidden" id="model_prod" value="<%=prod_bean.getModello()%>">
							<input type="hidden" id="id_comp" value="<%=prod_bean.getTipo()%>">
							<input type="hidden" id="id_conf" value="<%=bean.get_id_configuration()%>">
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Modello: </p>
							<p id="pConf"><%=prod_bean.getModello()%></p>
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
						<% int s=prod_bean.getPercentualeSconto();
						s=100-s;
						float prezzo = (s*prod_bean.getPrezzo()/100);%>
						<p id="titleConf">Prezzo: </p>
						<p id="pConf"> <%=String.format(Locale.US,"%.2f", prezzo)%> &euro; </p>
						</div>
					</div>
				</div>
				<%
				}

				if(bean.getGpu_in_configuration()==null || bean.getGpu_in_configuration().isEmpty())
				{
				%>
				<div class="col-xl-2">
					<a href="Product?action=Gpu_comp&comp_name=Schede Grafiche"><img src="img/plus.png" width="150" height="150" class="imgItem6"></a>
				</div>
				<div class="col-xl-2">
					<div class="row" id="spacerConf">
						<div>
							<p id="titleConf">Inserire Scheda Grafica</p>
							<p id="pConf"></p>
						</div>
					</div>
				</div>
				<%
				} else {
					Prodotto prod_bean = model_prod.viewProduct("IdProdotto",bean.getGpu_in_configuration()).get(0);
				%>	
				<div class="col-xl-2">
					<a href="Product?action=prodotto&type_prod=<%=prod_bean.getTipo()%>&model_prod=<%=prod_bean.getModello()%>"><img src=<%=prod_bean.getImmagine()+"/img1.jpg"%> width="150" height="150" class="imgItem6"></a>	
					<i class="glyphicon glyphicon-trash trash" style="cursor: pointer;"  id="removeCompIcon"></i>
				</div>
				<div class="col-xl-2" id="spacerConf3">
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Marca: </p>
							<p id="pConf"><%=prod_bean.getMarca()%></p>
							<input type="hidden" id="model_prod" value="<%=prod_bean.getModello()%>">
							<input type="hidden" id="id_comp" value="<%=prod_bean.getTipo()%>">
							<input type="hidden" id="id_conf" value="<%=bean.get_id_configuration()%>">
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Modello: </p>
							<p id="pConf"><%=prod_bean.getModello()%></p>
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
						<% int s=prod_bean.getPercentualeSconto();
						s=100-s;
						float prezzo = (s*prod_bean.getPrezzo()/100);%>
						<p id="titleConf">Prezzo: </p>
						<p id="pConf"> <%=String.format(Locale.US,"%.2f", prezzo)%> &euro; </p>
						</div>
					</div>
				</div>
				<%
				}

				if(bean.getMotherboard_in_configuration()==null || bean.getMotherboard_in_configuration().isEmpty())
				{
				%>
				<div class="col-xl-2">
					<a href="Product?action=motherboard_comp&comp_name=Schede Madre"><img src="img/plus.png" width="150" height="150" class="imgItem6"></a>
				</div>
				<div class="col-xl-2">
					<div class="row" id="spacerConf">
						<div>
							<p id="titleConf">Inserire Scheda Madre</p>
							<p id="pConf"></p>
						</div>
					</div>
				</div>
				<%
				} else {
					Prodotto prod_bean = model_prod.viewProduct("IdProdotto",bean.getMotherboard_in_configuration()).get(0);
				%>	
				<div class="col-xl-2">
					<a href="Product?action=prodotto&type_prod=<%=prod_bean.getTipo()%>&model_prod=<%=prod_bean.getModello()%>"><img src=<%=prod_bean.getImmagine()+"/img1.jpg"%> width="150" height="150" class="imgItem6"></a>	
					<i class="glyphicon glyphicon-trash trash" id="removeCompIcon"></i>
				</div>
				<div class="col-xl-2" id="spacerConf3">
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Marca: </p>
							<p id="pConf"><%=prod_bean.getMarca()%></p>.
							<input type="hidden" id="model_prod" value="<%=prod_bean.getModello()%>">
							<input type="hidden" id="id_comp" value="<%=prod_bean.getTipo()%>">
							<input type="hidden" id="id_conf" value="<%=bean.get_id_configuration()%>">
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Modello: </p>
							<p id="pConf"><%=prod_bean.getModello()%></p>
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<% int s=prod_bean.getPercentualeSconto();
						s=100-s;
						float prezzo = (s*prod_bean.getPrezzo()/100);%>
						<p id="titleConf">Prezzo: </p>
						<p id="pConf"> <%=String.format(Locale.US,"%.2f", prezzo)%> &euro; </p>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="row">
				<%
				if(bean.getRam_in_configuration()==null || bean.getRam_in_configuration().isEmpty())
				{
				%>
				<div class="col-xl-2">
					<a href="Product?action=ram_comp&comp_name=RAM"><img src="img/plus.png" width="150" height="150" class="imgItem6"></a>
				</div>
				<div class="col-xl-2">
					<div class="row" id="spacerConf">
						<div>
							<p id="titleConf">Inserire Memoria RAM</p>
							<p id="pConf"></p>
						</div>
					</div>
				</div>
				<%
				} else {
					Prodotto prod_bean = model_prod.viewProduct("IdProdotto",bean.getRam_in_configuration()).get(0);
				%>	
				<div class="col-xl-2">
					<a href="Product?action=prodotto&type_prod=<%=prod_bean.getTipo()%>&model_prod=<%=prod_bean.getModello()%>"><img src=<%=prod_bean.getImmagine()+"/img1.jpg"%> width="150" height="150" class="imgItem6"></a>	
					<i class="glyphicon glyphicon-trash trash" id="removeCompIcon"></i>
				</div>
				<div class="col-xl-2" id="spacerConf3">
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Marca: </p>
							<p id="pConf"><%=prod_bean.getMarca()%></p>
							<input type="hidden" id="model_prod" value="<%=prod_bean.getModello()%>">
							<input type="hidden" id="id_comp" value="<%=prod_bean.getTipo()%>">
							<input type="hidden" id="id_conf" value="<%=bean.get_id_configuration()%>">
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Modello: </p>
							<p id="pConf"><%=prod_bean.getModello()%></p>
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<% int s=prod_bean.getPercentualeSconto();
						s=100-s;
						float prezzo = (s*prod_bean.getPrezzo()/100);%>
						<p id="titleConf">Prezzo: </p>
						<p id="pConf"> <%=String.format(Locale.US,"%.2f", prezzo)%> &euro; </p>
						</div>
					</div>
				</div>
				<%
				}

				if(bean.getpsu_in_configuration()==null || bean.getpsu_in_configuration().isEmpty())
				{
				%>
				<div class="col-xl-2">
					<a href="Product?action=Psu_comp&comp_name=Alimentatori"><img src="img/plus.png" width="150" height="150" class="imgItem6"></a>
				</div>
				<div class="col-xl-2">
					<div class="row" id="spacerConf">
						<div>
							<p id="titleConf">Inserire Alimentatore</p>
							<p id="pConf"></p>
						</div>
					</div>
				</div>
				<%
				} else {
					Prodotto prod_bean = model_prod.viewProduct("IdProdotto",bean.getpsu_in_configuration()).get(0);
				%>	
				<div class="col-xl-2">
					<a href="Product?action=prodotto&type_prod=<%=prod_bean.getTipo()%>&model_prod=<%=prod_bean.getModello()%>"><img src=<%=prod_bean.getImmagine()+"/img1.jpg"%> width="150" height="150" class="imgItem6"></a>	
					<i class="glyphicon glyphicon-trash trash" id="removeCompIcon"></i>
				</div>
				<div class="col-xl-2" id="spacerConf3">
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Marca: </p>
							<p id="pConf"><%=prod_bean.getMarca()%></p>
							<input type="hidden" id="model_prod" value="<%=prod_bean.getModello()%>">
							<input type="hidden" id="id_comp" value="<%=prod_bean.getTipo()%>">
							<input type="hidden" id="id_conf" value="<%=bean.get_id_configuration()%>">
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Modello: </p>
							<p id="pConf"><%=prod_bean.getModello()%></p>
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<% int s=prod_bean.getPercentualeSconto();
						s=100-s;
						float prezzo = (s*prod_bean.getPrezzo()/100);%>
						<p id="titleConf">Prezzo: </p>
						<p id="pConf"> <%=String.format(Locale.US,"%.2f", prezzo)%> &euro; </p>
						</div>
					</div>
				</div>
				<%
				}

				if(bean.getStorage_in_configuration()==null || bean.getStorage_in_configuration().isEmpty())
				{
				%>
				<div class="col-xl-2">
					<a href="Product?action=storage_comp&comp_name=Archiviazione"><img src="img/plus.png" width="150" height="150" class="imgItem6"></a>
				</div>
				<div class="col-xl-2">
					<div class="row" id="spacerConf">
						<div>
							<p id="titleConf">Inserire HDD/SSD</p>
							<p id="pConf"></p>
						</div>
					</div>
				</div>
				<%
				} else {
					Prodotto prod_bean = model_prod.viewProduct("IdProdotto",bean.getStorage_in_configuration()).get(0);
				%>	
				<div class="col-xl-2">
					<a href="Product?action=prodotto&type_prod=<%=prod_bean.getTipo()%>&model_prod=<%=prod_bean.getModello()%>"><img src=<%=prod_bean.getImmagine()+"/img1.jpg"%> width="150" height="150" class="imgItem6"></a>	
					<i class="glyphicon glyphicon-trash trash" id="removeCompIcon"></i>
				</div>
				<div class="col-xl-2" id="spacerConf3">
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Marca: </p>
							<p id="pConf"><%=prod_bean.getMarca()%></p>	
							<input type="hidden" id="model_prod" value="<%=prod_bean.getModello()%>">
							<input type="hidden" id="id_comp" value="<%=prod_bean.getTipo()%>">
							<input type="hidden" id="id_conf" value="<%=bean.get_id_configuration()%>">
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Modello: </p>
							<p id="pConf"><%=prod_bean.getModello()%></p>
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<% int s=prod_bean.getPercentualeSconto();
						s=100-s;
						float prezzo = (s*prod_bean.getPrezzo()/100);%>
						<p id="titleConf">Prezzo: </p>
						<p id="pConf"> <%=String.format(Locale.US,"%.2f", prezzo)%> &euro; </p>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="row justify-content-center">
				<%
				if(bean.getCase_in_configuration()==null || bean.getCase_in_configuration().isEmpty())
				{
				%>
				<div class="col-xl-2">
					<a href="Product?action=Case_comp&comp_name=Case"><img src="img/plus.png" width="150" height="150" class="imgItem6"></a>
				</div>
				<div class="col-xl-2">
					<div class="row" id="spacerConf">
						<div>
							<p id="titleConf">Inserire Case</p>
							<p id="pConf"></p>
						</div>
					</div>
				</div>
				<%
				} else {
					Prodotto prod_bean = model_prod.viewProduct("IdProdotto",bean.getCase_in_configuration()).get(0);
				%>	
				<div class="col-xl-2">
					<a href="Product?action=prodotto&type_prod=<%=prod_bean.getTipo()%>&model_prod=<%=prod_bean.getModello()%>"><img src=<%=prod_bean.getImmagine()+"/img1.jpg"%> width="150" height="150" class="imgItem6"></a>	
					<i class="glyphicon glyphicon-trash trash" id="removeCompIcon"></i>
				</div>
				<div class="col-xl-2" id="spacerConf3">
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Marca: </p>
							<p id="pConf"><%=prod_bean.getMarca()%></p>
							<input type="hidden" id="model_prod" value="<%=prod_bean.getModello()%>">
							<input type="hidden" id="id_comp" value="<%=prod_bean.getTipo()%>">
							<input type="hidden" id="id_conf" value="<%=bean.get_id_configuration()%>">
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Modello: </p>
							<p id="pConf"><%=prod_bean.getModello()%></p>
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<% int s=prod_bean.getPercentualeSconto();
						s=100-s;
						float prezzo = (s*prod_bean.getPrezzo()/100);%>
						<p id="titleConf">Prezzo: </p>
						<p id="pConf"> <%=String.format(Locale.US,"%.2f", prezzo)%> &euro; </p>
						</div>
					</div>
				</div>
				<%
				}

				if(bean.getHeatsink_in_configuration()==null || bean.getHeatsink_in_configuration().isEmpty())
				{
				%>
				<div class="col-xl-2">
					<a href="Product?action=heatsink_comp&comp_name=Dissipatori"><img src="img/plus.png" width="150" height="150" class="imgItem6"></a>
				</div>
				<div class="col-xl-2">
					<div class="row" id="spacerConf">
						<div>
							<p id="titleConf">Inserire Dissipatore</p>
							<p id="pConf"></p>
						</div>
					</div>
				</div>
				<%
				} else {
					Prodotto prod_bean = model_prod.viewProduct("IdProdotto",bean.getHeatsink_in_configuration()).get(0);
				%>	
				<div class="col-xl-2">
					<a href="Product?action=prodotto&type_prod=<%=prod_bean.getTipo()%>&model_prod=<%=prod_bean.getModello()%>"><img src=<%=prod_bean.getImmagine()+"/img1.jpg"%> width="150" height="150" class="imgItem6"></a>	
					<i class="glyphicon glyphicon-trash trash" id="removeCompIcon"></i>
				</div>
				<div class="col-xl-2" id="spacerConf3">
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Marca: </p>
							<p id="pConf"><%=prod_bean.getMarca()%></p>
							<input type="hidden" id="model_prod" value="<%=prod_bean.getModello()%>">
							<input type="hidden" id="id_comp" value="<%=prod_bean.getTipo()%>">
							<input type="hidden" id="id_conf" value="<%=bean.get_id_configuration()%>">
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
							<p id="titleConf">Modello: </p>
							<p id="pConf"><%=prod_bean.getModello()%></p>
						</div>
					</div>
					<div class="row" id="spacerConf2">
						<div>
						<% int s=prod_bean.getPercentualeSconto();
						s=100-s;
						float prezzo = (s*prod_bean.getPrezzo()/100);%>
						<p id="titleConf">Prezzo: </p>
						<p id="pConf"> <%=String.format(Locale.US,"%.2f", prezzo)%> &euro; </p>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>	
			<div class="row justify-content-center" id="spacerTOT">
				<h7 id=titleTOTConf>Prezzo Totale: </h7>
				<p id="pTOTConf"><%=String.format(Locale.US,"%.2f", bean.getConfiguration_price())%> &euro;</p>
			</div>
			<div class="row spacer-ordbutton justify-content-center">
				<input type="hidden" id="id_conf" value="<%=bean.get_id_configuration()%>">
				<input type="button" class="site-btn3" id="buyConfigurationButton" value="ACQUISTA ORA">
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
	
	<script>
	
	$('#buyConfigurationButton').on('click', function buyConfiguration(){
		var value1 = "buyConfiguration";
		var value2 = $('#id_conf').val();
		$.ajax({
			type: "POST",
			url: "UserConfiguration",
			data: {"action": value1, "id_conf": value2},
			});
		setTimeout(function(){location.href="checkout.jsp"} , 500);  
	});
	
	
	// funzione jquery per eliminare la componente selezionata dalla configurazione
	$("[id ='removeCompIcon']").on('click', function deleteComponent(){
			var value1 = $(this).parent().next().find("input#id_comp").val();			
			var value2 = $('#id_conf').val();
			var value3 = $(this).parent().next().find("input#model_prod").val();	
			alert("l'id è "+value1);
		    $.ajax({
		        type: "POST",
		        url: "UserConfiguration",
		        data: {"action" : "deleteComponent", "id_comp" : value1, "id_conf" : value2, "model_comp": value3},
		        success: function(results){
		        	Swal.fire({
		  			  title: 'Eliminata dalla configurazione',
		  			  timer: 1200,
		  			  type: 'success',
		  			  showCancelButton: false,
		  			  showConfirmButton: false,
		  			  width: '600px',
		  			})
		  			setTimeout(location.reload.bind(location), 1850);
		        },
		        error: function (result){
		        	Swal.fire({
			  			 title: 'Non ï¿½ stato possibile eliminarla dalla configurazione',
			  			 timer: 12000,
			  			 type: 'error',
			  			 showCancelButton: false,
			  			 showConfirmButton: false,
			  			 width: '700px'
			  		})
		        }
		    });
		});
			
	
	</script>

	</body>
</html>