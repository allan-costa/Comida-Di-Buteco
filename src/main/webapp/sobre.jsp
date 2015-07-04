<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">

<head>



<title>Boteco da Web - Sobre</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/principal.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Scripts utilizados no menu -->
<script src="js/bootstrap.min.js"></script>
<script src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.10.0.min.js" ></script>
<script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.accordionImageMenu.min.js"></script>
<script type="text/javascript" src="js/jquery.accordionImageMenu.js"></script>
      <script type="text/javascript">
         $(document).ready(function() {
         
         	jQuery('#acc-menu2').AccordionImageMenu({
         	  'border' : 1,
         	  'openItem':0,
         	  'duration': 400,
         	  'openDim': 310,
         	  'closeDim': 160,
         	  'effect': 'easeOutQuint',
         	  'fadeInTitle': false,
         	  'height':100 
         	});	
         	
         });
         $(document).on(
  				"click",
  				".alert",
  				function(e) {
  					bootbox.confirm("Você tem certeza de que irá sair?",
  							function(result) {
  								var novaURL = "servletLogout";
  								if (result) {
  									$(window.document.location).attr('href',
  											novaURL);
  								}
  							});
  				});     
      </script>



</head>


<body background="imagens/padroes/13.png">
	<%
		String userName = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("usuario"))

					userName = cookie.getValue();
			}
		}
	%>

	<%
	if(userName != null){
	%>
	<a href="/ComidaDiButeco/principal.jsp"<%=userName%>">Bem vindo, <%=userName%></a>
	<% 
	}
	%>
		<!-- Menu -->
      <div id="acc-menu2" style="margin:10px auto">
         <a href="/ComidaDiButeco/principal.jsp"><span>Início</span><img src="imagens/menus/home.jpg" alt="" title="Home" width="300" height="200" class="alignnone size-medium wp-image-806" /></a>
         <a href="/ComidaDiButeco/pratos.jsp"><span>Pratos</span><img src="imagens/menus/pratos.jpg" alt="" title="Pratos" width="300" height="283" class="alignnone size-medium wp-image-803" /></a>
         <a href="/ComidaDiButeco/avaliacao.jsp"><span>Avaliações</span><img src="imagens/menus/avalia.jpg" alt="" title="Avaliações" width="241" height="300" class="alignnone size-medium wp-image-801" /></a>
         <a href="/ComidaDiButeco/contato.jsp"><span>Contato</span><img src="imagens/menus/contato.jpg" alt="" title="Contato" width="300" height="200" class="alignnone size-medium wp-image-800" /></a>
         <a href="/ComidaDiButeco/sobre.jsp"><span>Sobre</span><img src="imagens/menus/sobre.jpg" alt="" title="Sobre" width="241" height="300" class="alignnone size-medium wp-image-801" /></a>
         <%
			if (userName != null && userName.equals("admin")) {
			%>
			<a href="/ComidaDiButeco/novoPrato.jsp"><span>Cadastros</span><img src="imagens/menus/engrenagem.png" alt="" title="Pratos" width="300" height="283" class="alignnone size-medium wp-image-803" /></a>
			<%
			}
			%>
         <a class="alert" href=#><span>Sair</span><img src="imagens/menus/sair.jpg" alt="" title="Sair" width="300" height="200" class="alignnone size-medium wp-image-800" /></a>
      </div>

	<!-- Conteúdo da página -->
	<div class="container">

		<!-- Comida de Boteco -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header" align="center" id="topo">Boteco da WEB -
					Ingredientes deste projeto:</h1>
			</div>

				</div>
			</div>


		<!-- Descrição  -->
<div>
</div>
<div class="test1">
  <div class="section">
    <h1>Thaís Ruas</h1>
  </div>
  <div class="item">
    <p class="headline">Avenidas</p>
    <span class="img">
    <img src="imagens/sobre/thais.jpg"/>
    </span>
    <h2>Descrição:</h2>
    <p class="snippet">Estudante de Sistemas de Informação. Apaixonada por cães (digo tartarugas).
  </div>
<div class="section">
    <h1>	Willian Ruas</h1>
  </div>
  <div class="item">
    <p class="headline">Will</p>
    <span class="img">
    <img src="imagens/sobre/willian.jpg"/>
    </span>
    <h2>Descrição:</h2>
    <p class="snippet">Estudante de Sistemas de Informação. Viciado.			
  </div>
</div> 

<div class="test"  >
  <div class="section">
    <h1>Felipe Neves Rocha da Silva</h1>
  </div>
  <div class="item">
    <p class="headline">Lipitos</p>
    <span class="img">
    <img src="imagens/sobre/felipe.jpg"/>
    </span>
    <h2>Descrição:</h2>
    <p class="snippet">Estudante de Sistemas de Informação. Viciado em Dota. 
</div>
   <div class="section">
    <h1>Renata Dias Felipe</h1>
  </div>
  <div class="item">
    <p class="headline">Ingrata</p>
    <span class="img">
    <img src="imagens/sobre/renata.jpg"/>
    </span>
    <h2>Descrição:</h2>
    <p class="snippet">Estudante de Sistemas de Informação. Viciada em Sorvete. 
						
  </div>
</div> 

</body>

</html>
