<!DOCTYPE html>
<html lang="pt-br">

<head>


<title>Boteco da Web - Cadastro</title>

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

<body >
<!-- Roda Script que faz background aleatório -->
	<script>
		ChangeIt();
	</script>

<!-- Login -->
	<div class="centralizar">
		<form class="form-signin" method="post" action="servletCadUsuario">
			<h1 class="form-signin-heading text-muted"><% out.println("Cadastro"); %></h1>
			<input name="usuario" type="text" class="form-control" placeholder="Usuário" required="" autofocus="">
			<input name="senha" type="password" class="form-control" placeholder="Senha" required="">
			<input name="confirmar-senha" type="password" class="form-control" placeholder="Confirme sua senha" required="">
			<input name="email" type="text" class="form-control" placeholder="E-mail" required="" autofocus="">
			<button name="login" type="submit" class="btn btn-lg btn-primary btn-block" value="entrar"> Cadastrar </button>
			<input class="btn btn-lg btn-warning btn-block" type="reset" value="Limpar">
		
		<div id="sucesscad" class="col-sm-18 col-md-18">
			<span id="aviso" > ${sucesscad} </span>
		</div>
		
		</form>
		
		<form class="form-signin" action="login.jsp">
			<button name="login" ahref="login.jsp" class="btn btn-lg btn-danger btn-block"> Voltar </button>
		</form>
	</div>

	</body>
	</html>