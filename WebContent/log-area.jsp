<%@page	language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
    	import = "java.util.*"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>PR - Area Utente</title>
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
<!-- Header section start -->
     	  <%@ include file="fragment/header3.jsp" %>
	<!-- Header section end -->	
<body style="background-color:#001a1a">

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	
	<!-- MAIN PAGE login -->

	<div class="main">
		<div class="shop_top" id="loginmargin">
			<div class="container">
				<div class="row">
				<div class="col-md-6">
					<div class="login-page">
						<h4 class="title">Nuovo Utente - Benefici</h4>
						<ul>
							<li>Controlla i tuoi acquisti in qualsiasi momento: Traccia lo status dei tuoi ordini e stampa i tuoi coupon.</li>
							<li>Shop più veloce: non c'è bisogno di riempire il modulo con il tuo contratto e i dettagli di spedizione mentre stai comprando.</li>
							<li>Accesso anticipato ai contenuti in offerta ed agli ultimi arrivi.</li>
						</ul>
						<div class="button1">
							<a href="registrazione.jsp"><input type="submit" name="Submit" value="Registrati"></a>
					    </div>
					   	<div class="clear"></div>
					</div>
				</div>
				<div class="col-md-6">
				    <div class="login-title">
						<h4 class="title">Utente Registrato</h4>
							<% 	Boolean login = (Boolean) request.getAttribute("login");	
												if(login!=null) 
												{
													if(!login) %>
													<i style="color: red" class="glyphicon glyphicon-remove"> </i><h4 style="color:red; display: inline-block;"> Email e/o password errati!</h4>
							<%					}
											
										
							%>
											
						<div id="loginbox" class="loginbox">
							<form action="UserLogin" method="POST" name="login" id="login-form">
								<fieldset class="input">
									<p id="login-form-username">
										<label for="email">Email</label>
										<input id="email" type="email" name="user_email" class="inputbox" size="18" autocomplete="off">
									</p>
									<p id="login-form-password">
										<label for="password">Password</label>
										<input id="password" type="password" name="user_password" class="inputbox" size="18" autocomplete="off">
									</p>
									<div class="remember">
										<p id="login-form-remember">
											<label for="modlgn_remember"><a href="#">Hai dimenticato la password? </a></label>
										</p>
										<input type="submit" name="Submit" class="button" value="Login">
										<div class="clear"></div>
									</div>
								</fieldset>
						    </form>
					    </div>
					</div>
				   <div class="clear"></div>
				</div>
			</div>	
			</div>
		</div>
	</div>


	<!-- Footer section -->
		<%@ include file="fragment/footer.jsp" %>
	<!-- Footer section end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>
	
</body>
</html>