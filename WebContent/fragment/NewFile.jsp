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
	
	  <div class="collapse navbar-collapse" style="background-color: #004d66;" id="menuToggler">
	    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
	    <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="catalogo.jsp" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <b>Prodotti</b>
	        </a>
	        <div class="dropdown-menu bg-primary color-dark" aria-labelledby="navbarDropdownMenuLink">
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
	      <li class="nav-item">
	        <a class="nav-link" href="Product?action=lastarrived"><b>Ultime novità</b></a></a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="catalogo.jsp" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <b>Info</b>
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	            <a class="dropdown-item" href="chisiamo.jsp">Chi siamo</a>
				<a class="dropdown-item" href="contatti.jsp">Contattaci</a>
	        </div>
	        <li class= "nav-item">
	           <form class="form-inline" action="Cerca" method="POST">
			      <input class="form-control mr-sm-2 ml-lg rounded-pill" type="text" placeholder="Cerca nel sito...">
			      <button class="btn btn-outline-info my-2 my-sm-0 rounded-pill" type="submit">Cerca</button>
			    </form>
	        </li>
	    </ul>
	 
	  </div>
</nav>
	</header>
</body>