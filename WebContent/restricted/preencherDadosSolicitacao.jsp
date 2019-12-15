<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TOP WINNER | FIDELIDADE DE CLIENTES</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="../pLogin/login.css" rel="stylesheet" id="bootstrap-css">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">


</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:if test="${empresa.status != -1 }">
		<jsp:forward page="/restricted/painel.jsp"></jsp:forward>
	</c:if>

	<div class="container">

		<h2 style="text-align: center;">TOP WINNER</h2>

		<div class="bg-success">

			${msgAtualizaContaSolicitacao }

			<form method="post" action="/topwinner/contaEmpresa.winner"
				class="form-horizontal" style="text-align: center;"
				name="formulario" onsubmit="envia_tranca();">
				<fieldset>
					<input type="hidden" value="${empresa.idUser }" name="idUser">
					<!-- Form Name -->
					<legend>Agora você precisa terminar de preencher o
						cadastro para ter acesso ao painel do sistema.</legend>
					<fieldset disabled>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="disabledTextInput">CNPJ:</label>
							<div class="col-md-5">
								<input name="cnpj" value="${empresa.cnpj }" type="text"
									id="disabledTextInput" class="form-control"
									placeholder="Disabled input">

							</div>
						</div>
					</fieldset>
					<!-- Text input-->
					<fieldset disabled>
						<div class="form-group">
							<label class="col-md-4 control-label" for="disabledTextInput">Razão
								social:</label>
							<div class="col-md-5">
								<input id="disabledTextInput" name="razaoSocial"
									value="${empresa.razaoSocial }" type="text"
									placeholder="Digite a razão social"
									class="form-control input-md" required>

							</div>
						</div>
					</fieldset>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="nomeFantasia">Nome
							Fantasia:</label>
						<div class="col-md-5">
							<input id="nomeFantasia" name="nomeFantasia" type="text"
								placeholder="Digite o nome fantasia da empresa."
								class="form-control input-md" required>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="logradouro">Logradouro:</label>
						<div class="col-md-5">
							<input id="logradouro" name="logradouro" type="text"
								placeholder="Digite o logradouro, exe: Rua, Aven etc..."
								class="form-control input-md" required>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="municipio">Município:</label>
						<div class="col-md-5">
							<input id="municipio" name="municipio" type="text"
								placeholder="Digite o município" class="form-control input-md"
								required>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="bairro">Bairro</label>
						<div class="col-md-4">
							<input id="bairro" name="bairro" type="text"
								placeholder="Digite o bairro" class="form-control input-md"
								required>

						</div>
					</div>

					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="uf">UF:</label>
						<div class="col-md-2">
							<select id="uf" name="uf" class="form-control" required>
								<option value="AL">AL</option>
								<option value="AP">AP</option>
								<option value="AM">AM</option>
								<option value="BA">BA</option>
								<option value="CE">CE</option>
								<option value="DF">DF</option>
								<option value="ES">ES</option>
								<option value="GO">GO</option>
								<option value="MA">MA</option>
								<option value="MT">MT</option>
								<option value="MS">MS</option>
								<option value="MG">MG</option>
								<option value="PA">PA</option>
								<option value="PB">PB</option>
								<option value="PR">PR</option>
								<option value="PE">PE</option>
								<option value="PI">PI</option>
								<option value="RJ">RJ</option>
								<option value="RN">RN</option>
								<option value="RS">RS</option>
								<option value="RO">RO</option>
								<option value="RR">RR</option>
								<option value="SC">SC</option>
								<option value="SP">SP</option>
								<option value="SE">SE</option>
								<option value="TO">TO</option>
							</select>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="telefone">Telefone:</label>
						<div class="col-md-4">
							<input id="telefone" name="telefone" type="text"
								value="${empresa.telefone }" placeholder="(00) 0000-0000"
								class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="celular">Celular:</label>
						<div class="col-md-4">
							<input id="celular" name="celular" type="text"
								value="${empresa.celular }" placeholder="(00) 00000-0000"
								class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="contato">Contato:</label>
						<div class="col-md-5">
							<input id="contato" name="contato" type="text"
								value="${empresa.contato }" placeholder="Digite o contato"
								class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="ramoatividade">Ramo
							atividade:</label>
						<div class="col-md-5">
							<input id="ramoAtividade" name="ramoAtividade" type="text"
								placeholder="Digite o ramo atividade"
								class="form-control input-md" required>

						</div>
					</div>

					<!-- Text input-->
					<fieldset disabled>
						<div class="form-group">
							<label class="col-md-4 control-label" for="disabledTextInput">Email:</label>
							<div class="col-md-5">
								<input id="disabledTextInput" name="email" type="text"
									value="${empresa.email }" placeholder="Digite o email"
									class="form-control input-md">

							</div>
						</div>
					</fieldset>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="cnpjmatriz">CNPJ
							matriz:</label>
						<div class="col-md-5">
							<input id="cnpjmatriz" name="cnpjMatriz" type="text"
								placeholder="00.000.000/0000-00" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<fieldset disabled>
						<div class="form-group">
							<label class="col-md-4 control-label" for="disabledTextInput">Data
								Inclusão:</label>
							<div class="col-md-4">
								<input id="disabledTextInput" name="datainc" type="text"
									value="${empresa.dataInc }" placeholder="00/00/0000"
									class="form-control input-md">

							</div>
						</div>
					</fieldset>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="valorLimite">Valor
							limite: </label>
						<div class="col-md-4">
							<input id="valorLimite" name="valorLimite" type="text"
								placeholder="R$ 0,00" class="form-control input-md" required>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="valorBaseVarejo">Valor
							base varejo: </label>
						<div class="col-md-4">
							<input id="valorBaseVarejo" name="valorBaseVarejo" type="text"
								placeholder="R$ 0,00" class="form-control input-md" required>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="valorBaseAtacado">Valor
							base atacado: </label>
						<div class="col-md-4">
							<input id="valorBaseAtacado" name="valorBaseAtacado" type="text"
								placeholder="R$ 0,00" class="form-control input-md" required>

						</div>
					</div>

					<!-- Button (Double) -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="botao">Clique
							para atualizar seus dados cadastrais</label>
						<div class="col-md-8">
							<button id="atualizar" name="botao" class="btn btn-success">Atualizar</button>
							<input type="reset" id="cancelar" name="cancelar"
								class="btn btn-danger" value="Limpar"></input>
						</div>
					</div>

				</fieldset>
			</form>
		</div>

		<address style="color: #FFFFFF; text-align: center;">
			TODOS OS DIREITOS RESERVADOS &copy; 2015 <a href="topwinner.jsp">TOP
				WINNER</a>. SISTEMA DE FIDELIDADE DE CLIENTES.
		</address>

		<br /> <br />


	</div>



















	<!-- jQuery 2.1.4 -->
	<script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script src="../dist/js/jquery.mask.js"></script>
	<script src="../dist/js/jquery.maskMoney.js" type="text/javascript"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<!-- iCheck -->






	<script>
		$(document).ready(function() {
			$('#cnpj').mask('00.000.000/0000-00');
			$('#cnpjmatriz').mask('00.000.000/0000-00');
			$('#telefone').mask('(00) 0000-0000');
			$('#celular').mask('(00) 00000-0000');
			$('#datainc').mask('00/00/0000');

		});
	</script>

	<script type="text/javascript">
		$(function() {
			$("#valorLimite").maskMoney({
				symbol : 'R$ ',
				showSymbol : true,
				thousands : '.',
				decimal : ',',
				symbolStay : true
			});

			$("#valorBaseVarejo").maskMoney({
				symbol : 'R$ ',
				showSymbol : true,
				thousands : '.',
				decimal : ',',
				symbolStay : true
			});

			$("#valorBaseAtacado").maskMoney({
				symbol : 'R$ ',
				showSymbol : true,
				thousands : '.',
				decimal : ',',
				symbolStay : true
			});
		})
	</script>

	<script>
		function envia_tranca() {
			document.forms['formulario'].submit();
			document.forms['formulario'].elements['botao'].disabled = true;
		}
	</script>

</body>
</html>
