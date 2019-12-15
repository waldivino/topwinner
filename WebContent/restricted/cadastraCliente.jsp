<jsp:include page="topo.jsp"></jsp:include>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="text-align: center;">${msgClientes }</div>

<div>
	<b>Banco de dados suplementar - Informações para Perfil de clientes</b>
</div>
<br>
<br>
<form action="/topwinner/chamarCadastroCliente.winner" method="post"
	class="form-horizontal">
	<fieldset>
		<div class="form-group">
			<label class="col-md-4 control-label" for="cpfCliente">CPF:</label>
			<div class="col-md-5">
				<table>
					<tr>
						<td><input id="cpfCliente" name="cpfCliente" type="text"
							value="${cliente.cpf }" placeholder="000.000.000-00"
							class="form-control input-md" maxlength="14" required="required"></td>
						<td><input type="submit" value="OK" id="btn"
							class="btn btn-primary"></td>
					</tr>
				</table>

			</div>
		</div>

	</fieldset>
</form>
<fieldset>
	<form action="/topwinner/cadastroCliente.winner" method="post"
		class="form-horizontal">
		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="nome">Nome:</label>
			<div class="col-md-5">
				<input id="nome" name="nome" type="text" value="${cliente.nome }"
					placeholder="Digite o nome do cliente"
					class="form-control input-md" required="required">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="celular">Celular:</label>
			<div class="col-md-5">
				<input id="celular" name="celular" type="text"
					value="${cliente.celular }" placeholder="(00) 00000-0000"
					class="form-control input-md" required="required">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="input-demo-cep">Cep:</label>
			<div class="col-md-5">
				<input id="input-demo-cep" name="cep" type="text"
					value="${cliente.cep }" placeholder="00000-000"
					class="cep form-control input-md" required="required">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="input-demo-logradouro">Logradouro:</label>
			<div class="col-md-5">
				<table>
					<tr>
						<td><input id="input-demo-tipo_logradouro"
							data-cep="tipo_logradouro" name="tipo" type="text"
							value="${cliente.tipo }" class="form-control input-md"
							placeholder="Tipo logradouro" required="required"></td>
						<td style="width: 300px;"><input id="input-demo-logradouro"
							data-cep="logradouro" name="logradouro" type="text"
							value="${cliente.logradouro }" placeholder="Digite o logradouro"
							class="form-control input-md" required="required"></td>
					</tr>
				</table>


			</div>
		</div>
		<div data-cep="tipo_logradouro"></div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="input-demo-bairro">Bairro:</label>
			<div class="col-md-5">
				<input id="input-demo-bairro" data-cep="bairro" name="bairro"
					type="text" placeholder="Digite o bairro"
					value="${cliente.bairro }" class="form-control input-md"
					required="required">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="input-demo-cidade">Município:</label>
			<div class="col-md-5">
				<input id="input-demo-cidade" data-cep="cidade" name="municipio"
					type="text" placeholder="Digite o município"
					value="${cliente.municipio }" class="form-control input-md"
					required="required">

			</div>
		</div>

		<c:if test="${cliente.uf != null}">
			<c:if test="${cliente.uf == AC}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC" selected="selected">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'AL'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL" selected="selected">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'AM'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px"> 

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP" selected="selected">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'AP'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP" selected="selected">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'BA'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA" selected="selected">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'CE'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE" selected="selected">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'DF'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF" selected="selected">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'ES'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES" selected="selected">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'GO'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO" selected="selected">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'MA'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA" selected="selected">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'MG'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG" selected="selected">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'MS'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS" selected="selected">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'MT'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT" selected="selected">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'PA'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA" selected="selected">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'PB'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB" selected="selected">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'PE'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE" selected="selected">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'PI'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI" selected="selected">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'PR'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR" selected="selected">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'RJ'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ" selected="selected">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'RN'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN" selected="selected">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'RS'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS" selected="selected">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'RO'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO" selected="selected">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'RR'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR" selected="selected">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'SC'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC" selected="selected">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'SE'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE" selected="selected">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'SP'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP" selected="selected">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
			</c:if>
			<c:if test="${cliente.uf == 'TO'}">
				<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO" selected="selected">TO</option>
					</select>
				</div>
			</div>
			</c:if>
		</c:if>



		<c:if test="${cliente.uf == null}">
			<div class="form-group">
				<label class="col-md-4 control-label" for="input-demo-uf">UF:</label>
				<div class="col-md-1">
					<select id="input-demo-uf" data-cep="uf" name="uf"
						class="form-control" required="required" style="width: 70px">

						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ" selected="selected">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
					</select>
				</div>
			</div>
		</c:if>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="complemento">Complemento:</label>
			<div class="col-md-5">
				<input id="complemento" name="complemento" type="text"
					value="${cliente.complemento }" placeholder="Digite o complemento"
					class="form-control input-md" required="required">

			</div>
		</div>

		<!-- Multiple Radios (inline) -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="idade">Idade:</label>
			<div class="col-md-4">
				<c:if test="${cliente.idade == null}">
					<div class="radio">
						<label class="radio" for="idade-0"> <input type="radio"
							name="idade" id="idade-0" value="1" checked="checked">
							Até 20 anos
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="idade-1"> <input type="radio"
							name="idade" id="idade-1" value="2"> &gt; 20 até 40
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="idade-2"> <input type="radio"
							name="idade" id="idade-2" value="3"> &gt; 40 até 60
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="idade-3"> <input type="radio"
							name="idade" id="idade-3" value="4"> &gt; 60
						</label>
					</div>
				</c:if>
				
				<c:if test="${cliente.idade == 0}">
					<div class="radio">
						<label class="radio" for="idade-0"> <input type="radio"
							name="idade" id="idade-0" value="1" checked="checked">
							Até 20 anos
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="idade-1"> <input type="radio"
							name="idade" id="idade-1" value="2"> &gt; 20 até 40
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="idade-2"> <input type="radio"
							name="idade" id="idade-2" value="3"> &gt; 40 até 60
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="idade-3"> <input type="radio"
							name="idade" id="idade-3" value="4"> &gt; 60
						</label>
					</div>
				</c:if>

				<c:if test="${cliente.idade != null}">
					<c:if test="${cliente.idade == 1}">
						<div class="radio">
							<label class="radio" for="idade-0"> <input type="radio"
								name="idade" id="idade-0" value="1" checked="checked">
								Até 20 anos
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-1"> <input type="radio"
								name="idade" id="idade-1" value="2"> &gt; 20 até 40
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-2"> <input type="radio"
								name="idade" id="idade-2" value="3"> &gt; 40 até 60
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-3"> <input type="radio"
								name="idade" id="idade-3" value="4"> &gt; 60
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.idade == 2}">
						<div class="radio">
							<label class="radio" for="idade-0"> <input type="radio"
								name="idade" id="idade-0" value="1"> Até 20 anos
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-1"> <input type="radio"
								name="idade" id="idade-1" value="2" checked="checked">
								&gt; 20 até 40
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-2"> <input type="radio"
								name="idade" id="idade-2" value="3"> &gt; 40 até 60
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-3"> <input type="radio"
								name="idade" id="idade-3" value="4"> &gt; 60
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.idade == 3}">
						<div class="radio">
							<label class="radio" for="idade-0"> <input type="radio"
								name="idade" id="idade-0" value="1"> Até 20 anos
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-1"> <input type="radio"
								name="idade" id="idade-1" value="2"> &gt; 20 até 40
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-2"> <input type="radio"
								name="idade" id="idade-2" value="3" checked="checked">
								&gt; 40 até 60
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-3"> <input type="radio"
								name="idade" id="idade-3" value="4"> &gt; 60
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.idade == 4}">
						<div class="radio">
							<label class="radio" for="idade-0"> <input type="radio"
								name="idade" id="idade-0" value="1"> Até 20 anos
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-1"> <input type="radio"
								name="idade" id="idade-1" value="2"> &gt; 20 até 40
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-2"> <input type="radio"
								name="idade" id="idade-2" value="3"> &gt; 40 até 60
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="idade-3"> <input type="radio"
								name="idade" id="idade-3" value="4" checked="checked">
								&gt; 60
							</label>
						</div>
					</c:if>
				</c:if>
			</div>
		</div>

		<!-- Multiple Radios (inline) -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="genero">Gênero:</label>
			<div class="col-md-4">
				<c:if test="${cliente.sexo == null}">
					<div class="radio">
						<label class="radio" for="genero-0"> <input type="radio"
							name="genero" id="genero-0" value="M" checked="checked">
							Masculino
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="genero-1"> <input type="radio"
							name="genero" id="genero-1" value="F"> Feminino
						</label>
					</div>
				</c:if>

				<c:if test="${cliente.sexo != null}">
					<c:if test="${cliente.sexo == 'M'}">
						<div class="radio">
							<label class="radio" for="genero-0"> <input type="radio"
								name="genero" id="genero-0" value="M" checked="checked">
								Masculino
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="genero-1"> <input type="radio"
								name="genero" id="genero-1" value="F"> Feminino
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.sexo == 'F'}">
						<div class="radio">
							<label class="radio" for="genero-0"> <input type="radio"
								name="genero" id="genero-0" value="M"> Masculino
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="genero-1"> <input type="radio"
								name="genero" id="genero-1" value="F" checked="checked">
								Feminino
							</label>
						</div>
					</c:if>
				</c:if>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-4 control-label" for="estadoCivil">Estado
				Civil:</label>
			<div class="col-md-4">
				<c:if test="${cliente.estado_civil == null}">
					<div class="radio">
						<label class="radio" for="estadoCivil-0"> <input
							type="radio" name="estadoCivil" id="estadoCivil-0" value="1"
							checked="checked"> Solteiro
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="estadoCivil-1"> <input
							type="radio" name="estadoCivil" id="estadoCivil-1" value="2">
							Casado
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="estadoCivil-2"> <input
							type="radio" name="estadoCivil" id="estadoCivil-2" value="3">
							Divorciado
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="estadoCivil-3"> <input
							type="radio" name="estadoCivil" id="estadoCivil-3" value="4">
							Outros
						</label>
					</div>
				</c:if>
				
				<c:if test="${cliente.estado_civil == 0}">
					<div class="radio">
						<label class="radio" for="estadoCivil-0"> <input
							type="radio" name="estadoCivil" id="estadoCivil-0" value="1"
							checked="checked"> Solteiro
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="estadoCivil-1"> <input
							type="radio" name="estadoCivil" id="estadoCivil-1" value="2">
							Casado
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="estadoCivil-2"> <input
							type="radio" name="estadoCivil" id="estadoCivil-2" value="3">
							Divorciado
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="estadoCivil-3"> <input
							type="radio" name="estadoCivil" id="estadoCivil-3" value="4">
							Outros
						</label>
					</div>
				</c:if>

				<c:if test="${cliente.estado_civil != null}">
					<c:if test="${cliente.estado_civil == 1}">
						<div class="radio">
							<label class="radio" for="estadoCivil-0"> <input
								type="radio" name="estadoCivil" id="estadoCivil-0" value="1"
								checked="checked"> Solteiro
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-1"> <input
								type="radio" name="estadoCivil" id="estadoCivil-1" value="2">
								Casado
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-2"> <input
								type="radio" name="estadoCivil" id="estadoCivil-2" value="3">
								Divorciado
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-3"> <input
								type="radio" name="estadoCivil" id="estadoCivil-3" value="4">
								Outros
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.estado_civil == 2}">
						<div class="radio">
							<label class="radio" for="estadoCivil-0"> <input
								type="radio" name="estadoCivil" id="estadoCivil-0" value="1">
								Solteiro
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-1"> <input
								type="radio" name="estadoCivil" id="estadoCivil-1" value="2"
								checked="checked"> Casado
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-2"> <input
								type="radio" name="estadoCivil" id="estadoCivil-2" value="3">
								Divorciado
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-3"> <input
								type="radio" name="estadoCivil" id="estadoCivil-3" value="4">
								Outros
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.estado_civil == 3}">
						<div class="radio">
							<label class="radio" for="estadoCivil-0"> <input
								type="radio" name="estadoCivil" id="estadoCivil-0" value="1">
								Solteiro
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-1"> <input
								type="radio" name="estadoCivil" id="estadoCivil-1" value="2">
								Casado
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-2"> <input
								type="radio" name="estadoCivil" id="estadoCivil-2" value="3"
								checked="checked"> Divorciado
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-3"> <input
								type="radio" name="estadoCivil" id="estadoCivil-3" value="4">
								Outros
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.estado_civil == 4}">
						<div class="radio">
							<label class="radio" for="estadoCivil-0"> <input
								type="radio" name="estadoCivil" id="estadoCivil-0" value="1">
								Solteiro
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-1"> <input
								type="radio" name="estadoCivil" id="estadoCivil-1" value="2">
								Casado
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-2"> <input
								type="radio" name="estadoCivil" id="estadoCivil-2" value="3">
								Divorciado
							</label>
						</div>
						<div class="radio">
							<label class="radio" for="estadoCivil-3"> <input
								type="radio" name="estadoCivil" id="estadoCivil-3" value="4"
								checked="checked"> Outros
							</label>
						</div>
					</c:if>
				</c:if>
			</div>
		</div>

		<!-- Multiple Radios (inline) -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="renda">Renda:</label>
			<div class="col-md-4">
				<c:if test="${cliente.renda == null}">
					<div class="radio">
						<label class="radio" for="renda-0"> <input type="radio"
							name="renda" id="renda-0" value="1" checked="checked">
							Até 1 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-1"> <input type="radio"
							name="renda" id="renda-1" value="2"> &gt; 1 até 2 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-2"> <input type="radio"
							name="renda" id="renda-2" value="3"> &gt; 2 até 5 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-3"> <input type="radio"
							name="renda" id="renda-3" value="4"> &gt; 5 até 10 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-4"> <input type="radio"
							name="renda" id="renda-4" value="5"> &gt; 10 até 20 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-5"> <input type="radio"
							name="renda" id="renda-5" value="6"> &gt; 20 SM
						</label>
					</div>
				</c:if>
				
				<c:if test="${cliente.renda == 0}">
					<div class="radio">
						<label class="radio" for="renda-0"> <input type="radio"
							name="renda" id="renda-0" value="1" checked="checked">
							Até 1 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-1"> <input type="radio"
							name="renda" id="renda-1" value="2"> &gt; 1 até 2 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-2"> <input type="radio"
							name="renda" id="renda-2" value="3"> &gt; 2 até 5 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-3"> <input type="radio"
							name="renda" id="renda-3" value="4"> &gt; 5 até 10 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-4"> <input type="radio"
							name="renda" id="renda-4" value="5"> &gt; 10 até 20 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-5"> <input type="radio"
							name="renda" id="renda-5" value="6"> &gt; 20 SM
						</label>
					</div>
				</c:if>
				<c:if test="${cliente.renda != null}">
					<c:if test="${cliente.renda == 1}">
						<div class="radio">
						<label class="radio" for="renda-0"> <input type="radio"
							name="renda" id="renda-0" value="1" checked="checked">
							Até 1 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-1"> <input type="radio"
							name="renda" id="renda-1" value="2"> &gt; 1 até 2 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-2"> <input type="radio"
							name="renda" id="renda-2" value="3"> &gt; 2 até 5 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-3"> <input type="radio"
							name="renda" id="renda-3" value="4"> &gt; 5 até 10 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-4"> <input type="radio"
							name="renda" id="renda-4" value="5"> &gt; 10 até 20 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-5"> <input type="radio"
							name="renda" id="renda-5" value="6"> &gt; 20 SM
						</label>
					</div>
					</c:if>
					<c:if test="${cliente.renda == 2}">
						<div class="radio">
						<label class="radio" for="renda-0"> <input type="radio"
							name="renda" id="renda-0" value="1">
							Até 1 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-1"> <input type="radio"
							name="renda" id="renda-1" value="2" checked="checked"> &gt; 1 até 2 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-2"> <input type="radio"
							name="renda" id="renda-2" value="3"> &gt; 2 até 5 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-3"> <input type="radio"
							name="renda" id="renda-3" value="4"> &gt; 5 até 10 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-4"> <input type="radio"
							name="renda" id="renda-4" value="5"> &gt; 10 até 20 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-5"> <input type="radio"
							name="renda" id="renda-5" value="6"> &gt; 20 SM
						</label>
					</div>
					</c:if>
					<c:if test="${cliente.renda == 3}">
						<div class="radio">
						<label class="radio" for="renda-0"> <input type="radio"
							name="renda" id="renda-0" value="1">
							Até 1 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-1"> <input type="radio"
							name="renda" id="renda-1" value="2"> &gt; 1 até 2 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-2"> <input type="radio"
							name="renda" id="renda-2" value="3" checked="checked"> &gt; 2 até 5 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-3"> <input type="radio"
							name="renda" id="renda-3" value="4"> &gt; 5 até 10 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-4"> <input type="radio"
							name="renda" id="renda-4" value="5"> &gt; 10 até 20 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-5"> <input type="radio"
							name="renda" id="renda-5" value="6"> &gt; 20 SM
						</label>
					</div>
					</c:if>
					<c:if test="${cliente.renda == 4}">
						<div class="radio">
						<label class="radio" for="renda-0"> <input type="radio"
							name="renda" id="renda-0" value="1">
							Até 1 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-1"> <input type="radio"
							name="renda" id="renda-1" value="2"> &gt; 1 até 2 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-2"> <input type="radio"
							name="renda" id="renda-2" value="3"> &gt; 2 até 5 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-3"> <input type="radio"
							name="renda" id="renda-3" value="4" checked="checked"> &gt; 5 até 10 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-4"> <input type="radio"
							name="renda" id="renda-4" value="5"> &gt; 10 até 20 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-5"> <input type="radio"
							name="renda" id="renda-5" value="6"> &gt;  20 SM
						</label>
					</div>
					</c:if>
					<c:if test="${cliente.renda == 5}">
						<div class="radio">
						<label class="radio" for="renda-0"> <input type="radio"
							name="renda" id="renda-0" value="1">
							Até 1 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-1"> <input type="radio"
							name="renda" id="renda-1" value="2"> &gt; 1 até 2 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-2"> <input type="radio"
							name="renda" id="renda-2" value="3"> &gt; 2 até 5 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-3"> <input type="radio"
							name="renda" id="renda-3" value="4"> &gt; 5 até 10 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-4"> <input type="radio"
							name="renda" id="renda-4" value="5" checked="checked"> &gt; 10 até 20 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-5"> <input type="radio"
							name="renda" id="renda-5" value="6"> &gt;  20 SM
						</label>
					</div>
					</c:if>
					<c:if test="${cliente.renda == 6}">
						<div class="radio">
						<label class="radio" for="renda-0"> <input type="radio"
							name="renda" id="renda-0" value="1">
							Até 1 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-1"> <input type="radio"
							name="renda" id="renda-1" value="2"> &gt; 1 até 2 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-2"> <input type="radio"
							name="renda" id="renda-2" value="3"> &gt; 2 até 5 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-3"> <input type="radio"
							name="renda" id="renda-3" value="4"> &gt; 5 até 10 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-4"> <input type="radio"
							name="renda" id="renda-4" value="5"> &gt; 10 até 20 SM
						</label>
					</div>
					<div class="radio">
						<label class="radio" for="renda-5"> <input type="radio"
							name="renda" id="renda-5" value="6" checked="checked"> &gt; 20 SM
						</label>
					</div>
					</c:if>
				</c:if>
			</div>
		</div>

		<!-- Multiple Radios -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="escolaridade">Escolaridade</label>
			<div class="col-md-4">
				<c:if test="${cliente.escolaridade == null}">
					<div class="radio">
						<label for="escolaridade-0"> <input type="radio"
							name="escolaridade" id="escolaridade-0" value="1"
							checked="checked"> Acima de ensino superior
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-1"> <input type="radio"
							name="escolaridade" id="escolaridade-1" value="2"> Ensino
							superior - Incompleto
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-2"> <input type="radio"
							name="escolaridade" id="escolaridade-2" value="3"> Ensino
							superior - Completo
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-3"> <input type="radio"
							name="escolaridade" id="escolaridade-3" value="4"> Ensino
							médio - Incompleto
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-4"> <input type="radio"
							name="escolaridade" id="escolaridade-4" value="5"> Ensino
							médio - Completo
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-5"> <input type="radio"
							name="escolaridade" id="escolaridade-5" value="6"> Ensino
							Fundamental -Incompleto
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-6"> <input type="radio"
							name="escolaridade" id="escolaridade-6" value="7"> Ensino
							Fundamental - Completo
						</label>
					</div>
				</c:if>
				
				<c:if test="${cliente.escolaridade == 0}">
					<div class="radio">
						<label for="escolaridade-0"> <input type="radio"
							name="escolaridade" id="escolaridade-0" value="1"
							checked="checked"> Acima de ensino superior
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-1"> <input type="radio"
							name="escolaridade" id="escolaridade-1" value="2"> Ensino
							superior - Incompleto
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-2"> <input type="radio"
							name="escolaridade" id="escolaridade-2" value="3"> Ensino
							superior - Completo
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-3"> <input type="radio"
							name="escolaridade" id="escolaridade-3" value="4"> Ensino
							médio - Incompleto
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-4"> <input type="radio"
							name="escolaridade" id="escolaridade-4" value="5"> Ensino
							médio - Completo
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-5"> <input type="radio"
							name="escolaridade" id="escolaridade-5" value="6"> Ensino
							Fundamental -Incompleto
						</label>
					</div>
					<div class="radio">
						<label for="escolaridade-6"> <input type="radio"
							name="escolaridade" id="escolaridade-6" value="7"> Ensino
							Fundamental - Completo
						</label>
					</div>
				</c:if>

				<c:if test="${cliente.escolaridade != null}">
					<c:if test="${cliente.escolaridade == 1}">
						<div class="radio">
							<label for="escolaridade-0"> <input type="radio"
								name="escolaridade" id="escolaridade-0" value="1"
								checked="checked"> Acima de ensino superior
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-1"> <input type="radio"
								name="escolaridade" id="escolaridade-1" value="2">
								Ensino superior - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-2"> <input type="radio"
								name="escolaridade" id="escolaridade-2" value="3">
								Ensino superior - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-3"> <input type="radio"
								name="escolaridade" id="escolaridade-3" value="4">
								Ensino médio - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-4"> <input type="radio"
								name="escolaridade" id="escolaridade-4" value="5">
								Ensino médio - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-5"> <input type="radio"
								name="escolaridade" id="escolaridade-5" value="6">
								Ensino Fundamental -Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-6"> <input type="radio"
								name="escolaridade" id="escolaridade-6" value="7">
								Ensino Fundamental - Completo
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.escolaridade == 2}">
						<div class="radio">
							<label for="escolaridade-0"> <input type="radio"
								name="escolaridade" id="escolaridade-0" value="1"> Acima
								de ensino superior
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-1"> <input type="radio"
								name="escolaridade" id="escolaridade-1" value="2"
								checked="checked"> Ensino superior - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-2"> <input type="radio"
								name="escolaridade" id="escolaridade-2" value="3">
								Ensino superior - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-3"> <input type="radio"
								name="escolaridade" id="escolaridade-3" value="4">
								Ensino médio - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-4"> <input type="radio"
								name="escolaridade" id="escolaridade-4" value="5">
								Ensino médio - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-5"> <input type="radio"
								name="escolaridade" id="escolaridade-5" value="6">
								Ensino Fundamental -Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-6"> <input type="radio"
								name="escolaridade" id="escolaridade-6" value="7">
								Ensino Fundamental - Completo
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.escolaridade == 3}">
						<div class="radio">
							<label for="escolaridade-0"> <input type="radio"
								name="escolaridade" id="escolaridade-0" value="1"> Acima
								de ensino superior
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-1"> <input type="radio"
								name="escolaridade" id="escolaridade-1" value="2">
								Ensino superior - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-2"> <input type="radio"
								name="escolaridade" id="escolaridade-2" value="3"
								checked="checked"> Ensino superior - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-3"> <input type="radio"
								name="escolaridade" id="escolaridade-3" value="4">
								Ensino médio - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-4"> <input type="radio"
								name="escolaridade" id="escolaridade-4" value="5">
								Ensino médio - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-5"> <input type="radio"
								name="escolaridade" id="escolaridade-5" value="6">
								Ensino Fundamental -Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-6"> <input type="radio"
								name="escolaridade" id="escolaridade-6" value="7">
								Ensino Fundamental - Completo
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.escolaridade == 4}">
						<div class="radio">
							<label for="escolaridade-0"> <input type="radio"
								name="escolaridade" id="escolaridade-0" value="1"> Acima
								de ensino superior
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-1"> <input type="radio"
								name="escolaridade" id="escolaridade-1" value="2">
								Ensino superior - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-2"> <input type="radio"
								name="escolaridade" id="escolaridade-2" value="3">
								Ensino superior - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-3"> <input type="radio"
								name="escolaridade" id="escolaridade-3" value="4"
								checked="checked"> Ensino médio - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-4"> <input type="radio"
								name="escolaridade" id="escolaridade-4" value="5">
								Ensino médio - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-5"> <input type="radio"
								name="escolaridade" id="escolaridade-5" value="6">
								Ensino Fundamental -Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-6"> <input type="radio"
								name="escolaridade" id="escolaridade-6" value="7">
								Ensino Fundamental - Completo
							</label>
						</div>

					</c:if>
					<c:if test="${cliente.escolaridade == 5}">
						<div class="radio">
							<label for="escolaridade-0"> <input type="radio"
								name="escolaridade" id="escolaridade-0" value="1"> Acima
								de ensino superior
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-1"> <input type="radio"
								name="escolaridade" id="escolaridade-1" value="2">
								Ensino superior - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-2"> <input type="radio"
								name="escolaridade" id="escolaridade-2" value="3">
								Ensino superior - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-3"> <input type="radio"
								name="escolaridade" id="escolaridade-3" value="4">
								Ensino médio - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-4"> <input type="radio"
								name="escolaridade" id="escolaridade-4" value="5"
								checked="checked"> Ensino médio - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-5"> <input type="radio"
								name="escolaridade" id="escolaridade-5" value="6">
								Ensino Fundamental -Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-6"> <input type="radio"
								name="escolaridade" id="escolaridade-6" value="7">
								Ensino Fundamental - Completo
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.escolaridade == 6}">
						<div class="radio">
							<label for="escolaridade-0"> <input type="radio"
								name="escolaridade" id="escolaridade-0" value="1"> Acima
								de ensino superior
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-1"> <input type="radio"
								name="escolaridade" id="escolaridade-1" value="2">
								Ensino superior - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-2"> <input type="radio"
								name="escolaridade" id="escolaridade-2" value="3">
								Ensino superior - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-3"> <input type="radio"
								name="escolaridade" id="escolaridade-3" value="4">
								Ensino médio - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-4"> <input type="radio"
								name="escolaridade" id="escolaridade-4" value="5">
								Ensino médio - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-5"> <input type="radio"
								name="escolaridade" id="escolaridade-5" value="6"
								checked="checked"> Ensino Fundamental -Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-6"> <input type="radio"
								name="escolaridade" id="escolaridade-6" value="7">
								Ensino Fundamental - Completo
							</label>
						</div>
					</c:if>
					<c:if test="${cliente.escolaridade == 7}">
						<div class="radio">
							<label for="escolaridade-0"> <input type="radio"
								name="escolaridade" id="escolaridade-0" value="1"> Acima
								de ensino superior
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-1"> <input type="radio"
								name="escolaridade" id="escolaridade-1" value="2">
								Ensino superior - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-2"> <input type="radio"
								name="escolaridade" id="escolaridade-2" value="3">
								Ensino superior - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-3"> <input type="radio"
								name="escolaridade" id="escolaridade-3" value="4">
								Ensino médio - Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-4"> <input type="radio"
								name="escolaridade" id="escolaridade-4" value="5">
								Ensino médio - Completo
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-5"> <input type="radio"
								name="escolaridade" id="escolaridade-5" value="6">
								Ensino Fundamental -Incompleto
							</label>
						</div>
						<div class="radio">
							<label for="escolaridade-6"> <input type="radio"
								name="escolaridade" id="escolaridade-6" value="7"
								checked="checked"> Ensino Fundamental - Completo
							</label>
						</div>
					</c:if>
				</c:if>
			</div>

		</div>

		<div class="form-group" style="margin-left: 160px;">
			<div class="col-md-7">
				<input type="submit" value="RETORNO PAINEL" id="btn"
					class="btn btn-primary">
					
					<a href="/topwinner/chamarCadastroCupomECliente.winner" type="button" id="btn"
		class="btn btn-primary">CANCELAR E VOLTAR</a>
			</div>
		</div>
	</form>
</fieldset>


<div id="resultado"></div>


<script type="text/javascript" src="jquery.mask.js"></script>
<script type="text/javascript" src="jquery.cep.js"></script>
<!-- <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> -->

<script type="text/javascript">
	document.getElementById('cpfCliente').focus();
	$('#cpfCliente').mask('000.000.000-00');
	$('.cep').mask('00000-000');
	$('#celular').mask('(00) 00000-0000');
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.cep').cep();
	});
</script>

<jsp:include page="rodape.jsp"></jsp:include>