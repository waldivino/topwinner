<jsp:include page="topo.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

${msgFechatLudo }

<form class="form-horizontal" action="/topwinner/fecharLudo.winner"
	id="formulario" method="post" name="formulario" onsubmit="envia_tranca();">
	<fieldset>

		<!-- Form Name -->
		<legend>FECHAR O LUDO EM ANDAMENTO!</legend>
		<input type="hidden" name="idUser" value="${u.iduser }"> <input
			type="hidden" name="senhaCerta" value="${u.senha }"> <input
			type="hidden" name="cnpj" value="${u.cnpj }">

		<!-- Password input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="password">Digite sua	senha:</label>
			<div class="col-md-4">
				<input name="senha" type="password" id="password"
					placeholder="Digite sua senha" class="form-control input-md"
					required autofocus="autofocus" min="6" max="15">

			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="botao"></label>
			<div class="col-md-4">
				<input type="submit" value="FECHAR LUDO" id="alterarSenha"
					name="botao" class="btn btn-warning"
					onclick="return alert('Deseja realmente fechar este ludo?')" />
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