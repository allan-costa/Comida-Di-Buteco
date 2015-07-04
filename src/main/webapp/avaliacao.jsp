<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">

<head>



<title>Boteco da Web - Avaliações</title>

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
		background-image: url("imagens/padroes/3.png");
		backgorund-repeat: repeat;
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

<a href="/ComidaDiButeco/principal.jsp"<%=userName%>">Bem vindo, <%=userName%></a>
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

		<!-- Seleção das opções -->
		<div class="row">
			<div class="col-lg-12">

				<h1 class="page-header" align="center" id="topo">Boteco da WEB -
					Avalie aqui o seu prato preferido </h1>
			</div>

		<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 align="center">
							<i class="fa fa-fw fa-bell"></i><a href="/ComidaDiButeco/principal.jsp"> Campeão da Semana</a>
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
							<i class="fa fa-fw fa-check"></i><a href="/ComidaDiButeco/pratos.jsp"> Melhores Pratos</a>
						</h4>
					</div>
					<div class="panel-body">
						<p>Aquele prato que você adoraria fazer!!!</p>

					</div>
				</div>
			</div>
		</div>

<!-- Lista de pratos esquerda -->
<div class="test1">
  <div class="section">
    <h1>Bom pra Chuchu</h1>
  </div>
  <div class="item">
    <p class="headline">Bar do Dodô</p>
    <div class="img">
    <img src="imagens/bom_pra_chuchu.jpg"/>
    </div>
    <p class="nota">8,5</p>
</div>
    
   <div class="section">
    <h1>Explosão de Delícias</h1>
  </div>
  <div class="item">
    <p class="headline">Jajá Drinks</p>
    <div class="img">
    <img src="imagens/explosao_de_delicias.jpg"/>
    </div>
    <p class="nota">8,5</p>
	</div>
    
  <div class="section">
    <h1>Combinado Carioca</h1>
  </div>
  <div class="item">
    <p class="headline">Conversa de Boteco</p>
    <div class="img">
    <img src="imagens/combinado_carioca.jpg"/>
    </div>
    <p class="nota">8,5</p>
   </div>

    <div class="section">
    <h1>Cartola</h1>
  </div>
  <div class="item">
    <p class="headline">Antigo Armazém</p>
    <div class="img">
    <img src="imagens/cartola.jpg"/>
    </div>
    <p class="nota">8,5</p>
   </div>

    <div class="section">
    <h1>Carmem Miranda</h1>
  </div>
  <div class="item">
    <p class="headline">Matuto Bar</p>
    <div class="img">
    <img src="imagens/carmem_miranda.jpg"/>
    </div>
    <p class="nota">8,5</p>
   </div>

    <div class="section">
    <h1>Versão Brasileira</h1>
  </div>
  <div class="item">
    <p class="headline">Bar do Chicão</p>
    <div class="img">
    <img src="imagens/versao_brasileira.jpg"/>
    </div>
    <p class="nota">8,5</p>
   </div>

    <div class="section">
    <h1>Pastelzinho Goiano</h1>
  </div>
  <div class="item">
    <p class="headline">Mais Beer Grill e Cervejaria</p>
    <div class="img">
    <img src="imagens/pastelzinho_goiano.jpg"/>
    </div>
    <p class="nota">8,5</p>
    </div>
</div> 

<!-- Lista de pratos direita -->
<div class="test">
  <div class="section">
    <h1>Rapo-Fundo</h1>
  </div>
  <div class="item">
    <p class="headline">Zito’s Bar Pizzaria</p>
    <div class="img">
    <img src="imagens/rapo_fundo.jpg"/>
    </div>
    <p class="nota">8,5</p>
  </div>

   <div class="section">
    <h1>Lambida de Porco</h1>
  </div>
  <div class="item">
    <p class="headline">Bar do Piry</p>
    <div class="img">
    <img src="imagens/lambida_porco.jpg"/>
    </div>
    <p class="nota">8,5</p>
  </div>

  <div class="section">
    <h1>Porquinho Maluco</h1>
  </div>
  <div class="item">
    <p class="headline">Bar du Marcelo</p>
    <div class="img">
    <img src="imagens/porquinho_maluco.jpg"/>
    </div>
    <p class="nota">8,5</p>
  </div>

    <div class="section">
    <h1>Mistura Fina</h1>
  </div>
  <div class="item">
    <p class="headline">Bar e Lanchonete Ponto 18</p>
    <div class="img">
    <img src="imagens/mistura_fina.jpg"/>
    </div>
    <p class="nota">8,5</p>
  </div>

    <div class="section">
    <h1>Paçoca de Baru</h1>
  </div>
  <div class="item">
    <p class="headline">Bar da Elaine</p>
    <div class="img">
    <img src="imagens/pacoca_baru.jpg"/>
    </div>
    <p class="nota">8,5</p>
  </div>

    <div class="section">
    <h1>Carninha na Vara</h1>
  </div>
  <div class="item">
    <p class="headline">Churrasquinho do Dedé</p>
    <div class="img">
    <img src="imagens/carninha_na_vara.jpg"/>
    </div>
    <p class="nota">8,5</p>
    </div>

    <div class="section">
    <h1>Tudo Junto e Misturado</h1>
  </div>
  <div class="item">
    <p class="headline">Bar do Gaúcho</p>
    <div class="img">
    <img src="imagens/tudo_junto.jpg"/>
    </div>
    <p class="nota">8,5</p>
  </div>
</div> 

		<!-- Rodapé -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<h4>Faça também parte desta gostosura.</h4>
				</div>
			</div>
		</footer>

	</div>

</body>

</html>
