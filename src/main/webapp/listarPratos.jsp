<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<title>Boteco da Web - Editar pratos</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

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

<!-- JS DataTable -->
<script src="js/data-table.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://templateplanet.info/tooltip.js"></script>
<script src="http://templateplanet.info/modal.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> 

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
				<h1 class="page-header" align="center" id="topo">Boteco da WEB - Cadastro de prato</h1>
			</div>
	  		<!-- In�cio do formul�rio  -->
						<div class="field">
						<a href="/ComidaDiButeco/novoPrato.jsp"><span>Novo Prato</span></a>
         				<a href=""><span>Listar pratos</span></a>
         				
						<form class="form-horizontal" method="post"	action="servletListarPratos">
														<table id="mytable" class="table table-bordred table-striped">
															<thead>
																<th>Nome</th>
																<th>Nome do Bar</th>
																<th>Editar</th>
																<th>Deletar</th>
															</thead>
															<tbody>
															
															<!-- 
																	  Faz Conexão com PratoDAO e lista todos os pratos que já foram cadastrados 
																	  Utilizando JSTL 
																	 
															-->
															<jsp:useBean id="dao" class="dao.PratoDAO"/>
															<c:forEach var="prato" items="${dao.getPratos()}">
																
																<tr>	
																	<!-- Problema aqui na identificação de cada item -->
																	<td><input type="text" class="form-control" value="${prato.nome}"/></td>
																	<td><input type="text" class="form-control" value="${prato.nomeDoBar}"/></td>
																	<td><input type="text" class="form-control" value="${prato.ingredientes}"/></td>
																	<td><input type="text" class="form-control" value="${prato.preparo}"/></td>
																	<td><p>
																			
																			
																			
																		</p></td>
																	<td><p>  
																		 <button type="submit" value="${prato.nome}" name="nome" class="btn btn-danger btn-xs" data-target="#delete" > 
																		 
																				<span class="glyphicon glyphicon-trash"></span>
																				
																			</button>
																		</p></td>
																</tr>
															</c:forEach>
															</tbody>

														</table>
														<span id="aviso" > ${updatestats} </span>
														</form>
					    </div>	
					</div>
      </body>
</html>
