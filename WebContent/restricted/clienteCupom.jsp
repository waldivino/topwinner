<jsp:include page="topo.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div style="text-align: center;">${msgContaConcluida }
	${msgValidacaoSorteio }</div>

<c:if test="${cliente.cpf != null}">
	<form action="/topwinner/cadastrarCupom.winner" method="post"
		class="form-horizontal" id="meuForm" name="cadastro">
		<fieldset>

			<!-- Form Name -->
			<legend>Entre com os dados do cliente e valor da compra</legend>
			<input type="hidden" name="idUser" value="${u.iduser }" /> <input
				type="hidden" name="cnpj" value="${u.cnpj }" /> <input name="cpf"
				type="hidden" value="${cliente.cpf}">
			<fieldset disabled>
				<div class="form-group">
					<label class="col-md-4 control-label" for="cpf">CPF: </label>
					<div class="col-md-4">
						<input id="cpf" name="cpf" type="text" value="${cliente.cpf}" class="form-control input-md" maxlength="14">
					</div>
				</div>
			</fieldset>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="telefone">Telefone:</label>
				<div class="col-md-4">
					<input id="telefone" name="telefone" type="text"
						placeholder="(00) 0000 - 0000" class="form-control input-md"
						required="required">

				</div>
			</div>

			<c:if test="${cliente.cpf != null}">
				<script type="text/javascript">
					document.getElementById('telefone').focus();
				</script>
			</c:if>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="coo">COO/DOC:</label>
				<div class="col-md-4">
					<input id="coo" name="coo" type="text" placeholder="000000"
						class="form-control input-md" required="required">

				</div>
			</div>


			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="valorCupom">Valor
					da compra:</label>
				<div class="col-md-4">
					<input id="valorCupom" name="valorCupom" type="text"
						placeholder="R$ 0,00" class="form-control input-md"
						required="required">

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="irParaSorteio"></label>
				<div class="col-md-4">
					<input type="submit" class="btn btn-primary btn-lg"
						value="IR PARA O SORTEIO" />
				</div>
			</div>

		</fieldset>
	</form>

</c:if>


<c:if test="${cliente.cpf == null}">
	<form action="/topwinner/cadastrarCupom.winner" method="post"
		class="form-horizontal" id="meuForm" name="cadastro"
		onSubmit="return validarCPF()">
		<fieldset>

			<!-- Form Name -->
			<legend>Entre com os dados do cliente e valor da compra</legend>
			<input type="hidden" name="idUser" value="${u.iduser }" /> <input
				type="hidden" name="cnpj" value="${u.cnpj }" />
			<div class="form-group">
				<label class="col-md-4 control-label" for="cpf">CPF: </label>
				<div class="col-md-4">
					<input id="cpf" name="cpf" type="text" placeholder="000.000.000-00"
						class="form-control input-md" maxlength="14" required="required"
						pattern="^(\d{3}\.\d{3}\.\d{3}-\d{2})|(\d{11})$">
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="telefone">Telefone:</label>
				<div class="col-md-4">
					<input id="telefone" name="telefone" type="text"
						placeholder="(00) 0000 - 0000" class="form-control input-md"
						required="required">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="coo">COO/DOC:</label>
				<div class="col-md-4">
					<input id="coo" name="coo" type="text" placeholder="000000"
						class="form-control input-md" required="required">

				</div>
			</div>


			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="valorCupom">Valor
					da compra:</label>
				<div class="col-md-4">
					<input id="valorCupom" name="valorCupom" type="text"
						placeholder="R$ 0,00" class="form-control input-md"
						required="required">

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="irParaSorteio"></label>
				<div class="col-md-4">
					<input type="submit" class="btn btn-primary btn-lg"
						value="IR PARA O SORTEIO" />
				</div>
			</div>

		</fieldset>
	</form>

</c:if>




<form class="form-horizontal"
	style="margin-top: 100px; margin-left: 580px;">
	<fieldset>
		<!-- Text input-->
		<div class="form-group">
			<div class="col-md-4">
				<a href="/topwinner/restricted/cadastraCliente.jsp"
					class="btn btn-primary"> DADOS CLIENTE </a>
			</div>
		</div>

	</fieldset>
</form>




<script type="text/javascript" src="jquery.maskMoney.js"></script>
<script type="text/javascript" src="jquery.mask.js"></script>

<script type="text/javascript">
	document.getElementById('cpf').focus();

	$('#cpf').mask('000.000.000-00');
	$('#cpfCliente').mask('000.000.000-00');
	$('#telefone').mask('(00) 0000 - 0000');
	$('#coo').mask('000000');

	$(function() {
		$("#valorCupom").maskMoney({
			symbol : 'R$ ',
			showSymbol : true,
			thousands : '.',
			decimal : ',',
			symbolStay : true
		});
	})
</script>

<script type="text/javascript">
	function validarCPF() {
		var cpf = document.cadastro.cpf.value;

		cpf = remove(cpf, ".");
		cpf = remove(cpf, "-");

		if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111"
				|| cpf == "22222222222" || cpf == "33333333333"
				|| cpf == "44444444444" || cpf == "55555555555"
				|| cpf == "66666666666" || cpf == "77777777777"
				|| cpf == "88888888888" || cpf == "99999999999") {
			window.alert("CPF inválido. Tente novamente.");
			return false;
		}

		soma = 0;
		for (i = 0; i < 9; i++)
			soma += parseInt(cpf.charAt(i)) * (10 - i);
		resto = 11 - (soma % 11);
		if (resto == 10 || resto == 11)
			resto = 0;
		if (resto != parseInt(cpf.charAt(9))) {
			window.alert("CPF inválido. Tente novamente.");
			return false;
		}
		soma = 0;
		for (i = 0; i < 10; i++)
			soma += parseInt(cpf.charAt(i)) * (11 - i);
		resto = 11 - (soma % 11);
		if (resto == 10 || resto == 11)
			resto = 0;
		if (resto != parseInt(cpf.charAt(10))) {
			window.alert("CPF inválido. Tente novamente.");
			return false;
		}
		return true;
	}

	function remove(str, sub) {
		i = str.indexOf(sub);
		r = "";
		if (i == -1)
			return str;
		r += str.substring(0, i) + remove(str.substring(i + sub.length), sub);
		return r;
	}
</script>


<jsp:include page="rodape.jsp"></jsp:include>