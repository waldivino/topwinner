<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TOP WINNER | FIDELIDADE DE CLIENTES</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="pLogin/login.css" rel="stylesheet" id="bootstrap-css">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="dist/css/font-awesome.min.css">
<!-- Bootstrap 3.3.5 -->

<link rel="apple-touch-icon" sizes="57x57" href="img/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="img/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="img/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="img/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="img/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="img/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="img/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="img/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<link rel="manifest" href="img/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="img/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">


</head>
<body>
	<div class="container">
		<div class="row" id="pwd-container">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<section class="login-form">
				<form method="post" action="logar.winner" role="login"
					name="formulario" onsubmit="envia_tranca();">
					<!-- 					<h6 style="text-align: center;">TOP WINNER</h6> -->
					<img src="img/logo.png" alt="TOP WINNER"
						style="width: 150px; height: 150px;" /> <input type="text"
						name="login" placeholder="Email" required
						class="form-control input-lg" value="" />
					<!-- senha -->
					<input type="password" name="senha" class="form-control input-lg"
						id="password" placeholder="Password" required value="" />

					<button type="submit" name="botao"
						class="btn btn-lg btn-primary btn-block">Entrar</button>
					<div>
						<input type="reset" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal"
							value="Associe sua
						empresa aquí" /> ou <a href="#"
							class="btn btn btn-link" data-toggle="modal"
							data-target="#myModal2">recuperar senha.</a>
					</div>

				</form>
				${msg } ${email } <!-- 				<div class="form-links"> --> <!-- 					<a href="#">TOP WINNER</a> -->
				<!-- 				</div> --> </section>
			</div>
		</div>
		<b>
			<address
				style="color: #FFFFFF; text-align: center; margin-top: 15px;">
				TODOS OS DIREITOS RESERVADOS &copy; 2016 <a href="topwinner.jsp"
					style="color: #FFF">TOP WINNER</a>. SISTEMA DE FIDELIZAÇÃO DE
				CLIENTES.
			</address>
		</b>

	</div>






















	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="padding: 15px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Solicitação de acesso ao sistema</h4>
				</div>

				<form class="form-horizontal" action="solicitarConta.winner"
					method="post" name="formulario" onsubmit="envia_tranca();">
					<fieldset>

						<!-- Form Name -->
						<legend>Preencha o cadastro</legend>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="cnpj">CNPJ: </label>
							<div class="col-md-5">
								<input id="cnpj" name="cnpj" type="text"
									placeholder="00.000.000/0000-00" class="form-control input-md"
									required="">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="textinput">Razão
								social:</label>
							<div class="col-md-6">
								<input id="razaosocial" name="razaosocial" type="text"
									placeholder="Digite a razão social"
									class="form-control input-md" required="">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="telefone">Telefone:</label>
							<div class="col-md-4">
								<input id="telefone" name="telefone" type="text"
									placeholder="(00) 0000-0000" class="form-control input-md"
									required="">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="celular">Celular:</label>
							<div class="col-md-4">
								<input id="celular" name="celular" type="text"
									placeholder="(00) 00000-0000" class="form-control input-md">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="contato">Contato:</label>
							<div class="col-md-6">
								<input id="contato" name="contato" type="text"
									placeholder="Digite um nome para contato"
									class="form-control input-md" required="">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="email">Email:</label>
							<div class="col-md-6">
								<input id="email" name="email" type="email"
									placeholder="Digite seu e-mail" class="form-control input-md"
									required="">

							</div>
						</div>

						<!-- Button (Double) -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="btSolicitarConta"></label>
							<div class="col-md-8">
								<input type="submit" value="Solicitar Conta"
									id="btSolicitarConta" name="botao" class="btn btn-success" />
							</div>
						</div>

					</fieldset>
				</form>

			</div>

		</div>


	</div>




























	<!-- Modal -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="padding: 15px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">Solicitação de recuperação de login ou
						senha!</h3>
				</div>

				<form class="form-horizontal"
					action="recuperarSenha.winner12345678900987654321657483930212784962387956789238658327568"
					method="post" name="formulario" onsubmit="envia_tranca();">
					<fieldset>

						<!-- Form Name -->
						<h5>Preencha os dados para recuperar o login ou sua senha de
							acesso ao sistema.</h5>
						<br>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="cnpj">CNPJ: </label>
							<div class="col-md-5">
								<input id="cnpj" name="cnpj" type="text"
									placeholder="00.000.000/0000-00" class="form-control input-md"
									required="">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="email">Email:</label>
							<div class="col-md-6">
								<input id="email" name="email" type="email"
									placeholder="Digite seu e-mail" class="form-control input-md"
									required="">

							</div>
						</div>

						<!-- Button (Double) -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="btSolicitarConta"></label>
							<div class="col-md-8">
								<button id="btSolicitarConta" name="botao"
									class="btn btn-success">Recuperar login e senha</button>
							</div>
						</div>

					</fieldset>
				</form>

			</div>

		</div>


	</div>






























	<!-- jQuery 2.1.4 -->
	<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script src="dist/js/jquery.mask.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- iCheck -->


	<script>
		function envia_tranca() {
			document.forms['formulario'].submit();
			document.forms['formulario'].elements['botao'].disabled = true;
		}
	</script>



	<script>
		$(document).ready(function() {
			$('#cnpj').mask('00.000.000/0000-00');
			$('#telefone').mask('(00) 0000-0000');
			$('#celular').mask('(00) 00000-0000');

		});

		document.getElementById('login').focus();
	</script>



</body>
</html>
