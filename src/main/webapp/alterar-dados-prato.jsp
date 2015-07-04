<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Alterar Dados Prato</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/principal.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    
   </head>
   <style>

 @font-face { 
	font-family: "fonte-title"; 
	src: url(Titania-Regular.ttf); 
 } 

 h1{ 
 font-family: "fonte-title";
 font-size: 70px;
 } 
 </style>
 
 
<body >

	  <div class="row">
			<div class="col-lg-12">
				<h1 class="page-header" align="center" id="topo">Boteco da WEB - Cadastro de prato</h1>
			</div>
	  		<!-- In�cio do formul�rio  -->
						<div class="field">

		<form class="form-signin" method="post" action="servletUpdatePrato">
		
		<!-- Text input-->
													<div class="form-group">
														<label class="col-sm-2 control-label" for="textinput">Nome</label>
														<div class="col-sm-10">
															<input readonly="readonly"  value="<%= request.getParameter("nomePrato")%>" name="nome" type="text" class="form-control" > 
														</div>
													</div>

													<!-- Text input-->
													<div class="form-group">
														<label class="col-sm-2 control-label" for="textinput">Nome do bar</label>
														<div class="col-sm-10">
															<input  value="${prato.nomeDoBar}" name="nomeDoBar" type="text"  class="form-control">
														</div>
													</div>

													<!-- Text area-->
													<div class="form-group">
														<div class="controls">
															<label class="col-sm-2 control-label" for="textinput">Ingredientes</label>
															<div class="col-sm-10">
																<textarea value="${prato.ingredientes}" name="ingredientes" rows="10" cols="100" class="form-control"
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
																<textarea value="${prato.preparo}" name="preparo" rows="10" cols="100" class="form-control"
																	id="message" required
																	data-validation-required-message="Por favor, escreva sua mensagem"
																	maxlength="999" style="resize: none"></textarea>
															</div>
														</div>
													</div>
													<button name="cadastrar" type="submit" class="btn btn-lg btn-warning btn-block"> Alterar </button>
													<a class="btn btn-lg btn-danger" href="pratos.jsp"> Voltar </a>
													
		<span id="aviso" > ${updatestats} </span>

		</form>

		
		
	</div>
	</div>

	</body>
	</html>


