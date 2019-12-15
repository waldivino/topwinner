<jsp:include page="topo.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

${msgNovoUsuario }


<form class="form-horizontal" action="/topwinner/adicionarNovoUsuario"
	method="post" name="formulario" onsubmit="envia_tranca();">
	<fieldset>
		<input type="hidden" value="${u.iduser }" name="idUser" />
		<!-- Form Name -->
		<legend>Nova conta de acesso ao sistema</legend>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="login">Login:</label>
			<div class="col-md-5">
				<input id="login" name="login" type="email"
					placeholder="Digite o email do operador"
					class="form-control input-md" required=>

			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="botao"></label>
			<div class="col-md-4">
				<button id="novoUsuario" name="botao" class="btn btn-primary">CRIAR
					NOVO OPERADOR</button>
			</div>
		</div>

	</fieldset>
</form>


<jsp:include page="rodape.jsp"></jsp:include>