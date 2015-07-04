<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>


<title>Boteco da Web - Novo Prato</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/principal.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

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
      
      <!-- CSS DROPBOX -->
	<style>
		#dropbox {
			width: 300px;
			height: 300px;
			border: 1px dotted gray;
			border-radius: 5px;
			padding: 5px;
			color: gray;
		}
	</style>
	
	<!-- SCRIPT DO UPLOAD DE IMAGENS -->
	<script>
	var mensagem = "Upload realizado:<br/>";
	window.onload = function() {
		var dropbox = document.getElementById("dropbox");
		dropbox.addEventListener("dragenter", noop, false);
		dropbox.addEventListener("dragexit", noop, false);
		dropbox.addEventListener("dragover", noop, false);
		dropbox.addEventListener("drop", dropUpload, false);
	}

	function noop(event) {
		event.stopPropagation();
		event.preventDefault();
	}

	function dropUpload(event) {
		noop(event);
		var files = event.dataTransfer.files;

		for (var i = 0; i < files.length; i++) {
			upload(files[i]);
			//alert(files[i]);
		}
		document.getElementById("status").innerHTML = mensagem;
	}

	function upload(file) {
		document.getElementById("status").innerHTML = "Uploading " + file.name
				+ "...";

		var formData = new FormData();
		formData.append("file", file);

		var xhr = new XMLHttpRequest();
		xhr.upload.addEventListener("progress", uploadProgress, false);
		xhr.addEventListener("load", uploadComplete, false);
		xhr.open("POST", "RecebeUploadServlet", false); // If async=false, then you'll miss progress bar support.
		xhr.send(formData);
	}

	function uploadProgress(event) {
		// Note: doesn't work with async=false.
		var progress = Math.round(event.loaded / event.total * 100);
		document.getElementById("status").innerHTML = "Progress " + progress
				+ "%<br>";
	}

	function uploadComplete(event) {

		var status = document.getElementById("status").innerHTML;
		status = status + event.target.responseText + "<br/>";
		document.getElementById("status").innerHTML = status;
		mensagem += status;
	}
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
						<a href=""><span>Novo Prato</span></a>
         				<a href="/ComidaDiButeco/listarPratos.jsp"><span>Listar pratos</span></a>
						
						<form class="form-horizontal" method="post" action="servletCadastroPrato">
												<fieldset>

													<!-- Form Name -->
													<legend>Novo prato</legend>

													<!-- Text input-->
													<div class="form-group">
														<label class="col-sm-2 control-label" for="textinput">Nome</label>
														<div class="col-sm-10">
															<input name="nome" type="text" placeholder="Nome do prato" class="form-control"> 
														</div>
													</div>

													<!-- Text input-->
													<div class="form-group">
														<label class="col-sm-2 control-label" for="textinput">Nome do bar</label>
														<div class="col-sm-10">
															<input name="nomeDoBar" type="text" placeholder="bar" class="form-control">
														</div>
													</div>

													<!-- Text area-->
													<div class="form-group">
														<div class="controls">
															<label class="col-sm-2 control-label" for="textinput">Ingredientes</label>
															<div class="col-sm-10">
																<textarea name="ingredientes" rows="10" cols="100"
																	placeholder="Ingredientes do prato" class="form-control"
																	id="message" required
																	data-validation-required-message="Por favor, escreva sua mensagem"
																	maxlength="999" style="resize: none"></textarea>
															</div>
														</div>
													</div>
													
													<!-- Text area-->
													<div class="form-group">
														<div class="controls">
															<label class="col-sm-2 control-label" for="textinput">Preparo</label>
															<div class="col-sm-10">
																<textarea name="preparo" rows="10" cols="100"
																	placeholder="Preparo do prato" class="form-control"
																	id="message" required
																	data-validation-required-message="Por favor, escreva sua mensagem"
																	maxlength="999" style="resize: none"></textarea>
															</div>
														</div>
													</div>
													
													<div class="form-group">
														<div class="controls">
															<label class="col-sm-2 control-label" for="textinput">Imagens</label>
															<div class="col-sm-10">
																<div id="dropbox">Arraste as imagens e solte-as aqui!</div>
																<div class="badge alert-success pull-right" id="status"></div>

															</div>
														</div>
													</div>

													<!-- Submit button -->
													<div class="form-group">
														<div class="col-sm-offset-2 col-sm-10">
															<div class="pull-right">
																<button type="reset" class="btn btn-default">Limpar</button>
																<button type="submit" class="btn btn-primary">Salvar</button>
															</div>
														</div>
													</div>

													<div id="msg" class="col-sm-18 col-md-18">
														<span id="msg"> ${msg} </span>
													</div>

												</fieldset>
											</form>
					    </div>	
					</div>
      </body>
</html>