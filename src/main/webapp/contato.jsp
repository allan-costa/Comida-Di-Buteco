<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">

<head>


<title>Boteco da Web - Contato</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/principal.css" rel="stylesheet">

<style>
     .titulo {color:#535353; font-family:Liberation Serif; font-size:30px;}
     .field {height: 500px; float:left; position:relative; left:30%; maxlength:8; minlength:8;}
     .margem {margin-left:50px;}
     .tab {border:0px solid;}
     .texto {color:#535353;}
</style>

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


<body background="imagens/padroes/3.png">
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
         <a href="/ComidaDiButeco/avaliacao.jsp"><span>Avaliações</span><img src="imagens/menus/avalia.jpg" alt="" title="Avalia��es" width="241" height="300" class="alignnone size-medium wp-image-801" /></a>
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
      
      <!-- Conte�do da p�gina -->		
      <div class="row">
			<div class="col-lg-12">
				<h1 class="page-header" align="center" id="topo">Boteco da WEB -
					Entre em contato conosco</h1>
			</div>
	  		<!-- In�cio do formul�rio  -->
						<div class="field">
						<form name="contato">
						<div><p class="titulo" align="center">Contato</p></div>
      						   <div class="margem">
						        <table class="tab">
							<tr><td><p class="texto"><label for="nome">Nome:</label></p></td></tr>
	  						<tr><td><p class="texto"><input type=text name="nome" size="48"></p></td></tr>
	  						<tr><td><p class="texto"><br><label for="mail">E-mail:</label></p></td></tr>
	  						<tr><td><p class="texto"><input type=text name="mail" size="48"></p></td></tr>
      						<tr><td><p class="texto"><br><label for="assunto">Assunto:</label></p></td></tr>
	  						<tr><td><p class="texto"><input type=text name="assunto" size="48"></p></td></tr>
     			 			<tr><td><p class="texto"><br><label for="mensagem">Mensagem:</label></p></td></tr>
     			 			<tr><td><p class="texto"><br><textarea name="mensagem" rows="10" cols="50"></textarea></p></td></tr>
      						<td><input class="btn btn-sl btn-primary btn-sucess" type="submit" value="Enviar"><input class="btn btn-sl btn-primary btn-warning" type="reset" value="Limpar"></td></tr>
        					</table>
   						</div>
						</div>
      						</form>
					    </div>	
					</div>
      </body>
</html>