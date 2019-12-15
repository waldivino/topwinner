<jsp:include page="topo.jsp"></jsp:include>
<div style="text-align: center;">${msgCriarConta }</div>


			<form class="form-horizontal" action="/topwinner/solicitarConta2.winner"
				method="post" name="formulario" onsubmit="envia_tranca();">
				<fieldset>

					<!-- Form Name -->
					<legend>Preencha o cadastro</legend>
					<h2>Cadastrar solicitação de conta</h2>

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


<!-- jQuery 2.1.4 -->
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="dist/js/jquery.mask.js"></script>


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
	
	document.getElementById('cnpj').focus();
</script>

<jsp:include page="rodape.jsp"></jsp:include>