<jsp:include page="topo.jsp"></jsp:include>

<script type="text/javascript">
	alteraDiv = function() {
		if ($('#digitos').val() == 4) {
			$("#4Digitos").show();
			$("#5Digitos").hide();
		}

		if ($('#digitos').val() == 5) {
			$("#4Digitos").hide();
			$("#5Digitos").show();
		}

	}
</script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

${msgParametros } ${msgClientes }



<div id="4Digitos">
	<form class="form-horizontal" action="/topwinner/cadastrarParametros"
		method="post" name="formulario" onsubmit="envia_tranca();">
		<fieldset>
			<input type="hidden" name="cnpj" value="${u.cnpj }" /> <input
				type="hidden" name="nTorneio" value="${numeroTorneio }" />

			<legend>Tela de parâmetros do novo LUDO. </legend>

			<table class="table table-hover">
				<tr>
					<td>
						<fieldset disabled>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="torneio">ludo</label>
								<div class="col-md-4">
									<input id="torneio" name="torneio" type="text"
										value="${numeroTorneio }" placeholder="Disabled input"
										class="form-control input-md">

								</div>
							</div>
						</fieldset>
					</td>

					<td>
						<!-- Select Basic -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="digitos">digitos</label>
							<div class="col-md-3">
								<select name="digitos" class="form-control" id="digitos"
									onchange="alteraDiv()">
									<option value="5">5</option>
									<option value="4" selected="selected">4</option>
								</select>
							</div>
						</div>
					</td>

				</tr>
				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio1">prêmio
								1</label> <input id="premio1" name="premio1" type="hidden" value="10">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio1" type="text" value="10"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec1">espécie
								1</label>
							<div class="col-md-4">
								<input id="espec1" name="espec1" type="text"
									placeholder="especie 1" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio2">prêmio
								2</label> <input id="premio2" name="premio2" type="hidden" value="9">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio2" type="text" value="9"
										placeholder="premio 2" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec2">espécie
								2</label>
							<div class="col-md-4">
								<input id="espec2" name="espec2" type="text"
									placeholder="especie 2" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio 3">prêmio
								3</label> <input id="premio3" name="premio3" type="hidden" value="8">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio3" type="text" value="8"
										placeholder="premio 3" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec3">espécie
								3</label>
							<div class="col-md-4">
								<input id="espec3" name="espec3" type="text"
									placeholder="especie 3" class="form-control input-md"
									requiredmaxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio4">prêmio
								4</label> <input id="premio4" name="premio4" type="hidden" value="7">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio4" type="text" value="7"
										placeholder="premio 4" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec4">espécie
								4</label>
							<div class="col-md-4">
								<input id="espec4" name="espec4" type="text"
									placeholder="especie 4" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio5">prêmio
								5</label> <input id="premio5" name="premio5" type="hidden" value="6">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio5" type="text" value="6"
										placeholder="premio 6" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec5">espécie
								5</label>
							<div class="col-md-4">
								<input id="espec5" name="espec5" type="text"
									placeholder="especie 5" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio6">prêmio
								6</label> <input id="premio6" name="premio6" type="hidden" value="5">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio6" type="text" value="5"
										placeholder="premio 6" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec6">espécie
								6</label>
							<div class="col-md-4">
								<input id="espec6" name="espec6" type="text"
									placeholder="especie 6" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio7">prêmio
								7</label> <input id="premio7" name="premio7" type="hidden" value="4">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio7" type="text" value="4"
										placeholder="premio 7" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec7">espécie
								7</label>
							<div class="col-md-4">
								<input id="espec7" name="espec7" type="text"
									placeholder="especie 7" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio8">prêmio
								8</label> <input id="premio8" name="premio8" type="hidden" value="3">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio8" type="text" value="3"
										placeholder="premio 8" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec8">espécie
								8</label>
							<div class="col-md-4">
								<input id="espec8" name="espec8" type="text"
									placeholder="especie 8" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio9">prêmio
								máximo</label>
							<div class="col-md-4">
								<input id="premio9" name="premio9" type="text"
									placeholder="premio 9" class="form-control input-md" required
									maxlength="3">

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec9">espécie
								máximo</label>
							<div class="col-md-4">
								<input id="espec9" name="espec9" type="text"
									placeholder="especie 9" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>
			</table>
			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="botao"></label>
				<div class="col-md-4">
					<input type="submit" value="Cadastrar parâmetros"
						id="cadastrarParametros" class="btn btn-primary"></input>
				</div>
			</div>
		</fieldset>
	</form>
</div>



<div id="5Digitos" style="display: none;">
	<form class="form-horizontal" action="/topwinner/cadastrarParametros"
		method="post" name="formulario" onsubmit="envia_tranca();">
		<fieldset>
			<input type="hidden" name="cnpj" value="${u.cnpj }" /> <input
				type="hidden" name="nTorneio" value="${numeroTorneio }" />

			<legend>Tela de parâmetros do novo LUDO. </legend>

			<table class="table table-hover">

				<tr>
					<td>
						<fieldset disabled>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="torneio">ludo</label>
								<div class="col-md-4">
									<input id="torneio" name="torneio" type="text"
										value="${numeroTorneio }" placeholder="Disabled input"
										class="form-control input-md">

								</div>
							</div>
						</fieldset>
					</td>

					<td>
						<!-- Select Basic -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="digitos">digitos</label>
							<div class="col-md-3">
								<select name="digitos" class="form-control" id="digitos"
									onchange="alteraDiv()">
									<option value="5" selected="selected">5</option>
									<option value="4">4</option>
								</select>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio1">prêmio
								1</label> <input id="premio1" name="premio1" type="hidden" value="15">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio1" type="text" value="15"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec1">espécie
								1</label>
							<div class="col-md-4">
								<input id="espec1" name="espec1" type="text"
									placeholder="especie 1" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio2">prêmio
								2</label> <input id="premio2" name="premio2" type="hidden" value="14">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio2" type="text" value="14"
										placeholder="premio 2" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec2">espécie
								2</label>
							<div class="col-md-4">
								<input id="espec2" name="espec2" type="text"
									placeholder="especie 2" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio 3">prêmio
								3</label> <input id="premio3" name="premio3" type="hidden" value="13">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio3" type="text" value="13"
										placeholder="premio 3" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec3">espécie
								3</label>
							<div class="col-md-4">
								<input id="espec3" name="espec3" type="text"
									placeholder="especie 3" class="form-control input-md"
									requiredmaxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio4">prêmio
								4</label> <input id="premio4" name="premio4" type="hidden" value="12">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio4" type="text" value="12"
										placeholder="premio 4" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec4">espécie
								4</label>
							<div class="col-md-4">
								<input id="espec4" name="espec4" type="text"
									placeholder="especie 4" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio5">prêmio
								5</label> <input id="premio5" name="premio5" type="hidden" value="11">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio5" type="text" value="11"
										placeholder="premio 6" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec5">espécie
								5</label>
							<div class="col-md-4">
								<input id="espec5" name="espec5" type="text"
									placeholder="especie 5" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio6">prêmio
								6</label> <input id="premio6" name="premio6" type="hidden" value="10">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio6" type="text" value="10"
										placeholder="premio 6" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec6">espécie
								6</label>
							<div class="col-md-4">
								<input id="espec6" name="espec6" type="text"
									placeholder="especie 6" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio7">prêmio
								7</label> <input id="premio7" name="premio7" type="hidden" value="9">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio7" type="text" value="9"
										placeholder="premio 7" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec7">espécie
								7</label>
							<div class="col-md-4">
								<input id="espec7" name="espec7" type="text"
									placeholder="especie 7" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio8">prêmio
								8</label> <input id="premio8" name="premio8" type="hidden" value="8">
							<fieldset disabled>
								<div class="col-md-4">
									<input id="premio8" type="text" value="8"
										placeholder="premio 8" class="form-control input-md" required
										maxlength="3">
								</div>
							</fieldset>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec8">espécie
								8</label>
							<div class="col-md-4">
								<input id="espec8" name="espec8" type="text"
									placeholder="especie 8" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio9">prêmio
								máximo</label>
							<div class="col-md-4">
								<input id="premio9" name="premio9" type="text"
									placeholder="premio 9" class="form-control input-md" required
									maxlength="3">

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec9">espécie
								máximo</label>
							<div class="col-md-4">
								<input id="espec9" name="espec9" type="text"
									placeholder="especie 9" class="form-control input-md" required
									maxlength="30">

							</div>
						</div>
					</td>
				</tr>
			</table>
			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="botao"></label>
				<div class="col-md-4">
					<input type="submit" value="Cadastrar parâmetros"
						id="cadastrarParametros" class="btn btn-primary"></input>
				</div>
			</div>

		</fieldset>
	</form>
</div>


<jsp:include page="rodape.jsp"></jsp:include>