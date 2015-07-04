<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.PratoDAO"%>
<%@page import="model.Prato"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>



<title>Boteco da Web - Pratos</title>

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
					Que tal colocar a "mão na massa"?! </h1>
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
<!-- /.row -->
<div class="test1">
		<!-- Portfolio Section -->
		<div class="row">
			<div class="col-lg-12">
				<h2 id="port" class="page-header">Destaques</h2>
			</div>

			<jsp:useBean id="dao" class="dao.PratoDAO" />
			<c:forEach var="prato" items="${dao.getPratos()}">
			
				<div class="section">
				   <h1>${prato.nome}</h1>
				 </div>
				 
				 <div class="item">
			    <p class="headline">${prato.nomeDoBar}</p>
			    <div class="img">
			    	<img src="imagens/${prato.nome}/${prato.nome}.jpg"/>
			    </div>
			    <h2>Ingredientes</h2>
			    <p class="snippet"> ${prato.ingredientes}</p>
					  </div>
			  
				<div class="item">
				    <h2>Preparo</h2>
				    <p class="snippet">${prato.preparo}</p>
				</div>
				
				<a href="alterarDadosPrato?nomePrato=${prato.nome}">Editar</a></li>

			</c:forEach>
		</div>
		<!-- /.row -->
		

  <div class="section">
    <h1>Bom pra Chuchu</h1>
  </div>
  <div class="item">
    <p class="headline">Bar do Dodô</p>
    <div class="img">
    <img src="imagens/bom_pra_chuchu.jpg"
		position: absolute;/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">Para o bolinho:<br>
- 500g de chuchu ralado com casca<br>
- 100g de cebola ralada<br>
- 300g de peito de frango moido<br>
- Pimenta, pimenta do reino, sal, alho a gosto<br>
- Cheiro verde<br>
- Dois ovos<br>
- 200g de mussarela<br>
- 2 litros de óleo<br>
- 500g de farinha de mandioca fina<br>
- 300ml de leite<br>
- 1 colher de polvilho<br>
Para o molho:<br>
- 200g de abacaxi picado<br>
- 200g de creme cheese<br>
- 100g de creme de leite<br>
- 2 colheres de geleia de pimenta<br>
- 3 colheres de açúcar<br>
- 1 copo de água<br></p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Refogue o peito de frango com tempero, acrescente o chuchu e a cebola e deixe até secar a água. Deixe esfriar e, em seguida, acrescente o cheiro verde, um ovo e misture. Acrescente uma colher de polvilho e 100 gramas de farinha de rosca. Misture e faça os bolinhos com mais ou menos 40 gramas, cada um. Recheie-os com muçarela.<br>
Bata um ovo em um recipiente, acrescente 300 ml de leite, passe o bolinho no mesmo na mistura e, posteriormente, na farinha de mandioca. Frite em óleo quente em aproximadamente 150 graus e reserve.<br>
Para preparar o molho, coloque em uma panela o abacaxi picado, três colheres de açúcar e um copo de água. Deixe ferver até secar a água. Deixe esfriar e, em seguida, adicione à mistura os 200 gramas de cream cheese, 100 gramas de creme de leite e duas colheres de geleia de pimenta. Misture bem e sirva com bolinho de chuchu.<br></p>
  </div>

   <div class="section">
    <h1>Explosão de Delícias</h1>
  </div>
  <div class="item">
    <p class="headline">Jajá Drinks</p>
    <div class="img">
    <img src="imagens/explosao_de_delicias.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">Para o quibe recheado com catupiry:<br>
- 500 gramas de trigo para quibe<br>
- 400 gramas de carne moida<br>
- 1 maço de hortelã<br>
- 1 cebola média<br>
- 1 maço de cheiro verde<br>
- Sal a gosto<br>
- 4 dentes de alho<br><br>
Bolinho de arroz com queijo cheddar:<br>
- 2 xícaras de chá de arroz cozido<br>
- 2 ovos<br>
- 1 xícara de chá de queijo tipo parmesão ralado<br>
- ½ xícara de chá de cebola picada e refogada<br>
- Sal a gosto<br>
- Óleo para fritas<br><br>
Bolinho de bacalhau:<br>
- 1 kg e meio de bacalhau<br>
- 1 kg e meio de batata<br>
- 1 cebola<br>
- Cheiro verde<br>
- Azeite<br>
- Pimenta do reino<br>
- 1 colher de margarina<br><br>
Filé de peixe:<br>
- 500g de filé de peixe<br>
- 2 dentes de alho socados<br>
- Farinha de trigo<br>
- Sal<br>
- 3 ovos<br>
- Óleo para fritar<br>
- Ervas de sua preferência<br><br>
Frango empanado:<br>
- 250 g de peito de frango<br>
- 1 ovo batido<br>
- 1 pitada de sal<br>
- Farinha de trigo<br>
- Ervas a gosto<br><br>
Molho:<br>
- 2 ovos<br>
- 2 colheres de vinagre<br>
- 1 tablete de caldo de carne<br>
- ½ maço de cebolinha verde<br>
- ½ maço de salsinha pequena<br>
- Óleo para dar ponto<br>
- 1 limao<br>
- 1 kiwi<br>
- 200 ml de água</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Para cada item, misture todos os ingredientes, enrole em forma de bolinhos e frite com cautela para não deixar ficar seco ou com excesso de óleo. Já para o molho, basta misturar todos os ingredientes e servir frio.</p>
  </div>
  <div class="section">

    <h1>Combinado Carioca</h1>
  </div>
  <div class="item">
    <p class="headline">Conversa de Boteco</p>
    <div class="img">
    <img src="imagens/combinado_carioca.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">- 1 Kg de camarão sete barbas<br>
- 2 kg de arroz bem cozido<br>
- 10 pimentas de cheiro<br>
- 2 colheres de pimenta calabresa<br>
- 500 gramas de mandioca<br>
- 350 gramas de muçarela<br>
- 400 gramas de muçarela para rechear<br>
- ½ pimentão vermelho<br>
- ½ pimentão verde<br>
- ½ pimentão amarelo<br>
- 2 dentes de alho<br>
- 3 colheres de sopa de leite de coco<br>
- 2 ovos<br>
- 3 fios de azeite<br>
- 100 gramas de farinha de rosca<br>
- Salsa e cebolinha a gosto<br><br>
Saladinha de kiwi:<br>
- 4 tomates maduros picadinhos<br>
- 1 pimentão vermelho picadinho<br>
- 1 pimentão amarelo picadinho<br>
- 1 cebola picadinha<br>
- 3 kiwis picadinhos<br>
- 250 ml de azeite<br>
- Salsinha a gosto<br>
- 1 sachê de sazon para salada<br>
- 3 pitadas de sal<br>
- 3 pimentas de cheiro picadinhas<br>
- Raspas de um limão<br>
- 200 ml de água</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Em uma panela, refogue a cebola no azeite, acrescente os pimentões, o alho e, por último, o camarão. Deixe cozinhar um pouco e acrescente o leite de coco, um pouco de salsa e cebolinha.<br>
Junte o molho do camarão com o arroz, a mandioca, muçarela, pimenta calabresa, pimenta de cheiro, salsa e cebolinha. Passe a mistura no moedor três vezes. Para finalizar a massa, coloque os dois ovos e a farinha de rosca, amasse bem até dar o ponto de enrolar, recheie com muçarela e frite em temperatura média.<br>
Para preparar a salada de kiwi, coloque metade do azeite em uma panela, refogue a cebola, os pimentões, o tomate, pimenta de cheiro, a água e cozinhe por 15 minutos. Em seguida, acrescente o kiwi, o sazon e a salsa. Cozinhe por mais 10 minutos.<br>
Desligue o fogo, acrescente o restante do azeite, a salsa e as raspas de limão.</p>
  </div>

    <div class="section">
    <h1>Cartola</h1>
  </div>
  <div class="item">
    <p class="headline">Antigo Armazém</p>
    <div class="img">
    <img src="imagens/cartola.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">- 1quilo de bacalhau dessalgado, cozido e desfiado<br>
- 1 quilo de batata cozida e amassada<br>
- 6 ovos<br>
- 200 gramas de azeite<br>
- 1 cebola média ralada<br>
- 4 dentes de alhos amassados e picados<br>
- 1 colher de sopa de farinha de trigo<br>
- 1 quilo de farinha de rosca<br>
- 250 gramas de banana passa</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Coloque em uma panela o azeite, o alho e a cebola para fritar. Em seguida, depois de bem dourado, coloque o bacalhau, a salsinha, a cebolinha e a pimenta do reino a gosto. Refogue por três minutos e deixe esfriar.<br>
Coloque em uma bacia o bacalhau cozido, acrescente a farinha de trigo, três colheres de sopa de farinha de rosca e a batata. Misture tudo, fazendo uma massa firme.<br>
Pegue uma porção de aproximadamente 130 gramas dessa massa, aperte bem entre as mãos untadas, abra uma parte e coloque um pedaço da banana passa no meio. Aperte até fechar por completo.<br>
Em outro recipiente fundo, bata os ovos, passe o bolinho nos ovos e o unte em outro recipiente com a farinha de rosca.<br>
Coloque em uma panela funda o óleo para esquentar. Quando estiver bem quente, coloque o bolinho para fritar. O óleo tem que estar cobrindo o bolinho. Frite até ficar douradinho.</p>
  </div>

    <div class="section">
    <h1>Carmem Miranda</h1>
  </div>
  <div class="item">
    <p class="headline">Matuto Bar</p>
    <div class="img">
    <img src="imagens/carmem_miranda.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">- 1 abacaxi tamanho médio<br>
- 3 colheres azeite de dendê<br>
- 200ml leite de coco.<br>
- 150g purê de mandioca<br>
- ½ xícara cebola picada<br>
- ½ xícara pimentão verde picado<br>
- 1 colher alho picado<br>
- 1 xícara tomate picado<br>
- 1 pimenta dedo de moça picada<br>
- 1 pimenta de cheiro picada<br>
- 2 limões<br>
- 3 Pães franceses<br>
- Sal a gosto<br>
- Cheiro verde a gosto.<br>
- 150g camarão rosa sem casca descongelado<br>
- 200g camarão rosa com casca e sem cabeça descongelado</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Tempere os camarões com sal e limão e reserve. Em seguida, corte o abacaxi ao meio e retire a polpa sem estragar a casca. A casca será utilizada como travessa para servir o prato. Corte a polpa do abacaxi em cubos pequenos e reserve.<br>
Coloque em uma panela o azeite de dendê, a cebola, o pimentão e as pimentas. Refogue até a cebola ficar transparente. Junte o alho, o abacaxi e os camarões e refogue por mais três minutos em fogo alto. Retire metade dos camarões e reserve.<br>
Junte os tomates, o leite de coco e o cheiro verde. Deixe ferver em fogo baixo por três minutos. Acrescente o purê de mandioca e misture até ele se dissolver e engrossar o molho. Acerte o tempero e desligue o fogo.<br>
Por fim, junte os camarões que estavam reservados. Coloque o bobó dentro da casca do abacaxi, decore com cheiro verde e sirva com os pães cortados em rodela.</p>
  </div>
    <div class="section">

    <h1>Versão Brasileira</h1>
  </div>
  <div class="item">
    <p class="headline">Bar do Chicão</p>
    <div class="img">
    <img src="imagens/versao_brasileira.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">Massa:<br>
- 2kg de aipim<br>
- 1 peito de frango médio<br>
- 100gr de queijo ralado<br>
- 1 ovo<br>
- 2 colheres de pequi<br>
Recheio:<br>
- 500gr de lagarto desfiado<br>
- 300gr de queijo<br>
- 100gr de catupiry</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Para prepara a massa, cozinhe o aipim e o frango em panelas separadas. Escorra o caldo e moa os dois ingredientes juntos. Misture o queijo, ovo, polpa de pequi e o tempero a gosto. Sove ate obter uma massa lisa e homogênea e reserve.<br>
Para o recheio, cozinhe a carne, desfie e misture com o queijo e o catupiry e preencha os bolinhos</p>
  </div>

    <div class="section">
    <h1>Pastelzinho Goiano</h1>
  </div>
  <div class="item">
    <p class="headline">Mais Beer Grill e Cervejaria</p>
    <div class="img">
    <img src="imagens/pastelzinho_goiano.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">Massa:<br>
- 3 colheres de sopa de óleo<br>
- 1 colher de sopa de cachaça<br>
- 1 ovo<br>
- ¼ colher de chá de sal<br>
- 3 xícaras de chá de farinha de trigo<br>
Recheio:<br>
- 1 peito de frango<br>
- 1 cabeça de cebola<br>
- 6 dentes de alho<br>
- 300g de guariroba<br>
- Sal a gosto<br>
- ½ xícara de óleo<br>
- 1 porção de cebolinha<br>
Molho:<br>
- 500g de maionese<br>
- 10 dentes de alho<br>
- 350g de pique</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Para fazer a massa, bata todos os ingredientes, com exceção da farinha de trigo, em um liquidificador, junto com ½ xícara de chá de água morna. Acrescente aos poucos, 1 xícara de chá de farinha e bata até obter uma mistura homogênea.<br>
Coloque o restante da farinha numa tigela e faça um buraco no meio. Despeje a mistura líquida e vá misturando com as mãos e amassando até que a massa fique bem ligada. Comece a passar a massa pela máquina de fazer macarrão, regulada na abertura máxima. Quando a massa começar a estalar, vá diminuindo a abertura até que ela fique bem fina. Por fim, estenda a massa sobre uma superfície polvilhada com farinha.<br>
Para fazer o recheio, cozinhe o peito de frango em uma panela de pressão e, em seguida, desfie. E reserve em uma vasilha. Em uma panela acrescente o óleo, doure a cebola e o alho e, em seguida, adicione o peito de frango e tempere a gosto. Ao final, coloque a cebolinha picada.<br>
Espalhe porções do recheio sobre metade da massa e cubra com o restante, apertando bem as bordas. Corte os pastéis com uma carretilha ou uma faca e frite em olho quente. Escorra com uam escumadeira em uma travessa forrada com papel absorvente.<br>
Para acompanhar, bata todo os ingredientes do molho em um liquidificador até formarem uma mistura homogênea e sirva.</p>
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
    <h2>Ingredientes</h2>
    <p class="snippet">- 700 gramas de picanha<br>
- 500 gramas filé de frango<br>
- 500 gramas linguiça mista fininha<br>
- 300 gramas lombo<br>
- 200 gramas gueroba ou palmito<br>
- 250 gramas muçarela<br>
- 200 gramas creme de leite<br>
- 1 copo americano de farinha trigo<br>
- 1litro de água<br>
- 1 litro de óleo<br>
- 1 dose de Domus<br>
- ½ copo americano molho shoyo<br>
- 1 ovo<br>
- 1 cabeça de cebola<br>
- 1 tomate maduro picado<br>
- Folhas de hortelã<br>
- 6 abacaxis<br>
- 2 colheres de azeite<br>
- Sal, pimenta e temperos a gosto.<br></p>
</div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Em uma panela, aqueça duas colheres de azeite e refogue a picanha em cubinhos, o lombo, o tempero e a cebola. Em seguida adicione a dose de Domus e acenda o fogo para dourar o prato e reserve.<br>
Em uma tigela, bata o ovo e a farinha de trigo, empanando o file de frango. Em seguida, aqueça o óleo em outra panela e frite o file de frango e a linguiça mista. Junte todas as carnes e adicione a gueroba refogada, o molho shoyo, o creme de leite e, por fim, a muçarela.<br>
Para servir, pegue o abacaxi com casca e o corte ao meio, tirando a coroa e o miolo da fruta. Coloque as carnes e o molho dentro do abacaxi e o enfeite com folhas de hortelã.<br></p>
  </div>

   <div class="section">
    <h1>Lambida de Porco</h1>
  </div>
  <div class="item">
    <p class="headline">Bar do Piry</p>
    <div class="img">
    <img src="imagens/lambida_porco.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">- 1kg de língua cozida e descascada<br>
- 1 kg de pernil suíno<br>
- 300g de bacon<br>
- Creme de cebola<br>
- Pimenta bode<br>
- Coentro<br>
- Hortelã<br>
- Sal<br>
- 1 ovo para dar liga e ovos pra empanar<br>
- Farinha de rosca<br>
- Abacaxi com pimenta dedo de moça em calda pra rechear<br><br>
Molho:<br>
- 200ml de caldo de língua do Bar do Piry<br>
- 200ml de caldo de carne<br>
- 50g de rapadura<br>
- 1 pimenta dedo de moça</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Moa uma vez a língua, o bacon e o pernil. Misture com todos os ingredientes até formar uma massa firme, dando ponto com a farinha de rosca e o ovo. Faça as bolas em forma de almôndegas, recheando com o abacaxi em calda e empane com a farinha de rosca e ovo.<br>
Para fazer o molho, misture o molho da língua com o caldo de carne, a rapadura e a pimenta dedo de moça picada. Leve ao fogo e deixe reduzir 40% da mistura. Acertar o ponto com sal e pimenta.</p>
  </div>
  <div class="section">

    <h1>Porquinho Maluco</h1>
  </div>
  <div class="item">
    <p class="headline">Bar du Marcelo</p>
    <div class="img">
    <img src="imagens/porquinho_maluco.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">- 1 kg de pernil suíno moído<br>
- 2 tomates picados pequeno<br>
- 1 xícara de pimentão vermelho cortado pequeno<br>
- 1 xícara de pimentão amarelo cortado pequeno<br>
- 1 xícara de pimentão verde cortado pequeno<br>
- 1 cebola grande ralada<br>
- Pimenta do reino a gosto<br>
- 1 ovo<br>
- 2 colheres de farinha de trigo.<br>
- 1 colher de cebolinha picada.<br>
- Coentro ou salsa a gosto.<br>
- Pimenta bode a gosto.<br>
- Pimenta de cheiro a gosto.<br>
- Sal a gosto<br><br>
Molho:<br>
- 1 abacaxi maduro, descascado e picado (sem a parte dura)<br>
- 1 cebola grande bem picada<br>
- 1 pimenta vermelha, sem sementes, picada<br>
- 1 raiz de gengibre descascada e bem picada<br>
- 1 copo de vinagre<br>
- 1 xícara de açúcar refinado<br>
- 1 xícara de açúcar mascavo<br>
- Uvas passas a gosto</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Em uma vasilha, misture a carne, os tomates, o ovo, a farinha de trigo, os pimentões, a cebola ralada, a cebolinha o coentro ou salsa, pimenta do reino, pimenta de cheiro e pimenta bode. Faça as almôndegas e coloque em uma panela com uma xícara de óleo, tampe a panela quando começar a fritar, adicione água e uma colher de corante (urucum). Deixe ferver até que fiquem cozidas. Sirva com molho chutney de abacaxi.<br>
Para preparar o molho, leve tudo ao fogo e cozinhe até apurar. Guarde em vidros bem tampados e use como acompanhamento.</p>
  </div>

    <div class="section">
    <h1>Mistura Fina</h1>
  </div>
  <div class="item">
    <p class="headline">Bar e Lanchonete Ponto 18</p>
    <div class="img">
    <img src="imagens/mistura_fina.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">- 2kg de lagarto<br>
- 200g de cebola<br>
- 1 pimentão amarelo<br>
- 1 pimentão verde<br>
- 1 pimentão vermelho<br>
- 200g de azeitona verde<br>
- 200g de uva passa<br>
- 1kg de tomate sem sementes<br>
- 5 copos de 200 ml de azeite<br>
- 2 copos de 200 ml de vinagre<br>
- 2 copos de 200 ml de caldo da própria carne<br>
- Temperos (sal, pimenta do reino e ervas finas)<br>
- 1 abacaxi para servir<br>
- Massa para pastel pequena<br><br>
Conserva de jiló:<br>
- 2kg de jiló picados em rodelas finas<br>
- 1,5 litro de azeite<br>
- 500 ml de vinagre<br>
- 250g de cebola<br>
- Tempero a gosto</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Pique todos os ingredientes bem pequenos. Junte a carne desfiada com os outros ingredientes já picados, o caldo de carne, o azeite, o vinagre e os temperos. Mantenha a carne temperada na geladeira. Asse a massa de pastel em forminhas de empadinhas até corar.<br><br>
Conserva de jiló:<br>
Fervente o jiló um pouco. Pegue o azeite, o vinagre e os temperos e misture até homogeneizar. Em seguida, junte a cebola picada.<br>
Ferva os vidros em água quente, coloque o jiló, a conserva e novamente ferva os vidros já tampados e cheios. Sirva a carne nas casquinhas assadas e enfeite com o abacaxi e a conserva de jiló.<br></p>
  </div>
    <div class="section">

    <h1>Paçoca de Baru</h1>
  </div>
  <div class="item">
    <p class="headline">Bar da Elaine</p>
    <div class="img">
    <img src="imagens/pacoca_baru.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">- 1 kg de carne de sol<br>
- 1 kg de mandioca descascada<br>
- 1 kg de castanha de baru<br>
- 1 cebola grande<br>
- 1 colher de sopa de alho<br>
- Azeite a gosto<br>
- Pimenta de cheiro a gosto<br>
- 2 sachês de meu segredo<br>
- Pimenta calabresa a gosto</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Frite a carne cortada em cubos até ficar dourada. Torre as castanha de baru e, depois, triture. Cozinhe a mandioca e, em seguida, frite no azeite juntamente com alho, cebola e pimenta.</p>
  </div>
    <div class="section">

    <h1>Carninha na Vara</h1>
  </div>
  <div class="item">
    <p class="headline">Churrasquinho do Dedé</p>
    <div class="img">
    <img src="imagens/carninha_na_vara.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">- 1 kg de filé mignon<br>
- Sal a gosto<br>
- Palitos<br><br>
Kafta:<br>
- 1 kg de carne moída (peixinho)<br>
- 1 colher de sopa de margarina<br>
- 3 dentes de alho socado<br>
- Sal e pimenta do reino a gosto<br>
- Pimenta de cheiro a gosto<br>
- 1 pacote de creme de cebola<br>
- 300 g de muçarela<br>
- 5 ramos de hortelã picadinhos<br>
- Cebolinha e salsinha picadinhas<br>
- 1 xícara de farinha de rosca<br>
- 3 colheres de óleo</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Tempere o filé em cubinhos e monte os espetinhos. Para a Kafta, misture os ingredientes em uma bacia, acerte o sal e modele a muçarela no palito juntamente com a carne moída. Asse na churrasqueira e sirva com farofa de mandioca e baru.</p>
  </div>
    
<div class="section">
    <h1>Tudo Junto e Misturado</h1>
  </div>
  <div class="item">
    <p class="headline">Bar do Gaúcho</p>
    <div class="img">
    <img src="imagens/tudo_junto.jpg"/>
    </div>
    <h2>Ingredientes</h2>
    <p class="snippet">- 1/2 kg de carne moída limpa<br>
- 2 ovos<br>
- Miolo de 2 pães<br>
- Cheiro verde<br>
- Pimenta de cheiro<br>
- Farinha de mandioca<br>
- Sal<br>
- Pimenta do reino<br>
- 100g de bacon<br>
- 100g de calabresa<br><br>
Molho:<br>
- 500 g de morango<br>
- 4 colheres de sopa de açúcar mascavado<br>
- 2 colheres de sopa de vinagre balsâmico<br>
- 3 colheres de vinho branco (opcional)<br>
- 1 pimenta dedo de moça</p>
  </div>
  <div class="item">
    <h2>Preparo</h2>
    <p class="snippet">Em uma bacia de inox, misture a carne, os ovos e o miolo de pão. Adicione os temperos e amasse até formar uma massa. Modele a massa em forma de disco e recheie com bacon e calabresa. Em seguida, leve para a geladeira por 30 minutos. Envolva os discos em farinha de rosca e frite em gordura bem quente e abundante.<br><br>
Molho:<br>
Para elaborar o molho de morango caseiro você deverá lavar bem todos os morangos, retirar os talos e picar. Depois, prepare todos os ingredientes. Utilize açúcar integral (mascavado), mas, se não tiver, pode utilizar o refinado. Do mesmo modo, o vinho branco é opcional, mas sempre dará um toque de sabor.<br>
Agora, pegue uma panela com a capacidade suficiente para introduzir nela todos os morangos. Depois, adicione o açúcar, o vinho branco, o vinagre balsâmico e pimenta a gosto. Mexa tudo com uma colher de madeira e cozinhe em fogo médio durante 20 minutos, aproximadamente. Se for necessário, abaixe o fogo. Se não tiver vinagre balsâmico ou não gostar de seu sabor, é possível substituir por essência de baunilha em seu lugar.<br>
É importante mexer o molho com a colher de vez em quando. O molho de morango deverá adquirir uma textura similar à da geleia, mas não tão consistente. Se após este tempo os ingredientes ainda não tiverem misturado bem e não tiverem esta textura, deixe por mais uns minutos. Quando estiver pronto, retire do fogo e deixe esfriar um pouco.<br>
Depois, se quiser que fique mais fino e eliminar os possíveis pedacinhos de morango que tenham ficado, despeje em um recipiente de borda alta e bata. Você pode tritura os pedaços tanto com uma batedeira como com um liquidificador.</p>
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
