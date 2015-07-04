<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<title>Boteco da Web - Início</title>

<!-- JQuerry é o responsavel por fazer o logout e zerar os cookies -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/principal.css" rel="stylesheet">

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
      
      
<style>
	body {
		background-image: url("imagens/padroes/11.png");
}
</style>


</head>

<body>

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

		<!-- Marketing Icons Section -->
		<div class="row" >
			<div class="col-lg-12">

				<h1 class="page-header" align="center" id="topo">Boteco da WEB -
					Os Melhores Pratos dos Melhores Botecos</h1>
			</div>

			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 align="center">
							<i class="fa fa-fw fa-bell"></i><a href="#pratoDia"> Campeão da Semana</a>
						</h4>
					</div>
					<div class="panel-body">
						<p>Receita do prato mais votado!!!</p>

					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 align="center">
							<i class="fa fa-fw fa-star"></i><a href="/ComidaDiButeco/avaliacao.jsp"> Avaliações</a>
						</h4>
					</div>
					<div class="panel-body">
						<p>Avalie agora, dê sua nota!!! </p>

					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 align="center">
						<!--  href="#port" - vai para onde tem id="port" -->
							<i class="fa fa-fw fa-check"></i><a href="/ComidaDiButeco/pratos.jsp"> Prepare você mesmo </a>
						</h4>
					</div>
					<div class="panel-body">
						<p>Aquele prato que você adoraria fazer!!!</p>

					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Prato do dia -->
		<div class="row" >
			<div class="col-lg-12">
				<h2 class="headline" id="pratoDia">Prato da Semana</h2>
			</div>
			<div class="col-md-6">
				<h1>Quase Indiano</h1>
				<ul>
					<h3>Ingredientes:</h3><br>
					<li>Massa:</li>
					<li>2kg de aipim</li>
					<li>1 peito de frango médio</li>
					<li>100gr de queijo ralado</li>
					<li>1 ovo</li>
					<li>2 colheres de pequi</li>
					<li>Recheio:</li>
					<li>500gr de lagarto desfiado</li>
					<li>300gr de queijo</li>
					<li>100gr de catupiry</li>
					<h3>Modo de Preparo:</h3>
					<li>Para preparar a massa, cozinhe o aipim e o frango em panelas separadas.<br> Escorra o caldo e moa os dois ingredientes juntos.<br> Misture o queijo, ovo, polpa de pequi e o tempero a gosto.<br> Sove até obter uma massa lisa e homogênea e reserve.</li>
					</ul>
				<p>
				</div>
			<div class="col-md-6">
				<img class="img-responsive" src="imagens/bar_do_chicao.jpg" alt="">
			</div>
		</div>
		<!-- /.row -->

		<hr>


		<!-- Rodapé -->
		<footer>
			<div class="row" >
				<div class="col-lg-12">
					<h4>Faça também parte desta gostosura.</h4>
				</div>
			</div>
		</footer>

	</div>

</body>

</html>
