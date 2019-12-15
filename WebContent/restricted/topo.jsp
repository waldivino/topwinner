<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>TOP WINNER - FIDELIZAÇÃO</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">



<script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="../dist/js/app.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>



<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/ionicons.min.css">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="../dist/css/skins/skin-blue.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="../dist/css/font-awesome.min.css">
<!-- Bootstrap 3.3.5 -->


<link rel="apple-touch-icon" sizes="57x57"
	href="../img/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="../img/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="../img/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="../img/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="../img/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="../img/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="../img/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="../img/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="../img/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="../img/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="../img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="../img/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="../img/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="../img/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">


<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif] -->

</head>

<body class="hold-transition skin-blue sidebar-mini">

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="painel.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><img src="../img/logo.png"
					alt="TOP WINNER" style="width: 45px; height: 45px;" /></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><img src="../img/logo.png"
					alt="TOP WINNER" style="width: 50px; height: 50px;" />TOP WINNER</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> </a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">

						<!-- Notifications Menu -->
						<c:if test="${u.administrador == 1}">
							<li class="dropdown notifications-menu"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown"> <i
									class="fa fa-bell-o"></i> <span>SOLICITAÇÕES</span> <span
									class="label label-warning">${totSolicitacoes }</span>
							</a>
								<ul class="dropdown-menu">
									<li class="header">Você possui ${totSolicitacoes } novas
										solicitações de novas contas.</li>
									<li class="footer"><a
										href="/topwinner/listarSolicitacoes.winner">LISTAR
											SOLICITAÇÕES</a></li>
								</ul></li>
						</c:if>

						<!-- User Account Menu -->
						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <!-- The user image in the navbar-->
								<span class="user-image"></span>PERFIL<span class="hidden-xs">
									<span class="fa fa-circle text-success"></span>Seja bem vindo
									${u.login }
							</span>
						</a>
						</li>
					</ul>
				</div>
			</nav>
		</header>

		<aside class="main-sidebar">

			<section class="sidebar">

				<c:if test="${u.administrador == 1}">
					<ul class="sidebar-menu">
						<li class="header">PAINEL TOP WINNER</li>
						<!-- Optionally, you can add icons to the links -->
						<li class="active"><a
							href="/topwinner/chamarCadastroCupomECliente.winner"><i
								class="fa fa-link"></i> <span>PAINEL</span></a></li>


						<li class="treeview"><a href="#"><i class="fa fa-link"></i>
								<span>ADMINISTRAÇÃO</span> <i
								class="fa fa-angle-left pull-right"></i></a>
							<ul class="treeview-menu">
								<li><a href="/topwinner/restricted/alterarSenha.jsp">ALTERAR
										SENHA</a></li>
								<li><a
									href="/topwinner/restricted/adicionarNovoUsuario.jsp">NOVO
										OPERADOR</a></li>



								<!-- Área somente de administrador -->
								<c:if test="${u.administrador == 1}">
									<li><a href="/topwinner/listarSolicitacoes.winner">SOLICITAÇÕES</a></li>
								</c:if>

								<!-- 							<li><a href="/topwinner/chamarCadastroCupomECliente.winner">COMPRA -->
								<!-- 									DO CLIENTE</a></li> -->
								<li><a
									href="/topwinner/buscarPrimeiroCadastroParametro.winner">NOVO
										LUDO</a></li>
								<li><a href="/topwinner/atualizaTorneio1.winner">ATUALIZA
										PARAMETROS</a></li>
								<li><a href="/topwinner/chamaAtualizarLimites.winner">ATUALIZA
										LIMITES</a></li>
								<li><a href="/topwinner/buscarEmpresasImpressao.winner">CONFIRMAR IMPRESSÃO</a></li>
								<li><a href="/topwinner/restricted/criarConta.jsp">SOLICITAR
										CONTAS</a></li>

								<li><a href="/topwinner/restricted/fecharLudo.jsp">FECHAR
										LUDO</a></li>
							</ul></li>

						<li class="treeview"><a href="#"><i class="fa fa-link"></i>
								<span>RELATÓRIOS</span> <i class="fa fa-angle-left pull-right"></i></a>
							<ul class="treeview-menu">
								<li><a href="/topwinner/restricted/relatoriosAdm.jsp">POR
										SORTEIO MÊS/ANO</a></li>
							</ul></li>


					</ul>
				</c:if>




				<c:if test="${u.administrador == 2}">
					<ul class="sidebar-menu">
						<li class="header">PAINEL TOP WINNER</li>
						<!-- Optionally, you can add icons to the links -->
						<li class="active"><a
							href="/topwinner/chamarCadastroCupomECliente.winner"><i
								class="fa fa-link"></i> <span>PAINEL</span></a></li>


						<li class="treeview"><a href="#"><i class="fa fa-link"></i>
								<span>ADMINISTRAÇÃO</span> <i
								class="fa fa-angle-left pull-right"></i></a>
							<ul class="treeview-menu">
								<li><a href="/topwinner/restricted/alterarSenha.jsp">ALTERAR
										SENHA</a></li>

								<li><a
									href="/topwinner/restricted/adicionarNovoUsuario.jsp">NOVO
										OPERADOR</a></li>

								<li><a
									href="/topwinner/buscarPrimeiroCadastroParametro.winner">NOVO
										LUDO</a></li>
								<li><a href="/topwinner/atualizaTorneio1.winner">ATUALIZA
										PARAMETROS</a></li>
								<li><a href="/topwinner/chamaAtualizarLimites.winner">ATUALIZA
										LIMITES</a></li>
								<li><a href="/topwinner/restricted/fecharLudo.jsp">FECHAR
										LUDO</a></li>
							</ul></li>

						<li class="treeview"><a href="#"><i class="fa fa-link"></i>
								<span>RELATÓRIOS</span> <i class="fa fa-angle-left pull-right"></i></a>
							<ul class="treeview-menu">
								<li><a href="/topwinner/restricted/relatorios.jsp">POR
										SORTEIO MÊS/ANO</a></li>
							</ul></li>
					</ul>
				</c:if>

				<c:if test="${u.administrador == 3}">
					<ul class="sidebar-menu">
						<li class="header">PAINEL TOP WINNER</li>
						<!-- Optionally, you can add icons to the links -->
						<li class="active"><a
							href="/topwinner/chamarCadastroCupomECliente.winner"><i
								class="fa fa-link"></i> <span>PAINEL</span></a></li>


						<li class="treeview"><a href="#"><i class="fa fa-link"></i>
								<span>CONFIGURAÇÕES</span> <i
								class="fa fa-angle-left pull-right"></i></a>
							<ul class="treeview-menu">
								<li><a href="/topwinner/restricted/alterarSenha.jsp">ALTERAR
										SENHA</a></li>
							</ul></li>
					</ul>
				</c:if>

			</section>
		</aside>



		<div class="ball-loader">
			<!-- Aquí é colocado todo o conteudo do sitema -->
			<div class="content-wrapper" id="target">
				<section class="content-header">
					<h1>
						TOP WINNER <small> - Sistema de Promoção e Fidelização</small>
					</h1>
					<ol class="breadcrumb">
						<li class="active">
							<form action="/topwinner/sair.winner" method="post">
								<input type="submit" value="SAIR"
									class="btn btn-default btn-flat"
									style="text-transform: uppercase; padding: 5px; color: black; font-weight: bold; font-size: 15px" />
							</form>
						</li>
					</ol>
				</section>

				<!-- Conteúdo principal-->
				<section class="content">