<jsp:include page="topo.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div style="text-align: center;">${msgRelatorio }</div>

<c:if test="${u.administrador == 1}">


	<form class="form-horizontal"
		action="/topwinner/totalSorteiosMesAnoADM" method="post"
		tabindex="_Blank">
		<fieldset>

			<!-- Form Name -->
			<legend>RELATÓRIO TOTAL DE SORTEIO MÊS/ANO</legend>

			<div class="form-group">
				<label class="col-md-4 control-label" for="cnpj">CNPJ: </label>
				<div class="col-md-4">
					<input id="cnpj" name="cnpj" type="text"
						placeholder="00.000.000/0000-00" class="form-control input-md"
						required="">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="ano">ANO:</label>
				<div class="col-md-4">

					<select id="ano" name="ano" type="text" class="form-control">
						<option>Escolha o ano</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
						<option value="2021">2021</option>
						<option value="2022">2022</option>
						<option value="2023">2023</option>
						<option value="2024">2024</option>
						<option value="2025">2025</option>
						<option value="2026">2026</option>
						<option value="2027">2027</option>
						<option value="2028">2028</option>
						<option value="2029">2029</option>
						<option value="2030">2030</option>
						<option value="2031">2031</option>
						<option value="2032">2032</option>
						<option value="2033">2033</option>
					</select>

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="mes">MÊS:</label>
				<div class="col-md-4">

					<select id="mes" name="mes" type="text" class="form-control">
						<option>Escolha o mês</option>
						<option value="01">Janeiro</option>
						<option value="02">Fevereiro</option>
						<option value="03">Março</option>
						<option value="04">Abril</option>
						<option value="05">Maio</option>
						<option value="06">Junho</option>
						<option value="07">Julho</option>
						<option value="08">Agosto</option>
						<option value="09">Setembro</option>
						<option value="10">Outubro</option>
						<option value="11">Novembro</option>
						<option value="12">Dezembro</option>
					</select>
				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for=""></label>
				<div class="col-md-4">
					<button id="" name="" class="btn btn-default"
						onclick="this.form.target='_self'">EMITIR RELATÓRIO
						SORTEIOS</button>
				</div>
			</div>

		</fieldset>
	</form>
	
	
	<form class="form-horizontal"
		action="/topwinner/evolutivo" method="post"
		tabindex="_Blank">
		<fieldset>

			<!-- Form Name -->
			<legend>RELATÓRIO EVOLUTIVO</legend>

			<div class="form-group">
				<label class="col-md-4 control-label" for="cnpj">CNPJ: </label>
				<div class="col-md-4">
					<input id="cnpj" name="cnpj" type="text"
						placeholder="00.000.000/0000-00" class="form-control input-md"
						required>

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for=""></label>
				<div class="col-md-4">
					<button id="" name="" class="btn btn-default"
						onclick="this.form.target='_self'">EMITIR RELATÓRIO
						EVOLUTIVO</button>
				</div>
			</div>

		</fieldset>
	</form>


</c:if>

<script src="../dist/js/jquery.mask.js"></script>

<script>
	$(document).ready(function() {
		$('#cnpj').mask('00.000.000/0000-00');
	});
</script>

<jsp:include page="rodape.jsp"></jsp:include>