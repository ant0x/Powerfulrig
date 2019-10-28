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
	<nav class="nav2 navbar navbar-expand-lg navbar-dark">
	  <a href="home.jsp" class="navbar-brand site-logo">
			<img src="./img/logotech.png" alt="">
			</a>
		</nav>
		</header>
</body>
