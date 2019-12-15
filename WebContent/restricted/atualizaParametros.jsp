<jsp:include page="topo.jsp"></jsp:include>

<script type="text/javascript">
	alteraDiv = function() {
		if ($('#digitos').val() == 4) {
			$("#4Digitos").hide();
			$("#5Digitos").hide();
			$("#4DigitosAux").show();

		}

		if ($('#digitos').val() == 5) {
			$("#4Digitos").hide();
			$("#5Digitos").hide();
			$("#5DigitosAux").show();
		}

	}
</script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

${msgAtualizaParametros }

<c:if test="${p.digitos == 4}">
	<c:if test="${p.digitos == 5}">
		<div id="4Digitos" style="display: none;">
	</c:if>
	<c:if test="${p.digitos == 4}">
		<div id="4Digitos">
	</c:if>
	<form class="form-horizontal"
		action="/topwinner/atualizaTorneio2.winner" method="post"
		name="formulario" onsubmit="envia_tranca();">
		<fieldset>

			<legend>Tela de parâmetros para atualizar LUDO </legend>

			<input type="hidden" name="cnpj" value="${p.cnpj }" /> <input
				type="hidden" name="nTorneio" value="${p.torneio }" /> <input
				type="hidden" name="idParametro" value="${p.idParametro }" />

			<table class="table table-hover">
				<tr>
					<td>
						<fieldset disabled>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="torneio">ludo</label>
								<div class="col-md-4">
									<input id="torneio" name="torneio" type="text"
										value="${p.torneio }" placeholder="Disabled input"
										class="form-control input-md">

								</div>
							</div>
						</fieldset>
					</td>
					<td><c:if test="${u.administrador == 1}">
							<div class="form-group">
								<label class="col-md-4 control-label" for="digitos">digitos</label>
								<div class="form-group">
									<c:if test="${p.digitos == 4}">
										<div class="col-md-4">
											<select name="digitos" class="form-control" id="digitos"
												onchange="alteraDiv()">
												<option value="${p.digitos }" selected="selected">${p.digitos }</option>
												<option value="5">5</option>
											</select>
										</div>
									</c:if>

									<c:if test="${p.digitos == 5}">
										<div class="col-md-4">
											<select name="digitos" class="form-control" id="digitos"
												onchange="alteraDiv()">
												<option value="${p.digitos }" selected="selected">${p.digitos }</option>
												<option value="4">4</option>
											</select>
										</div>
									</c:if>



								</div>
							</div>
						</c:if>

						<fieldset disabled>
							<c:if test="${u.administrador != 1}">
								<div class="form-group">
									<label class="col-md-4 control-label" for="digitos">digitos</label>
									<div class="col-md-3">
										<input id="torneio" name="torneio" type="text"
											value="${p.digitos }" placeholder="Disabled input"
											class="form-control input-md">
									</div>
								</div>
							</c:if>

						</fieldset></td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio1">prêmio
								1</label>
							<div class="col-md-4">
<input name="premio1" id="premio1" type="hidden" value="10"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio1" id="premio1" type="text" value="10"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec1">espécie
								1</label>
							<div class="col-md-4">
								<input id="espec1" name="espec1" type="text"
									value="${p.espec1 }" placeholder="especie 1"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio2">prêmio
								2</label>
							<div class="col-md-4">
<input name="premio2" id="premio1" type="hidden" value="9"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio2" id="premio1" type="text" value="9"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec2">espécie
								2</label>
							<div class="col-md-4">
								<input id="espec2" name="espec2" type="text"
									value="${p.espec2 }" placeholder="especie 2"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio 3">prêmio
								3</label>
							<div class="col-md-4">
<input name="premio3" id="premio1" type="hidden" value="8"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio3" id="premio1" type="text" value="8"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec3">espécie
								3</label>
							<div class="col-md-4">
								<input id="espec3" name="espec3" type="text"
									value="${p.espec3 }" placeholder="especie 3"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio4">prêmio
								4</label>
							<div class="col-md-4">
<input name="premio4" id="premio1" type="hidden" value="7"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio4" id="premio1" type="text" value="7"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec4">espécie
								4</label>
							<div class="col-md-4">
								<input id="espec4" name="espec4" type="text"
									value="${p.espec4 }" placeholder="especie 4"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio5">prêmio
								5</label>
							<div class="col-md-4">
<input name="premio5" id="premio1" type="hidden" value="6"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio5" id="premio1" type="text" value="6"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec5">espécie
								5</label>
							<div class="col-md-4">
								<input id="espec5" name="espec5" type="text"
									value="${p.espec5 }" placeholder="especie 5"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio6">prêmio
								6</label>
							<div class="col-md-4">
<input name="premio6" id="premio1" type="hidden" value="5"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio6" id="premio1" type="text" value="5"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec6">espécie
								6</label>
							<div class="col-md-4">
								<input id="espec6" name="espec6" type="text"
									value="${p.espec6 }" placeholder="especie 6"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio7">prêmio
								7</label>
							<div class="col-md-4">
<input name="premio7" id="premio1" type="hidden" value="4"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio7" id="premio1" type="text" value="4"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec7">espécie
								7</label>
							<div class="col-md-4">
								<input id="espec7" name="espec7" type="text"
									value="${p.espec7 }" placeholder="especie 7"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio8">prêmio
								8</label>
							<div class="col-md-4">
								<input name="premio8" id="premio1" type="hidden" value="3"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio8" id="premio1" type="text" value="3"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec8">espécie
								8</label>
							<div class="col-md-4">
								<input id="espec8" name="espec8" type="text"
									value="${p.espec8 }" placeholder="especie 8"
									class="form-control input-md" required maxlength="30">

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
								<input name="premio9" id="premio9" name="premio9" type="text"
									value="${p.premio9 }" placeholder="premio 9"
									class="form-control input-md" required maxlength="3">

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec9">espécie
								máxima</label>
							<div class="col-md-4">
								<input id="espec9" name="espec9" type="text"
									value="${p.espec9 }" placeholder="especie 9"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>
			</table>


			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="botao"></label>
				<div class="col-md-4">
					<input type="submit" value="Atualizar parâmetros"
						id="cadastrarParametros" class="btn btn-primary"></input>
				</div>
			</div>
		</fieldset>
	</form>
	</div>
</c:if>



<c:if test="${p.digitos == 5}">
	<c:if test="${p.digitos == 5}">
		<div id="5Digitos">
	</c:if>
	<c:if test="${p.digitos == 4}">
		<div id="5Digitos" style="display: none;">
	</c:if>
	<form class="form-horizontal"
		action="/topwinner/atualizaTorneio2.winner" method="post"
		name="formulario" onsubmit="envia_tranca();">
		<fieldset>

			<legend>Tela de parâmetros para atualizar LUDO </legend>

			<input type="hidden" name="cnpj" value="${p.cnpj }" /> <input
				type="hidden" name="nTorneio" value="${p.torneio }" /> <input
				type="hidden" name="idParametro" value="${p.idParametro }" />

			<table class="table table-hover">
				<tr>
					<td>
						<fieldset disabled>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="torneio">ludo</label>
								<div class="col-md-4">
									<input id="torneio" name="torneio" type="text"
										value="${p.torneio }" placeholder="Disabled input"
										class="form-control input-md">

								</div>
							</div>
						</fieldset>
					</td>
					<td><c:if test="${u.administrador == 1}">
							<div class="form-group">
								<label class="col-md-4 control-label" for="digitos">digitos</label>
								<div class="form-group">
									<c:if test="${p.digitos == 4}">
										<div class="col-md-4">
											<select name="digitos" class="form-control" id="digitos"
												onchange="alteraDiv()">
												<option value="${p.digitos }" selected="selected">${p.digitos }</option>
												<option value="5">5</option>
											</select>
										</div>
									</c:if>

									<c:if test="${p.digitos == 5}">
										<div class="col-md-4">
											<select name="digitos" class="form-control" id="digitos"
												onchange="alteraDiv()">
												<option value="${p.digitos }" selected="selected">${p.digitos }</option>
												<option value="4">4</option>
											</select>
										</div>
									</c:if>



								</div>
							</div>
						</c:if>

						<fieldset disabled>
							<c:if test="${u.administrador != 1}">
								<div class="form-group">
									<label class="col-md-4 control-label" for="digitos">digitos</label>
									<div class="col-md-3">
										<input id="torneio" name="torneio" type="text"
											value="${p.digitos }" placeholder="Disabled input"
											class="form-control input-md">
									</div>
								</div>
							</c:if>

						</fieldset></td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio1">prêmio
								1</label>
							<div class="col-md-4">

								<input name="premio1" id="premio1" type="hidden" value="15"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">

								<fieldset disabled>
									<input name="premio1" id="premio1" type="text" value="15"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec1">espécie
								1</label>
							<div class="col-md-4">
								<input id="espec1" name="espec1" type="text"
									value="${p.espec1 }" placeholder="especie 1"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio2">prêmio
								2</label>
							<div class="col-md-4">

								<input name="premio2" id="premio1" type="hidden" value="14"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio2" id="premio1" type="text" value="14"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec2">espécie
								2</label>
							<div class="col-md-4">
								<input id="espec2" name="espec2" type="text"
									value="${p.espec2 }" placeholder="especie 2"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio 3">prêmio
								3</label>
							<div class="col-md-4">
								<input name="premio3" id="premio1" type="hidden" value="13"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio3" id="premio1" type="text" value="13"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec3">espécie
								3</label>
							<div class="col-md-4">
								<input id="espec3" name="espec3" type="text"
									value="${p.espec3 }" placeholder="especie 3"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio4">prêmio
								4</label>
							<div class="col-md-4">

								<input name="premio4" id="premio1" type="hidden" value="12"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio4" id="premio1" type="text" value="12"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec4">espécie
								4</label>
							<div class="col-md-4">
								<input id="espec4" name="espec4" type="text"
									value="${p.espec4 }" placeholder="especie 4"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio5">prêmio
								5</label>
							<div class="col-md-4">
								<input name="premio5" id="premio1" type="hidden" value="11"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio5" id="premio1" type="text" value="11"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec5">espécie
								5</label>
							<div class="col-md-4">
								<input id="espec5" name="espec5" type="text"
									value="${p.espec5 }" placeholder="especie 5"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio6">prêmio
								6</label>
							<div class="col-md-4">
								<input name="premio6" id="premio1" type="hidden" value="10"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio6" id="premio1" type="text" value="10"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec6">espécie
								6</label>
							<div class="col-md-4">
								<input id="espec6" name="espec6" type="text"
									value="${p.espec6 }" placeholder="especie 6"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio7">prêmio
								7</label>
							<div class="col-md-4">
								<input name="premio7" id="premio1" type="hidden" value="9"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio7" id="premio1" type="text" value="9"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec7">espécie
								7</label>
							<div class="col-md-4">
								<input id="espec7" name="espec7" type="text"
									value="${p.espec7 }" placeholder="especie 7"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio8">prêmio
								8</label>
							<div class="col-md-4">
								<input name="premio8" id="premio1" type="hidden" value="8"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio8" id="premio1" type="text" value="8"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec8">espécie
								8</label>
							<div class="col-md-4">
								<input id="espec8" name="espec8" type="text"
									value="${p.espec8 }" placeholder="especie 8"
									class="form-control input-md" required maxlength="30">

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
								<input name="premio9" id="premio9" name="premio9" type="text"
									value="${p.premio9 }" placeholder="premio 9"
									class="form-control input-md" required maxlength="3">

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec9">espécie
								máxima</label>
							<div class="col-md-4">
								<input id="espec9" name="espec9" type="text"
									value="${p.espec9 }" placeholder="especie 9"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>
			</table>
			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="botao"></label>
				<div class="col-md-4">
					<input type="submit" value="Atualizar parâmetros"
						id="cadastrarParametros" class="btn btn-primary"></input>
				</div>
			</div>
		</fieldset>
	</form>
	</div>
</c:if>


<div id="4DigitosAux" style="display: none;">

	<form class="form-horizontal"
		action="/topwinner/atualizaTorneio2.winner" method="post"
		name="formulario" onsubmit="envia_tranca();">
		<fieldset>

			<legend>Tela de parâmetros para atualizar LUDO. </legend>

			<input type="hidden" name="cnpj" value="${p.cnpj }" /> <input
				type="hidden" name="nTorneio" value="${p.torneio }" /> <input
				type="hidden" name="idParametro" value="${p.idParametro }" />

			<table class="table table-hover">
				<tr>
					<td>
						<fieldset disabled>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="torneio">ludo</label>
								<div class="col-md-4">
									<input id="torneio" name="torneio" type="text"
										value="${p.torneio }" placeholder="Disabled input"
										class="form-control input-md">

								</div>
							</div>
						</fieldset>
					</td>
					<td><c:if test="${u.administrador == 1}">
							<div class="form-group">
								<label class="col-md-4 control-label" for="digitos">digitos</label>
								<div class="form-group">
										<div class="col-md-4">
											<select name="digitos" class="form-control" id="digitos"
												onchange="alteraDiv()">
												<option value="4" selected="selected">4</option>
												<option value="5">5</option>
											</select>
										</div>



								</div>
							</div>
						</c:if>

						<fieldset disabled>
							<c:if test="${u.administrador != 1}">
								<div class="form-group">
									<label class="col-md-4 control-label" for="digitos">digitos</label>
									<div class="col-md-3">
										<input id="torneio" name="torneio" type="text"
											value="${p.digitos }" placeholder="Disabled input"
											class="form-control input-md">
									</div>
								</div>
							</c:if>

						</fieldset></td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio1">prêmio
								1</label>
							<div class="col-md-4">
								<input name="premio1" id="premio1" type="hidden" value="10"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio1" id="premio1" type="text" value="10"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec1">espécie
								1</label>
							<div class="col-md-4">
								<input id="espec1" name="espec1" type="text"
									value="${p.espec1 }" placeholder="especie 1"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio2">prêmio
								2</label>
							<div class="col-md-4">
								<input name="premio2" id="premio1" type="hidden" value="9"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio2" id="premio1" type="text" value="9"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec2">espécie
								2</label>
							<div class="col-md-4">
								<input id="espec2" name="espec2" type="text"
									value="${p.espec2 }" placeholder="especie 2"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio 3">prêmio
								3</label>
							<div class="col-md-4">
								<input name="premio3" id="premio1" type="hidden" value="8"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio3" id="premio1" type="text" value="8"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec3">espécie
								3</label>
							<div class="col-md-4">
								<input id="espec3" name="espec3" type="text"
									value="${p.espec3 }" placeholder="especie 3"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio4">prêmio
								4</label>
							<div class="col-md-4">
								<input name="premio4" id="premio1" type="hidden" value="7"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio4" id="premio1" type="text" value="7"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec4">espécie
								4</label>
							<div class="col-md-4">
								<input id="espec4" name="espec4" type="text"
									value="${p.espec4 }" placeholder="especie 4"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio5">prêmio
								5</label>
							<div class="col-md-4">
<input name="premio5" id="premio1" type="hidden" value="6"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio5" id="premio1" type="text" value="6"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec5">espécie
								5</label>
							<div class="col-md-4">
								<input id="espec5" name="espec5" type="text"
									value="${p.espec5 }" placeholder="especie 5"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio6">prêmio
								6</label>
							<div class="col-md-4">
<input name="premio6" id="premio1" type="hidden" value="5"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio6" id="premio1" type="text" value="5"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec6">espécie
								6</label>
							<div class="col-md-4">
								<input id="espec6" name="espec6" type="text"
									value="${p.espec6 }" placeholder="especie 6"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio7">prêmio
								7</label>
							<div class="col-md-4">
<input name="premio7" id="premio1" type="hidden" value="4"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio7" id="premio1" type="text" value="4"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec7">espécie
								7</label>
							<div class="col-md-4">
								<input id="espec7" name="espec7" type="text"
									value="${p.espec7 }" placeholder="especie 7"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio8">prêmio
								8</label>
							<div class="col-md-4">
								<input name="premio8" id="premio1" type="hidden" value="3"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio8" id="premio1" type="text" value="3"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec8">espécie
								8</label>
							<div class="col-md-4">
								<input id="espec8" name="espec8" type="text"
									value="${p.espec8 }" placeholder="especie 8"
									class="form-control input-md" required maxlength="30">

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
								<input name="premio9" id="premio9" name="premio9" type="text"
									value="${p.premio9 }" placeholder="premio 9"
									class="form-control input-md" required maxlength="3">

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec9">espécie
								máxima</label>
							<div class="col-md-4">
								<input id="espec9" name="espec9" type="text"
									value="${p.espec9 }" placeholder="especie 9"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>
			</table>


			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="botao"></label>
				<div class="col-md-4">
					<input type="submit" value="Atualizar parâmetros"
						id="cadastrarParametros" class="btn btn-primary"></input>
				</div>
			</div>
		</fieldset>
	</form>
</div>


<div id="5DigitosAux" style="display: none;">

	<form class="form-horizontal"
		action="/topwinner/atualizaTorneio2.winner" method="post"
		name="formulario" onsubmit="envia_tranca();">
		<fieldset>

			<legend>Tela de parâmetros para atualizar LUDO. </legend>

			<input type="hidden" name="cnpj" value="${p.cnpj }" /> <input
				type="hidden" name="nTorneio" value="${p.torneio }" /> <input
				type="hidden" name="idParametro" value="${p.idParametro }" />

			<table class="table table-hover">
				<tr>
					<td>
						<fieldset disabled>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="torneio">ludo</label>
								<div class="col-md-4">
									<input id="torneio" name="torneio" type="text"
										value="${p.torneio }" placeholder="Disabled input"
										class="form-control input-md">

								</div>
							</div>
						</fieldset>
					</td>
					<td><c:if test="${u.administrador == 1}">
							<div class="form-group">
								<label class="col-md-4 control-label" for="digitos">digitos</label>
								<div class="form-group">

										<div class="col-md-4">
											<select name="digitos" class="form-control" id="digitos"
												onchange="alteraDiv()">
												<option value="5" selected="selected">5</option>
												<option value="4">4</option>
											</select>
										</div>



								</div>
							</div>
						</c:if>

						<fieldset disabled>
							<c:if test="${u.administrador != 1}">
								<div class="form-group">
									<label class="col-md-4 control-label" for="digitos">digitos</label>
									<div class="col-md-3">
										<input id="torneio" name="torneio" type="text"
											value="${p.digitos }" placeholder="Disabled input"
											class="form-control input-md">
									</div>
								</div>
							</c:if>

						</fieldset></td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio1">prêmio
								1</label>
							<div class="col-md-4">
<input name="premio1" id="premio1" type="hidden" value="15"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio1" id="premio1" type="text" value="15"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec1">espécie
								1</label>
							<div class="col-md-4">
								<input id="espec1" name="espec1" type="text"
									value="${p.espec1 }" placeholder="especie 1"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio2">prêmio
								2</label>
							<div class="col-md-4">
								<input name="premio2" id="premio1" type="hidden" value="14"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio2" id="premio1" type="text" value="14"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec2">espécie
								2</label>
							<div class="col-md-4">
								<input id="espec2" name="espec2" type="text"
									value="${p.espec2 }" placeholder="especie 2"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio 3">prêmio
								3</label>
							<div class="col-md-4">
<input name="premio3" id="premio1" type="hidden" value="13"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio3" id="premio1" type="text" value="13"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec3">espécie
								3</label>
							<div class="col-md-4">
								<input id="espec3" name="espec3" type="text"
									value="${p.espec3 }" placeholder="especie 3"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio4">prêmio
								4</label>
							<div class="col-md-4">

<input name="premio4" id="premio1" type="hidden" value="12"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio4" id="premio1" type="text" value="12"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec4">espécie
								4</label>
							<div class="col-md-4">
								<input id="espec4" name="espec4" type="text"
									value="${p.espec4 }" placeholder="especie 4"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio5">prêmio
								5</label>
							<div class="col-md-4">
<input name="premio5" id="premio1" type="hidden" value="11"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio5" id="premio1" type="text" value="11"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec5">espécie
								5</label>
							<div class="col-md-4">
								<input id="espec5" name="espec5" type="text"
									value="${p.espec5 }" placeholder="especie 5"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio6">prêmio
								6</label>
							<div class="col-md-4">
<input name="premio6" id="premio1" type="hidden" value="10"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio6" id="premio1" type="text" value="10"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec6">espécie
								6</label>
							<div class="col-md-4">
								<input id="espec6" name="espec6" type="text"
									value="${p.espec6 }" placeholder="especie 6"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio7">prêmio
								7</label>
							<div class="col-md-4">
<input name="premio7" id="premio1" type="hidden" value="9"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								<fieldset disabled>
									<input name="premio7" id="premio1" type="text" value="9"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec7">espécie
								7</label>
							<div class="col-md-4">
								<input id="espec7" name="espec7" type="text"
									value="${p.espec7 }" placeholder="especie 7"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="premio8">prêmio
								8</label>
							<div class="col-md-4">
								<input name="premio8" id="premio1" type="hidden" value="8"
									placeholder="premio 1" class="form-control input-md" required
									maxlength="3">
								<fieldset disabled>
									<input name="premio8" id="premio1" type="text" value="8"
										placeholder="premio 1" class="form-control input-md" required
										maxlength="3">
								</fieldset>

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec8">espécie
								8</label>
							<div class="col-md-4">
								<input id="espec8" name="espec8" type="text"
									value="${p.espec8 }" placeholder="especie 8"
									class="form-control input-md" required maxlength="30">

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
								<input name="premio9" id="premio9" name="premio9" type="text"
									value="${p.premio9 }" placeholder="premio 9"
									class="form-control input-md" required maxlength="3">

							</div>
						</div>
					</td>
					<td>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="espec9">espécie
								máxima</label>
							<div class="col-md-4">
								<input id="espec9" name="espec9" type="text"
									value="${p.espec9 }" placeholder="especie 9"
									class="form-control input-md" required maxlength="30">

							</div>
						</div>
					</td>
				</tr>
			</table>
			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="botao"></label>
				<div class="col-md-4">
					<input type="submit" value="Atualizar parâmetros"
						id="cadastrarParametros" class="btn btn-primary"></input>
				</div>
			</div>
		</fieldset>
	</form>
</div>


<jsp:include page="rodape.jsp"></jsp:include>