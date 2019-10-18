<%@page import="com.Powerfulrig.Bean.*"
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

	Utente utenteLoggato;
	synchronized(session) 
	{
		utenteLoggato = (Utente) request.getSession().getAttribute("utenteLoggato"); 
	}
%>

<body>
	<header class="sezioneHeader2">
		<div class="container-fluid au-reg-background">
			<div class="row">
				<div class="header-left col-xl-3">
					<div class="row">
						<a href="home.jsp" class="site-logo">
							<img src="./img/logotech.png" alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
