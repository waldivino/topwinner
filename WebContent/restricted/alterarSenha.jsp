<jsp:include page="topo.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

${msgAlterarSenha }

<form class="form-horizontal" action="/topwinner/atualizaSenha.winner"
	id="formulario" method="post" name="formulario" onsubmit="envia_tranca();">
	<fieldset>

		<!-- Form Name -->
		<legend>Altere sua senha com segurança</legend>
		<input type="hidden" name="idUser" value="${u.iduser }"> <input
			type="hidden" name="senhaCerta" value="${u.senha }"> <input
			type="hidden" name="email" value="${u.email }">
		<fieldset disabled>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="disabledTextInput">Login:</label>
				<div class="col-md-5">
					<input id="disabledTextInput" name="login" type="text"
						value="${u.login } ..." placeholder="Disabled input"
						class="form-control input-md" required>

				</div>
			</div>
		</fieldset>

		<!-- Password input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="senhaAtual">Senha
				atual:</label>
			<div class="col-md-4">
				<input id="senhaAtual" name="senhaAtual" type="password"
					placeholder="Digite sua senha atual" class="form-control input-md"
					required autofocus="autofocus">

			</div>
		</div>

		<!-- Password input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="password">Nova
				senha:</label>
			<div class="col-md-4">
				<input name="novaSenha" type="password" id="password"
					placeholder="Digite sua nova senha" class="form-control input-md"
					required autofocus="autofocus" min="6" max="15">

			</div>
		</div>

		<!-- Password input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="confirmpassword">Reescreva
				a senha:</label>
			<div class="col-md-4">
				<input name="confirmpassword" type="password" id="confirmpassword"
					placeholder="Senha novamente" class="form-control input-md"
					required autofocus="autofocus" min="6" max="15">

			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="botao"></label>
			<div class="col-md-4">
				<input type="submit" value="Alterar senha" id="alterarSenha"
					name="botao" class="btn btn-warning"
					onclick="return validarConfirmacao()" />
			</div>
		</div>

	</fieldset>
</form>


<script>
	function validarConfirmacao() {
		var senha = document.getElementById('password').value;
		var confirmacao = document.getElementById('confirmpassword').value;
		
		if (senha != confirmacao) {
			alert("As senhas não são iguais, digite novamente.");
			return false;
		}
		return true;
	}
	document.getElementById('senhaAtual').focus();
</script>


<jsp:include page="rodape.jsp"></jsp:include>