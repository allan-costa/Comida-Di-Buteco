<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Boteco da Web - Login</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/principal.css" rel="stylesheet">
<link href="css/alerta.css" rel="stylesheet">


<!-- Custom Fonts -->
<link href="font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Script para fazer background aleatório -->
<script type="text/javascript">
	var totalCount = 7;
	function ChangeIt() {
		var num = Math.ceil(Math.random() * totalCount);
		document.body.background = 'backgrounds/' + num + '.jpg';
		document.body.style.backgroundRepeat = "no-repeat";// Background repeat
		document.body.style.backgroundAttachment = "fixed";
		document.body.style.backgroundPosition = "absolute";
	}
</script>
<!-- Estilo fonte h1 -->
<style>
h1{ 
 font-family: "fonte-title";
 font-size: 70px;
 color: MintCream;
 } 
</style>
</head>

<body class="fullscreen_bg">
<!-- Roda Script que faz background aleatório -->
	<script>
		ChangeIt();
	</script>

<!-- Login -->
	<div class="centralizar">
		<form class="form-signin" method="post" action="servletLogin">
		<h1 class="form-signin-heading text-muted"><% out.println("Login"); %></h1>
		<input name="usuario" type="text" class="form-control" placeholder="Usuário" required="" autofocus="">
		<input name="senha" type="password" class="form-control" placeholder="Senha" required="">
		
		<button name="login" type="submit" class="btn btn-lg btn-primary btn-block" value="entrar"> Entrar </button>
		<a class="btn btn-lg btn-danger btn-block" href="/ComidaDiButeco/cadastro.jsp"> Cadastre-se Aqui! </a>	
		
		<div id="msgErro" class="col-sm-18 col-md-18">
			<span id="aviso" > ${msgErro} </span>
		</div>
		
		<div id="msglogout" class="col-sm-18 col-md-18">
			<span id="aviso" > ${msglogout} </span>
		</div>
		
		<div id="notloggedmsg" class="col-sm-18 col-md-18">
			<span id="aviso" > ${notloggedmsg} </span>
		</div>	
		</form>
	</div>

	</body>
	</html>