<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Powerfulrig.Bean.*"
	import="com.Powerfulrig.controller.*" import="java.util.*"%>

<%
	String checkRegistration = null;

	if ((String) request.getAttribute("inserimentoUtente") != null) {
		checkRegistration = (String) request.getAttribute("inserimentoUtente");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PR - Registrazione</title>

<meta name="description" content="EndGam Gaming Magazine Template">
<meta name="keywords" content="endGam,gGaming, magazine, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Icona -->
<link href="img/icona.ico" rel="shortcut icon" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">

<!-- JQUERY 3.4.1 -->
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<!-- Stylesheets -->
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />

</head>

<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section start -->
	<%@ include file="fragment/header3.jsp"%>
	<!-- Header section end -->

	<!-- MAIN SECTION Registrazione-->
<form>
	<div class="main">
		<div class="shop_top" id="regimargin">
			<div class="container">

				<div class="register-top-grid">
					<h3>INFORMAZIONI PERSONALI</h3>
					<div>
						<span>Indirizzo e-mail<label>*</label></span> <input
							name="user_email" type="email" id="email_user"
							placeholder="example@example.it" autocomplete=on autofocus autocomplete="on">
					</div>
					<div>
						<span>Nome<label>*</label></span> <input name="user_firstname"
							id="user_firstname" type="text" maxlength="50" autocomplete="on">
					</div>
					<div>
						<span>Cognome<label>*</label></span> <input name="user_lastname"
							id="user_lastname" type="text" maxlength="50" autocomplete="on">
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<div class="register-bottom-grid">
					<h3>INFORMAZIONI LOGIN</h3>
					<div>
						<span>Password<label>*</label></span> <input name="user_password"
							type="password" id="password_user" autocomplete="off">
					</div>
					<div>
						<span>Conferma Password<label>*</label></span> <input
							name="confirm_user_password" type="password"
							id="confirm_password_user" autocomplete="off">
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<div class="button2">
					<input type="button" id="buttonreg" class="setButton"
						value="REGISTRATI">
				</div>

			</div>
		</div>
	</div>
</form>
	<!-- MAIN SECTION Registrazione END -->

	<!-- Header section start -->
	<%@ include file="fragment/footer.jsp"%>
	<!-- Header section end -->

	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/main.js"></script>


	<script>
	
	//Registrazione
	$("#buttonreg").on('click', function validate(){	
		var user_firstname  = $('#user_firstname').val();
		var user_lastname  = $('#user_lastname').val();
		var email_user = $('#email_user').val();
		var password_user = $('#password_user').val();
		var confirm_password_user = $('#confirm_password_user').val();

		var RGEXemail_user = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var RGEXpassword_user = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
		
		var email_userRES = RGEXemail_user.test(email_user);
		var password_userRES = RGEXpassword_user.test(password_user);
		
		if(email_userRES == false)
		{
			Swal.fire({ //Popup mail errata
				title: 'Formato Email errato!',
				type: 'warning',
				  confirmButtonColor: '#3085d6',
				  confirmButtonText: 'OK',
				width: '400px',
				})
			setTimeout(function(){location.href="registrazione.jsp"} , 135000);
			return false;	
		}
		else if(password_userRES == false)
		{
			Swal.fire({ //Password non conforme
				title: 'Passowrd non conforme',
				text: "La password dev'essere almeno di 8 caratteri ed almeno 1 maiuscolo.",
				type: 'warning',
				  confirmButtonColor: '#3085d6',
				  confirmButtonText: 'OK',
				width: '400px',
				})
			setTimeout(function(){location.href="registrazione.jsp"} , 135000);
			return false;
		}
		
		else if(password_user != confirm_password_user)
			{
			Swal.fire({ //Popup password non corrisponde
				title: 'Le password non corrispondono',
				type: 'warning',
				  confirmButtonColor: '#3085d6',
				  confirmButtonText: 'OK',
				width: '400px',
				})
			setTimeout(function(){location.href="registrazione.jsp"} , 135000);
			return false;
			}
		else if(user_firstname === "")
		{
			Swal.fire({ //Password non conforme
				title: 'Inserire il nome',
				type: 'warning',
				  confirmButtonColor: '#3085d6',
				  confirmButtonText: 'OK',
				width: '400px',
				})
			setTimeout(function(){location.href="registrazione.jsp"} , 135000);
			return false;
		}
		if(user_lastname === "")
		{
			Swal.fire({ //Password non conforme
				title: 'Inserire il cognome',
				type: 'warning',
				  confirmButtonColor: '#3085d6',
				  confirmButtonText: 'OK',
				width: '400px',
				})
			setTimeout(function(){location.href="registrazione.jsp"} , 135000);
			return false;
		}
		
		
		else if(password_userRES == true && email_userRES == true)
		{
			$.ajax({ 
			type: "POST",
			url: "Registration",
			data: {"user_firstname": user_firstname, "user_lastname": user_lastname,"user_email":email_user, "user_password":password_user, "confirm_user_password": confirm_password_user},
			success: function(results){
				Swal.fire({ //SECONDO POPUP
					title: 'Registrato!',
					timer: 40000,
					type: 'success',
					showCancelButton: false,
					showConfirmButton: false,
					width: '400px',
					})
				setTimeout(function(){location.href="log-area.jsp"} , 200);
				}    
			})
		}
		
		
		
	});
	
	
	
		
	</script>


</body>
</html>